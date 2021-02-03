#!/usr/bin/env bash
set -e

_HIPE_OPTIONS="[native,{hipe,[o3]}]"

MAIN_APP="basilisk"
# skip non-runtime apps
NO_HIPE=("credo" "dialyxir" "distillery" "excoveralls" "ex_doc")
# skip incompatible apps
NO_HIPE+=("argon2_elixir")

# default to dev env
_=${MIX_ENV:=dev}

# get a list of all apps to be compiled
declare -a APPS
readarray APPS <<<"$(mix deps.tree --only $MIX_ENV --format plain | cut -d'-' -f3 | cut -d' ' -f2)"

wants_hipe() {
  for skip in "${NO_HIPE[@]}"; do
    if [[ "$1" == "$skip" ]]; then
      return 1
    fi
  done
  return 0
}

declare -a hipe_targets
declare -a normal_targets
for app in "${APPS[@]%?}"; do
  if wants_hipe "$app"; then
    if [[ "$app" != "$MAIN_APP" ]]; then
      hipe_targets+=("$app")
    fi
  else
    normal_targets+=("$app")
  fi
done

echo "=== HiPE ==="
ERL_COMPILER_OPTIONS=$_HIPE_OPTIONS mix deps.compile "${hipe_targets[@]}"
echo "=== BEAM ==="
mix deps.compile "${normal_targets[@]}"
echo "=== ${MAIN_APP} ==="
ERL_COMPILER_OPTIONS=$_HIPE_OPTIONS mix compile

set +e

#!/usr/bin/env bash

# The protobuf source folder
IN_DIR='proto_buf'
# The folder to place the compilation folder into
# The compilation folder always shares a name with the IN_DIR
#  so this cannot be blank
OUT_DIR='lib'


! getopt --test > /dev/null
if [[ ${PIPESTATUS[0]} -ne 4 ]]; then
  echo "error: this script requires enhanced getopt"
  exit 1
fi
! PARSED=$(getopt --options=f --longoptions=force --name "mix protoc" -- "$@")
if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
  # getopt was passed an illegal option
  exit 2
fi
eval set -- "$PARSED"
FORCE=n
while true; do
  case "$1" in
    -f|--force)
      FORCE=y
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "error: illegal option"
      exit 3
      ;;
  esac
done

needs_compiling() {
  # the infile ($1) needs to be compiled if
  #  a) the outfile doesn't exist, or
  #  b) the outfile is older than the infile
  local outfile="$OUT_DIR/${1%.proto}.pb.ex"
  if [[ -e "$outfile" ]]; then
    if [[ "$outfile" -ot "$1" ]]; then
      # the outfile is older than the infile, so we need to recompile
      return 0
    else
      # the outfile exists and is newer than the infile
      #  so we don't need to do anything
      return 1
    fi
  else
    # the outfile doesn't exist, so we need to compile
    return 0
  fi
}

# Create the output directory if it doesn't exist
mkdir -p "./$OUT_DIR/$IN_DIR/"

# Populate an array with the names of files that need to be recompiled
recompile_targets=()
for pb in "$IN_DIR"/*.proto; do
  if [[ $FORCE = "y" ]]; then
    # we want to recompile everything, so just add it to the array
    recompile_targets+=("$pb")
  elif needs_compiling "$pb"; then
    recompile_targets+=("$pb")
  fi
done

if [[ ${#recompile_targets[@]} -gt 0 ]]; then
  # there's at least one item in need of compiling
  #  so we tell the user and get to work
  echo "Compiling ${#recompile_targets[@]} files (.proto)"

  protoc -I "$IN_DIR" --elixir_out="./$OUT_DIR/$IN_DIR/" "${recompile_targets[@]}"
fi

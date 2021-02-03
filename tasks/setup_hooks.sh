#!/usr/bin/env bash
set -e

cd .git-hooks
for hook in * ; do
  cp "$hook" "../.git/hooks/${hook%.sh}"
  chmod +x "../.git/hooks/${hook%.sh}"
done

set +e

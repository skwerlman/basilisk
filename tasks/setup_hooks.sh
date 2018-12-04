#!/usr/bin/env bash

cd .git-hooks
for hook in * ; do
  cp "$hook" "../.git/hooks/${hook%.sh}"
  chmod +x "../.git/hooks/${hook%.sh}"
done

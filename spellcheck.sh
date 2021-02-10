#!/bin/bash
set -euo pipefail

PATTERN="*.md"

echo "--- Checkng files for misspelt words"

WORDS=()

for i in $(find . -name $PATTERN)
do
  WORDS+=$(cat $i |docker run -i starefossen/aspell list)
done

echo -e "Found the following misspelt words:\n${WORDS}"

buildkite-agent annotate "Found the following misspelt words:\n${WORDS}"


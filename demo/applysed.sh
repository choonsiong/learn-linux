#!/bin/bash

# By default IFS set to tabs, spaces, and line breaks
IFS=$'\n' # word separation to occur only on a newline character, the preceding $ ensures that \n is parsed correctly
for fn in $*; do
    echo "processing ${fn}..."
    # first create backup file
    cp "$fn" "${fn%.*}.bak" # all characters starting from the first dot in the file name are deleted, then .bak is appended
    # then apply sed
    sed -f ./sedfile < "${fn%.*}.bak" > "$fn"
done
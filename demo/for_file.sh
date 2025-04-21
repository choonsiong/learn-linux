#!/bin/bash

IFS=$'\n'
for file in $*; do
    cp "$file" "$file.bak"
done
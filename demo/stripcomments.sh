#!/bin/bash

# Eliminates all lines that starts with the # or ; characters or are completely empty
# ^[[:space:]]*# pattern finds lines starting with #, where there may be any number of spaces and tab characters between the start of the line (^) and #
# ^$ pattern applies to empty lines consisting only of the beginning and end of line ($)
grep -Ev '^[[:space:]]*#|^[[:space:]]*;|^$' $1
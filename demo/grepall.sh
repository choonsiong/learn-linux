#!/bin/bash

# -mtime 7 find files modified exactly 7 days ago
# {} is a placeholder for the current file
# \; ends the -exec clause, the semicolon must be escaped (\;) or quoted (';') so the shell doesn't interpret it
find . -type f -mtime 7 -exec grep -q $1 {} \; -print
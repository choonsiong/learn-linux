#!/bin/bash

find . -type f -mtime 7 -exec grep -q $1 {} \; -print
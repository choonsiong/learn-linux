#!/bin/bash

mapfile usernames < users.txt

for item in "${usernames[@]}"; do
    echo -n "$item"
done

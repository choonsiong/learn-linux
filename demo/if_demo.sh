#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Two parameters are required: <username> <password>"
    exit 2
else
    username=$1
    password=$2
    echo "Username is: $username"
    echo "Password is: $password"
fi
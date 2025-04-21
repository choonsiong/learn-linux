#!/bin/bash

echo -n "Yes/no? "
read answer
case $answer in
    y | yes) echo "yes";;
    n | no) echo "no";;
    *) echo "Invalid input";;
esac
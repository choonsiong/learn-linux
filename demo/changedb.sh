#!/bin/bash

for db in $(cat /etc/mydbs.txt); do
    mysql $db < updates.sql
done
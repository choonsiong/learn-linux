#!/bin/bash

# Executes the SQL commands in updates.sql on all databases listed in /etc/mydbs.txt
for db in $(cat /etc/mydbs.txt); do
    mysql $db < updates.sql
done
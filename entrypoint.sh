#!/bin/bash

# add custom id and password to secure nut-server
echo "$ID|$PASSWORD" >> /nut/conf/users.conf

# change location of files
jq '.paths.scan[0] = "/games"' /nut/conf/nut.default.conf > /nut/conf/nut.conf

# NUT
python3 /nut/nut.py -S >> /var/log/nut.log

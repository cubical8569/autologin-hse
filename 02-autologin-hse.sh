#!/bin/bash

if [ "$1 $2" = 'wlp2s0 up' ] || [ "$2" == "connectivity-change" ]
then
    essid=$(iwconfig wlp2s0 | grep -o 'ESSID:".*$' | sed 's/^ESSID:"\(.*\)".*$/\1/')
    if [ "$essid" = 'HSE' ]
    then
        POST 192.0.2.1/login.html <<< 'username=hseguest&password=hsepassword'
    fi
fi

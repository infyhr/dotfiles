#!/bin/sh
#cmd=`curl --silent "http://weather.yahooapis.com/forecastrss?w=850357&u=c" | grep -ow 'temp="[0-9][0-9]"' | cut -c7-8`
cmd=`curl --silent "http://weather.yahooapis.com/forecastrss?w=850357&u=c" | grep -o -e 'temp="[0-9]*"' | grep -o "[0-9]*"`
echo $cmd

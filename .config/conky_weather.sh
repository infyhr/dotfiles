#!/bin/sh
#cmd=`curl --silent "http://weather.yahooapis.com/forecastrss?w=850357&u=c" | grep -ow 'temp="[0-9][0-9]"' | cut -c7-8`
CMD=`curl --silent "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22Zagreb%2C%20Croatia%22)%20and%20u=%27c%27&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys" | grep -oP 'temp="([0-9]+)"' | cut -d '"' -f 2`
echo $CMD
#echo $cmd

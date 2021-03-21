#!/bin/bash

# <bitbar.title>Check Weather SG</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Lim Chee Aun</bitbar.author>
# <bitbar.author.github>cheeaun</bitbar.author.github>
# <bitbar.desc>Singapore rain radar quick preview</bitbar.desc>
# <bitbar.image>https://github.com/cheeaun/xbar-plugins/raw/main/check-weather-sg/screenshot.png</bitbar.image>
# <bitbar.abouturl>https://github.com/cheeaun/xbar-plugins</bitbar.abouturl>

radar=$(curl -s https://rainshot.checkweather.sg/ | base64)
sgCoverage=$(curl -s https://api.checkweather.sg/v2/rainarea | sed -E 's/.*sg":([0-9.]+).*/\1/')
hour=$(date +%H)

# 🌧🌦⛈🌤☁️🌞🌝

if (( $hour >= 7 & && $hour <= 19 ))
  then
  if (( sgCoverage > 5))
  then
    icon=🌤
  elif (( sgCoverage > 20 ))
  then
    icon=🌦
  elif (( sgCoverage > 50 ))
  then
    icon=🌧
  elif (( sgCoverage > 75 ))
  then
    icon=⛈
  else
    icon=🌞
  fi
else
  if (( sgCoverage > 5 ))
  then
    icon=☁️
  elif (( sgCoverage > 50 ))
  then
    icon=🌧
  elif (( sgCoverage > 75 ))
  then
    icon=⛈
  else
    icon=🌝
  fi
fi

echo $icon $sgCoverage%
echo ---
echo Check Weather SG
echo Rain coverage over Singapore: $sgCoverage%
echo "| image=$radar | href=https://checkweather.sg"

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
hour=${hour#0}

# 🌧🌦⛈🌤☁️🌞🌝

if (( $hour >= 7 && $hour <= 19 ))
  then
  if (( $(echo "$sgCoverage > 75" | bc -l) ))
  then
    icon=⛈
  elif (( $(echo "$sgCoverage > 50" | bc -l) ))
  then
    icon=🌧
  elif (( $(echo "$sgCoverage > 20" | bc -l) ))
  then
    icon=🌦
  elif (( $(echo "$sgCoverage > 5" | bc -l) ))
  then
    icon=🌤
  else
    icon=🌞
  fi
else
  if (( $(echo "$sgCoverage > 75" | bc -l) ))
  then
    icon=⛈
  elif (( $(echo "$sgCoverage > 50" | bc -l) ))
  then
    icon=🌧
  elif (( $(echo "$sgCoverage > 5" | bc -l) ))
  then
    icon=☁️
  else
    icon=🌝
  fi
fi

echo $icon $sgCoverage%
echo ---
echo Check Weather SG
echo Rain coverage over Singapore: $sgCoverage%
echo "| image=$radar | href=https://checkweather.sg"

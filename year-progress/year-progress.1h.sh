#!/bin/bash

# <bitbar.title>Year Progress</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Lim Chee Aun</bitbar.author>
# <bitbar.author.github>cheeaun</bitbar.author.github>
# <bitbar.desc>Progress bar for the year</bitbar.desc>
# <bitbar.image></bitbar.image>
# <bitbar.abouturl>https://github.com/cheeaun/xbar-plugins</bitbar.abouturl>

days=$(date +%j)
year=$(date +%Y)
daysYear=$(( ($year % 4 == 0 && $year % 100 != 0) || $year % 400 == 0 ? 366 : 365 ))
daysPercentage=$(expr $days \* 100 / $daysYear)
daysLeft=$(expr $daysYear - $days)

progressWidth=10
progress=$(expr $days \* $progressWidth / $daysYear)
nonProgress=$(expr $progressWidth - $progress)
progressbar=$(printf '▓%.0s' $(eval "echo {1.."$(($progress))"}"))
nonProgressbar=$(printf '_%.0s' $(eval "echo {1.."$(($nonProgress))"}"))

echo $progressbar$nonProgressbar $daysPercentage%
echo ---
echo Year Progress
echo Days left: $daysLeft
#!/bin/bash
GREEN=`tput setaf 2`
NC=`tput sgr0`
echo ${GREEN}"From which ip were the most requests?"${NC}
cat apache_logs.txt | awk '{print $1}'| sort | uniq -c | sort -bnr | head -n 3


echo ${GREEN}"What is the most requested page?"${NC}
cat apache_logs.txt | awk '{print $7}'| sort | uniq -c | sort -bnr | head -n 3


echo ${GREEN}"What non-existent pages were clients referred to?"${NC}
cat apache_logs.txt | awk '{ if ($9 == 302) {print $7} }' | uniq 



echo ${GREEN}"What time did site get the most requests?"${NC}
cat apache_logs.txt | awk -F':' '{print "hour:" $2}' | sort -r | uniq -c


echo ${GREEN}"What search bots have accessed the site?"${NC}
cat apache_logs.txt | awk -F'(' '{print $2}' | awk '{print $2}' | sort | uniq | grep -i bot


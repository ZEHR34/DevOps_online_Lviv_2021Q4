#!/bin/bash
RED=`tput setaf 2`
NC=`tput sgr0`
echo ${RED}Check the access to the Internet${NC}
ping 8.8.8.8 -c 2 | tail -n 4
echo
echo ${RED}Check the route from VM2 to Host.${NC}
tracepath 192.168.1.109
echo
echo ${RED}Determine, which resource has an IP address 8.8.8.8.${NC}
nmap 8.8.8.8 -p 1-1023 | grep open

echo
echo ${RED}Determine, which IP address belongs to resource epam.com.${NC}
nslookup epam.com | tail -n 2
echo
echo ${RED}Determine the default gateway for your HOST and display routing table.${NC}
route
echo
echo ${RED}Trace the route to google.com.${NC}
tracepath google.com


#!/bin/bash
function scannet {
  IP=`hostname -I | awk '{print $1}'`
  MASK=`ifconfig | grep "$IP" | awk '{print $4}'`
  IFS=. read -r i1 i2 i3 i4 <<< "$IP"
  IFS=. read -r m1 m2 m3 m4 <<< "$MASK"
  NET=`printf "%d.%d.%d.%d\n" "$((i1 & m1))" "$((i2 & m2))" "$((i3 & m3))" "$((i4 & m4))"`
  MASKLEN=`ip a | grep "$IP" | awk '{print $2}' | awk -F'/' '{print $2}'`
  ALLNET="$NET/$MASKLEN"
  nmap -sn $ALLNET | grep "Nmap scan" | awk '{print $6 " " $5}' | sed 's/(//;s/)//'
  
}

function scantargert {
  nmap $1 | grep open
}

if [ -n "$1"  ]
then
  if [ "$1" == --all ]
  then
    scannet
  elif [ "$1" == --target ] && [ -n "$2" ]
  then
    scantargert $2
  else
    echo use --all or --target HOST
  fi
else
  echo use --all or --target HOST
fi

#!/bin/bash

logfile="/var/lib/zabbix/performance-stats-$(date +'%d-%m-%Y').log"

{
echo -e "\nCPU Statistics\n"
top -n 1 -b -o %CPU | head -30

echo -e "\n\nMemory Statistics\n"
top -n 1 -b -o %MEM | head -30

echo -e "\n\nIO Statistics\n"
iotop -o -b -n 1 -q

echo -e "\n\nTraffic Statistics\n"
iftop -nNPt -i ens192 -s 5
} > "$logfile"

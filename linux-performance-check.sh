#!/bin/bash

logfile="/var/lib/zabbix/performance-stats-$(date +'%d-%m-%Y').log"

echo -e "\nCPU Statistics\n" >> $logfile
top -n 1 -b -o %CPU | head -30 >> $logfile
echo -e "\n\nMemory Statistics\n" >> $logfile
top -n 1 -b -o %MEM | head -30 >> $logfile
echo -e "\n\nIO Statistics\n" >> $logfile
iotop -o -b -n 1 -q >> $logfile
echo -e "\n\nTraffic Statistics\n" >> $logfile
iftop -nNPt -i ens192 -s 5 >> $logfile

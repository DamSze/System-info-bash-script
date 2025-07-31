#!/usr/bin/env bash

#TOTAL CPU usage

CPU_TOT=`top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8 "%"}'`
echo "Total CPU usage: 
$CPU_TOT"

#Memmory
MEM_USED=`free --human| awk 'NR==2 {print $3}'`
MEM_FREE=`free --human| awk 'NR==2 {print $4}'`
MEM_TOT=`free --human| awk 'NR==2 {print $2}'`

MEM_USED_1=`free | awk 'NR==2 {print $3}'`
MEM_TOT_1=`free | awk 'NR==2 {print $2}'`
MEM_PERCENT=`echo "scale = 2; $MEM_USED_1 *100 / $MEM_TOT_1" | bc`

echo "memmory used: $MEM_USED ($MEM_PERCENT %) | $MEM_FREE (total)"
printf "\n"

#DISK

DISK_TOT=`df -h | awk 'NR==2 {print $2}'`
DISK_USED=`df -h | awk 'NR==2 {print $3}'`
DISK_PERCENT=`df -h | awk 'NR==2 {print $5}'`
echo "disk used: $DISK_USED ($DISK_PERCENT) | $DISK_TOT (total)"
printf "\n"

#CPU process usage
CPU_PROCESSES=`top -b -n 1 -o %CPU | head -12 | awk 'NR>7 {printf "%4-s %4-s %4-s \n", $1, $9, $12}'`
echo "top 5 CPU process usage:
$CPU_PROCESSES"
printf "\n"

#MEMMORY PROCESSES
MEM_PROCESSES=`top -b -n 1 -o %MEM | head -12 | awk 'NR>7 {printf "%4-s %4-s %4-s \n", $1, $10, $12}'`
echo "top 5 MEM process usage:
$MEM_PROCESSES"



#!/bin/bash
FILENAME=report-cp-$(hostname).txt
DATEREPORT=$(date)
CPUSPECS=$(lscpu)
IPADDRESS=IDADDRESS=$( ip addr | grep -oP 'inet\s+\K[\d.]+(?=/)' | grep -v '127*' | grep -v '172*')
MACCADDRESS=$(ip link show | awk '/link\/ether/ {print $2}')
touch $FILENAME
echo "HOSTNAME: $(hostname)" >> $FILENAME
echo "DATE REPORT: $DATEREPORT" >> $FILENAME
echo "CPU Specs:" >> $FILENAME
lscpu >> $FILENAME
echo "Hardware Spec:" >> $FILENAME
lshw >> $FILENAME
lsdev >> $FILENAME
echo "Netwowrk Info: " >> $FILENAME
echo -e $IPADDRESS >> $FILENAME
echo -e "MAC ADDRESS:\n$MACCADDRESS" >> $FILENAME

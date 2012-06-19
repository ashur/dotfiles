#!/bin/bash

for (( i = 1; i <= $1 ; i++ ))
do
	FILE="$i.txt"
	echo $i $FILE
	touch $FILE
#	dd if=/dev/zero of=$FILE count=1 bs=1m
done
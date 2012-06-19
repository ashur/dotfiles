#!/bin/bash

SRCFILE=`basename $1`
for (( i = 1; i <= $2 ; i++ ))
do
	FILE="$i-$SRCFILE"
	echo $FILE
	cp $1 $FILE
done
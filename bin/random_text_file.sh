#!/bin/sh
 
# Variables; 2000000 = 2MB
max_size=2000000
filename=result.txt
tmpfilename=tmp.txt
string="abcdefghijklmnopqrstuvwxyz 123456890"
 
# File checks so we don't overwrite somebody's important files
if [ -e $tmpfilename ]; then
        echo "File: $tmpfilename exists!"
        echo "This script is going to use this as a temporary file, so either"
        echo "modify the script variable \$tmpfilename or remove the file."
        exit 1
fi
 
if [ -e $filename ]; then
        echo "File: $filename exists!"
        echo "Remove it and restart this script"
        exit 1
else
        echo $string > $filename
fi
 
# Initialize the variable
size=$(stat -f "%z" $filename)
 
# Start the loop, increasing the size of the file 2x until reaching max_size
while [ $size -lt $max_size ]; do
        cat $filename > $tmpfilename
        cat $tmpfilename >> $filename
        size=$(stat -f "%z" $filename)
done
 
# Chop off any excess
head -c $max_size $filename > $tmpfilename
mv $tmpfilename $filename

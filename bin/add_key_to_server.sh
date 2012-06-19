#!/bin/bash

## USAGE: add_to_server.sh remote_server

## This script will add your ssh dsa public key to remote_server's authorized_keys list, 
## assuming that everything is in it's default location

set -v 				# verbose output
username=$1		# CHANGE ME!!!!
remote_server=$2		# assigns the first commandline argument to $remote_server


## Pipe the public key to ssh, then remotely touch the file to make sure it will be there, and concat to the end of it.
## Might work without the touch?
cat ~/.ssh/id_dsa.pub | ssh ${username}@${remote_server} "touch ~/.ssh/authorized_keys2 && cat - >> ~/.ssh/authorized_keys2 && chmod 600 ~/.ssh/authorized_keys2"

exit 0

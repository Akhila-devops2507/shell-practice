#!/bin/bash

echo "All variables passed: $*"
echo "All variables passed: $@"
echo "Number of variables passed: $#"
echo "Script name: $0"
echo "current directory: $PWD"
echo "Last command exit status: $?"
echo "Current process ID: $$"
echo "Previous process ID: $!"
echo "Home directory: $HOME"
echo "who is running this script: $USER"
echo "home directory of the user running this script: $HOME"
sleep 30 &
echo "PID of last background command: $!"

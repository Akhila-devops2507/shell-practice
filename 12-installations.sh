#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script as root user"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "MySQL installed successfully"
else
    echo "Error:: MySQL installation failed"
    exit 1
fi
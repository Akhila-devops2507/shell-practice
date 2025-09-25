#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script with the root privileges"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Error:: MySQL installation failed"
    exit 1
else
    echo "MySQL installation is successful"
    exit 0
fi

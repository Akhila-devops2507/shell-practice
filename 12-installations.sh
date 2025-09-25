#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script with the root privelege"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: MySQL installation is failure"
    exit 1
else
    echo "MySQL installation is successful"
fi

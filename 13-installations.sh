#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script with the root privileges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Error:: MySQL installation failed"
    exit 1
else
    echo "MySQL installation is successful"
    exit 0
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Error:: nginx installation failed"
    exit 1
else
    echo "nginx installation is successful"
    exit 0
fi

dnf install mongodb-mongosh -y

if [ $? -ne 0 ]; then
    echo "Error:: mongodb-mongosh installation failed"
    exit 1
else
    echo "mongodb-mongosh installation is successful"
    exit 0
fi


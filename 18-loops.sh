#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

logs_folder="/var/logs/shell-scripts"
script_name=$( echo $0 | cut -d "." -f1 )
log_file="$logs_folder/$script_name.log"

mkdir -p $logs_folder
echo "script started executed at: $(date)" | tee -a $log_file

if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script with the root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 ... $R failure $N" | tee -a $log_file
        exit 1
    else
        echo -e "installing $2 ... $R success $N" | tee -a $log_file
    fi
}

# $@

for package in $@
do
   # check package is already installed or not
    dnf list installed $package &>>$LOG_FILE

    # if exit status is 0, already installed. -ne 0 need to install it
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package already installed ... $Y SKIPPING $N"
    fi
done    

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
echo "script started executed at: $(date)"

if [ $USERID -ne 0 ]; then
    echo "Error:: Please run this script with the root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "installing $2 ... $R failure $N"
        exit 1
    else
        echo -e "installing $2 ... $R success $N"
    fi
}

dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$log_file
    VALIDATE $? "mysql"
else
    echo -e "MySQL is already exist ... $Y skipping $N"
fi   

dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$log_file
    VALIDATE $? "nginx"
else
    echo -e "nginx is already exist ... $Y skipping $N"
fi

dnf list installed python3 &>>$log_file
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$log_file
    VALIDATE $? "python3"
else
    echo -e "python3 is already exist ... $Y skipping $N"
fi



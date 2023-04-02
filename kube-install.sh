#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkidir -p home/ec2-user/eks-cluser-install
cd home/ec2-user/eks-cluser-install


LOG=eks-cluster-install.log
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ]; then 
    echo -e "$R you are not root user, you need rro permissions for this $N"
    exit 1
fi 

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e " $2...$R Failed.. $N"
        exit 1
    else 
        echo -e " $2.. $G success..... $N"
     fi
}

curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &>>LOG
VALIDATE $? "Dowloaded AWS CLI V2"

aws_floder="aws"
if [ -d "$aws_folder"]; then 
    echo -e "AWS folder alredy exits ...$Y Skipping unzip $N"
else 
    unzip awscliv2.zip &>>LOG
    VALIDATE "unzip Aws cli v2"
fi

#!/bin/bash

color="\e[35m"
nocolor="\e[0m"

nodejs_setup() {
  echo -e "${color}Disable default NodeJS${nocolor}"
  dnf module disable nodejs -y &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Enable NodeJS 20${nocolor}"
  dnf module enable nodejs:20 -y &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Install NodeJS 20${nocolor}"
  dnf install nodejs -y &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Add roboshop user${nocolor}"
  useradd roboshop || echo "User already exists" &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Copy systemd service file${nocolor}"
  cp ${component}.service /etc/systemd/system/${component}.service &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Remove existing application directory${nocolor}"
  rm -rf /app &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Create /app directory${nocolor}"
  mkdir /app &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Download application content${nocolor}"
  curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Extract downloaded content${nocolor}"
  unzip /tmp/${component}.zip -d /app &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Install NodeJS dependencies${nocolor}"
  cd /app &>>/tmp/roboshop.log
  npm install &>>/tmp/roboshop.log &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Reload systemctl daemon${nocolor}"
  systemctl daemon-reload &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Enable ${component} service${nocolor}"
  systemctl enable ${component} &>>/tmp/roboshop.log
  echo Status - $?

  echo -e "${color}Restart ${component} service${nocolor}"
  systemctl restart ${component} &>>/tmp/roboshop.log
  echo Status - $?
}

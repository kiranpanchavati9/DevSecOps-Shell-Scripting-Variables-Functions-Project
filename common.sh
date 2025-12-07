#!/bin/bash

color="\e[35m"
nocolor="\e[0m"
LOGFILE=/tmp/roboshop.log

check_status() {
  if [ $1 -eq 0 ]; then
    echo -e "${color}Status - SUCCESS${nocolor}"
  else
    echo -e "${color}Status - FAILED${nocolor}"
    exit 1
  fi
}

systemd_setup() {
  echo -e "${color}Reload systemctl daemon${nocolor}"
  systemctl daemon-reload &>>$LOGFILE
  check_status $?

  echo -e "${color}Enable ${component} service${nocolor}"
  systemctl enable ${component} &>>$LOGFILE
  check_status $?

  echo -e "${color}Restart ${component} service${nocolor}"
  systemctl restart ${component} &>>$LOGFILE
  check_status $?
}

app_prereq() {
  echo -e "${color}Copy systemd service file${nocolor}"
  cp ${component}.service /etc/systemd/system/${component}.service &>>$LOGFILE
  check_status $?

  echo -e "${color}Add roboshop user${nocolor}"
  id roboshop &>>$LOGFILE || useradd roboshop &>>$LOGFILE
  check_status $?

  echo -e "${color}Remove existing /app directory${nocolor}"
  rm -rf /app &>>$LOGFILE
  check_status $?

  echo -e "${color}Create /app directory${nocolor}"
  mkdir /app &>>$LOGFILE
  check_status $?

  echo -e "${color}Download application content${nocolor}"
  curl -L -o /tmp/${component}.zip https://roboshop-artifacts.s3.amazonaws.com/${component}-v3.zip &>>$LOGFILE
  check_status $?

  echo -e "${color}Extract downloaded content${nocolor}"
  unzip /tmp/${component}.zip -d /app &>>$LOGFILE
  check_status $?
}

nodejs_setup() {
  echo -e "${color}Disable default NodeJS${nocolor}"
  dnf module disable nodejs -y &>>$LOGFILE
  check_status $?

  echo -e "${color}Enable NodeJS 20${nocolor}"
  dnf module enable nodejs:20 -y &>>$LOGFILE
  check_status $?

  echo -e "${color}Install NodeJS 20${nocolor}"
  dnf install nodejs -y &>>$LOGFILE
  check_status $?

  app_prereq

  echo -e "${color}Install NodeJS Dependencies${nocolor}"
  cd /app
  npm install &>>$LOGFILE
  check_status $?

  systemd_setup
}

python_setup() {
  echo -e "${color}Install Python${nocolor}"
  dnf install python3 gcc python3-devel -y &>>$LOGFILE
  check_status $?

  app_prereq

  echo -e "${color}Install Python Dependencies${nocolor}"
  cd /app
  pip3 install -r requirements.txt &>>$LOGFILE
  check_status $?

  systemd_setup
}


java_setup() {
  echo -e "${color}Install Maven${nocolor}"
  dnf install maven -y &>>$LOGFILE
  check_status $?

  app_prereq

  cd /app

  echo -e "${color}Download Java Dependencies & Build Application${nocolor}"
  mvn clean package &>>$LOGFILE
  check_status $?

  echo -e "${color}Rename JAR file${nocolor}"
  mv target/${component}-1.0.jar ${component}.jar &>>$LOGFILE
  check_status $?

  systemd_setup
}

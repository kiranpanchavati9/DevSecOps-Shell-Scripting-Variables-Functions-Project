source common.sh

cp mongo.repo /etc/yum.repos.d/mongo.repo
component=catalogue

nodejs_setup

dnf install mongodb-mongosh -y
mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js



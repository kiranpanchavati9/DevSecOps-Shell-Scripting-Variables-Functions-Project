source common.sh
component=shipping
java_setup

# Install MySQL client package
dnf install mysql -y

# Load DB schema and data using roboshop user
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/master-data.sql



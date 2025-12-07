source common.sh
component=shipping
java_setup

# Install MySQL client package
dnf install mysql -y

for sqlfile in schema app-user master-data; do
  # Load DB schema and data using roboshop user
  mysql -h mysql-dev.kiranpanchavati.online -uroot -pRoboShop@1 < /app/db/${sqlfile}.sql
done
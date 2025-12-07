# Shipping.sh Script

#dnf install maven -y

#useradd roboshop
#cp shipping.service /etc/systemd/system/shipping.service

#mkdir /app

#curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
#cd /app
#unzip /tmp/shipping.zip

#cd /app
##mvn clean package
#mv target/shipping-1.0.jar shipping.jar

#dnf install mysql -y
#mysql -h mysql-dev.kiranpanchavati.online -uroot -pRoboShop@1 < /app/db/schema.sql
#mysql -h mysql-dev.kiranpanchavati.online -uroot -pRoboShop@1 < /app/db/app-user.sql
#mysql -h mysql-dev.kiranpanchavati.online -uroot -pRoboShop@1 < /app/db/master-data.sql


#systemctl restart shipping


#systemctl daemon-reload


#systemctl enable shipping
#systemctl restart shipping


# Shipping.sh Script

dnf install maven -y

id roboshop || useradd roboshop
cp shipping.service /etc/systemd/system/shipping.service

mkdir -p /app

curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping-v3.zip
cd /app
unzip -o /tmp/shipping.zip

cd /app
mvn clean package
mv target/shipping-1.0.jar shipping.jar

# Install MySQL client package
dnf install mysql -y

# Load DB schema and data using roboshop user
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/schema.sql
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/app-user.sql
mysql -h mysql-dev.kiranpanchavati.online -uroboshop -pRoboShop@1 < /app/db/master-data.sql

systemctl daemon-reload
systemctl enable shipping
systemctl restart shipping

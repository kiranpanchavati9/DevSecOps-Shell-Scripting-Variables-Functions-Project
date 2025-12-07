#dnf install mysql-server -y

#systemctl enable mysqld
#systemctl restart mysqld

#mysql_secure_installation --set-root-pass RoboShop@1

#!/bin/bash

dnf install mysql-server -y

systemctl enable mysqld
systemctl restart mysqld

# Root password already set, so update script to use password
mysql -uroot -pRoboShop@1 <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'RoboShop@1';
FLUSH PRIVILEGES;
EOF


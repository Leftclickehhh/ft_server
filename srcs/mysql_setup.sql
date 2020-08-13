CREATE USER 'sde-kok'@'localhost' identified by 'password';

CREATE DATABASE wordpress;
CREATE DATABASE phpmyadmin;

GRANT ALL PRIVILEGES ON *.* TO 'sde-kok'@'localhost' IDENTIFIED BY 'password';

FLUSH PRIVILEGES;
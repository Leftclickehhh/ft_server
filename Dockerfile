FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx mariadb-server openssl unzip
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring

COPY ./srcs/start.sh /var/
COPY ./srcs/mysql_setup.sql /var/
COPY ./srcs/wordpress.sql /var/
COPY ./srcs/indexswap.sh /var/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

WORKDIR /var/www/html/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip ./phpMyAdmin.zip
RUN unzip phpMyAdmin.zip && rm -rf phpMyAdmin.zip
COPY ./srcs/config.inc.php phpmyadmin

ADD http://wordpress.org/latest.tar.gz ./wordpress.tar.gz
RUN tar xf ./wordpress.tar.gz && rm -rf wordpress.tar.gz
RUN chmod 755 -R wordpress

RUN service mysql start && mysql -u root mysql < /var/mysql_setup.sql && mysql wordpress -u root --password= < /var/wordpress.sql
RUN openssl req -x509 -nodes -newkey rsa:2048 -subj '/CN=localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
# rewrite this line
RUN chown -R www-data:www-data *
RUN chmod 755 -R *
# is this line needed?
CMD bash /var/start.sh && tail -f /dev/null
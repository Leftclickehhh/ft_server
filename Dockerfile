FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx mariadb-server wget
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring

COPY ./srcs/start.sh /var/
COPY ./srcs/mysql_setup.sql /var/
COPY ./srcs/wordpress.sql /var/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

WORKDIR /var/www/html/
ADD https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz ./phpMyAdmin-4.9.1-english.tar.gz
RUN tar xf phpMyAdmin-4.9.1-english.tar.gz && rm -rf phpMyAdmin-4.9.1-english.tar.gz
RUN mv phpMyAdmin-4.9.1-english phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

ADD http://wordpress.org/latest.tar.gz ./wordpress.tar.gz
RUN tar xf ./wordpress.tar.gz && rm -rf wordpress.tar.gz
RUN chmod 755 -R wordpress

RUN service mysql start && mysql -u root mysql < /var/mysql_setup.sql && mysql wordpress -u root --password= < /var/wordpress.sql
RUN openssl req -x509 -nodes -newkey rsa:2048 -subj '/CN=localhost' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt
RUN chown -R www-data:www-data *
RUN chmod 755 -R *

CMD bash /var/start.sh && tail -f /dev/null
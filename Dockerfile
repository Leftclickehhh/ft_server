FROM debian:buster

RUN apt-get update
RUN apt-get -y install nginx mariadb-server openssl unzip
RUN apt-get -y install php7.3 php-mysql php-fpm php-cli php-mbstring

COPY ./srcs/start.sh /var/
COPY ./srcs/mysql_setup.sql /var/
COPY ./srcs/wordpress.sql /var/www/html/
COPY ./srcs/indexswap.sh /var/
COPY ./srcs/wp-cli.phar /var/
COPY ./srcs/wp-config.php /var/www/html/
COPY ./srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost

RUN chmod +x /var/wp-cli.phar && mv var/wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip ./phpMyAdmin.zip
RUN unzip phpMyAdmin.zip && rm -rf phpMyAdmin.zip
RUN mv phpMyAdmin-5.0.2-all-languages phpmyadmin
COPY ./srcs/config.inc.php phpmyadmin

ADD http://wordpress.org/latest.tar.gz ./wordpress.tar.gz
RUN tar xf ./wordpress.tar.gz && rm -rf wordpress.tar.gz
RUN mv wp-config.php wordpress/

RUN service mysql start && mysql < /var/mysql_setup.sql &&\
    mysql wordpress -u sde-kok --password=password < /var/www/html/wordpress.sql \
    mysql phpmyadmin < 

RUN service mysql start && \
    wp core install --allow-root --path="/var/www/html/wordpress" --url="https://localhost/wordpress" --title="sde-kok" --admin_user="sde-kok" --admin_password="password" --admin_email="sde-kok@student.codam.nl"

RUN openssl req -x509 -nodes -newkey rsa:2048 -subj '/CN=localhost'\
    -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

RUN chown -R www-data:www-data /var/www/html/*

ENV autoindex=1

CMD bash /var/start.sh ${autoindex} && bash
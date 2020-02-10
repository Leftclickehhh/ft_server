#!/bin/bash

INDEX=${AUTOINDEX:-on}
if [ INDEX="off" ]
then	mv /var/nginxindexoff.conf /var/nginx.conf
		mv /var/nginx.conf /etc/nginx/sites-available/localhost
fi

service php7.3-fpm start
service nginx start
service mysql start
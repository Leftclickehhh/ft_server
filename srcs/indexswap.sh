#!/bin/bash

if [ $1 -eq 0 ]
then
	sed -i "/autoindex/c\autoindex off;" /etc/nginx/sites-available/localhost
	echo 'Autoindex is off'
elif [ $1 -eq 1 ]
then
	sed -i "/autoindex/c\autoindex on;" /etc/nginx/sites-available/localhost
	echo 'autoindex is on'
else
	echo 'invalid argument'
fi
service nginx restart

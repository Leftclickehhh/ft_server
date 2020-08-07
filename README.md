# ft_server
a docker wordpress sql phpmyadmin server

docker build -t ft_server .
docker run -p 80:80 -p 443:443 ft_server
docker exec [name] bash ../../indexswap.sh 1/0 on or off
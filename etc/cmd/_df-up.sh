#!/bin/bash

source ./.env

cd ../eccube
docker build -t eccube4-php-apache .

#コンテナ上のファイルを使用する場合
#docker run --name ${APP}_eccube -p "28080:80" -p "4430:443" eccube4-php-apache

#ローカルディレクトリをマウントする場合
#var 以下をマウントすると強烈に遅くなるため、 src, html, app 以下のみをマウントする
# docker run -d --name ${APP}_eccube -p "28080:80" -p "4430:443"  -v "$PWD/html:/var/www/html/html:cached" -v "$PWD/src:/var/www/html/src:cached" -v "$PWD/app:/var/www/html/app:cached" -v "$PWD/var:/var/www/html/var:cached" eccube4-php-apache

cp .env.dist .env
sed -i -e "s/DATABASE_URL=sqlite:\/\/\/var\/eccube.db/DATABASE_URL=mysql:\/\/${MYSQL_USER}:${MYSQL_PASSWORD}@${APP}_db:3306\/${MYSQL_DATABASE_APP}/g" ./.env.dist
sed -i -e "s/MAILER_URL=null:\/\/localhost/MAILER_URL=smtp:\/\/${APP}_mailcatcher:1025/g" ./.env.dist

#DB
docker run -d -d -p 21080:1080 -p 21025:1025 --name ${APP}_mailcatcher schickling/mailcatcher
#MAIL
docker run -d --name ${APP}_db -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DATABASE_APP=${MYSQL_DATABASE_APP} -d -p 23306:3306 mysql:${MYSQL_VERSION}
#EC-CUBE
docker run -d --name ${APP}_eccube -p "28080:80" -p "4430:443" --link ${APP}_mailcatcher:mailcatcher --link ${APP}_db:db -v "$PWD:/var/www/html/:cached" eccube4-php-apache
cd -

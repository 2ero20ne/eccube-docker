#!/bin/bash

source ./.env

cd ../eccube
composer install
cp .env.dist .env
sed -i -e "s/DATABASE_URL=sqlite:\/\/\/var\/eccube.db/DATABASE_URL=mysql:\/\/${MYSQL_USER}:${MYSQL_PASSWORD}@${APP}_db:3306\/${MYSQL_DATABASE_APP}/g" ./.env
sed -i -e "s/MAILER_URL=null:\/\/localhost/MAILER_URL=smtp:\/\/${APP}_mailcatcher:1025/g" ./.env
docker exec ${APP}_eccube bin/console eccube:install --no-interaction
cd -

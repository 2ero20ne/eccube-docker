#!/bin/bash

source ./.env

cd ../eccube
docker exec -it ${APP}_eccube bin/console eccube:fixtures:generate --products=2 --orders=2 --customers=2 --without-image --env=dev
cd -

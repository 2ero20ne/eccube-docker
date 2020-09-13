#!/bin/bash

source ./.env

cd ../eccube
docker start -d --attach ${APP}_eccube
docker start -d --attach ${APP}_mailcatcher
docker start -d --attach ${APP}_db
cd -

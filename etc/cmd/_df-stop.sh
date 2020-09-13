#!/bin/bash

source ./.env

cd ../eccube
docker stop ${APP}_eccube
docker stop ${APP}_mailcatcher
docker stop ${APP}_db
cd -

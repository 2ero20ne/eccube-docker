#!/bin/bash

source ./.env

cd ../eccube
docker rm --force ${APP}_eccube
docker rm --force ${APP}_mailcatcher
docker rm --force ${APP}_db
cd -

#!/bin/bash

source ./.env

cd ../eccube
docker exec -it ${APP}_eccube /bin/bash
cd -

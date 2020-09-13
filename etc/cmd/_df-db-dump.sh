#!/bin/bash

source ./.env

docker exec -it ${APP}_db sh -c "mysqldump ${MYSQL_DATABASE_APP} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} 2> /dev/null" > ./resources/db/dump.sql

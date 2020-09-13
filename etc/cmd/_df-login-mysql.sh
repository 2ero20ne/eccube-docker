#!/bin/bash

source ./.env

echo "Waiting for MySQL"
while ! docker exec ${APP}_db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} &> /dev/null ; do
    printf "."
    sleep 1
done

docker exec -i -t ${APP}_db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE_APP}

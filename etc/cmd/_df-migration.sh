#!/bin/bash

source ./.env

echo "Waiting for MySQL"
while ! docker exec ${APP}_db mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} &> /dev/null ; do
    printf "."
    sleep 1
done

database=${MYSQL_DATABASE_APP}
if [ "$database" = "" ] ; then
    exit
fi

if [ "$database" = "${MYSQL_DATABASE_APP}" ] ; then
    COMMOND=`cat << EOS
drop database if exists ${MYSQL_DATABASE_APP};
create database ${MYSQL_DATABASE_APP} default charset utf8;
grant all privileges on ${MYSQL_DATABASE_APP}.* to ${MYSQL_USER}@"%";
EOS
`
    docker exec -i ${APP}_db mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e"${COMMOND}"
    if [ -e "./resources/db/dump.sql" ]; then
        docker exec -i ${APP}_db mysql -u${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} ${MYSQL_DATABASE_APP} < ./resources/db/dump.sql
    fi
fi

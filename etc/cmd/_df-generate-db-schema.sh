#!/bin/bash

source ./.env

java -jar ./tools/schemaspy/schemaspy-6.1.0.jar -dp ./tools/schemaspy/mysql-connector-java-8.0.20.jar -t mysql -host 127.0.0.1:23306 -db ${MYSQL_DATABASE_APP} -s ${MYSQL_DATABASE_APP} -u ${MYSQL_USER} -p ${MYSQL_PASSWORD} -o ./resources/db/schema -vizjs

open ./resources/db/schema/index.html

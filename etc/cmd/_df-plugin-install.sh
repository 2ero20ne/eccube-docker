#!/bin/bash

source ./.env

if [ "$plugin_code" = "" ] ; then
    read -p "Plugin Code.: " plugin_code
fi

cd ../eccube
docker exec ${APP}_eccube bin/console eccube:plugin:install --code=${plugin_code}
cd -

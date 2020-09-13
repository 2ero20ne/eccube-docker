#!/bin/bash

source ./.env

if [ "$code" = "" ] ; then
    read -p "code.: " code
fi

access_token=`curl --location --request POST 'http://localhost:28080/token' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'grant_type=authorization_code' \
  --data-urlencode 'client_id=client_identifier' \
  --data-urlencode 'client_secret=client_secret' \
  --data-urlencode 'redirect_uri=http://localhost:28080/' \
  --data-urlencode "code=${code}" | jq '.access_token'`

if [ "$access_token" != null ] ; then
  sed -i -e "s/API_TOKEN=.*$/API_TOKEN=${access_token//\"/}/" .env
fi
#!/bin/bash

source ./.env

cd ../eccube
docker exec -it ${APP}_eccube bin/console trikoder:oauth2:create-client client_identifier client_secret --redirect-uri=http://localhost:28080/ --grant-type=authorization_code --grant-type=client_credentials --grant-type=implicit --grant-type=password --grant-type=refresh_token --scope=read --scope=write
cd -

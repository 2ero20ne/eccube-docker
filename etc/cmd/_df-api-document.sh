#!/bin/bash

source ./.env

cp ./resources/insomnia/api.json ./tools/insomnia-documenter/public/insomnia.json

cd ./tools/insomnia-documenter
npm run dev
cd -

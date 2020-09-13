#!/bin/bash

source ./.env

cd ../eccube
mkdir var/oauth
openssl genrsa -out private.key 2048
openssl rsa -in private.key -pubout -out public.key
mv private.key var/oauth
mv public.key var/oauth
cd -

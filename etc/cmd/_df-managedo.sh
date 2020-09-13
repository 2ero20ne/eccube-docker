#!/bin/bash

source ./.env

NATIVE_PROPERTIES_PATH=$1

FIRST_ARG=$2
taskReturnCode=0

IFS_OLD=${IFS}
IFS=$'\n'
for line in `cat $APP_HOME/cmd/menu`
do
  if [[ $line =~ ^[^#].*=.*$ ]] ; then
    key=${line%%=*}
    if [ "$FIRST_ARG" = "$key" ];then
      FIRST_ARG=${line#*=}
    fi
  fi
done
IFS=$IFS_OLD

echo "/nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"
echo "...Calling the ${FIRST_ARG} task"
echo "nnnnnnnnnn/"
sh $APP_HOME/cmd/_df-${FIRST_ARG}.sh $NATIVE_PROPERTIES_PATH $3 $4 $5
taskReturnCode=$?

if [ $taskReturnCode -ne 0 ];then
  exit $taskReturnCode;
fi

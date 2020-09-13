#!/bin/bash

source ./.env

NATIVE_PROPERTIES_PATH=$1

FIRST_ARG=$2
taskReturnCode=0

if [ "$FIRST_ARG" = "" ];then
  IFS_OLD=${IFS}
  IFS=$'\n'
  for line in `cat $APP_HOME/cmd/menu`
  do
    if [[ $line =~ ^[^#].*=.*$ ]] ; then
      key=${line%%=*}
      if [ -n "${line#*=}" ]; then
        echo "$(printf "% 4s" $key) : ${line#*=}"
      else
        echo " $key"
      fi
    fi
  done
  IFS=$IFS_OLD

  echo ""
  echo \(input on your console\)
  echo What is your favorite task? \(number\):

  read FIRST_ARG
fi

IFS=,
for element in $FIRST_ARG
do
  sh $APP_HOME/cmd/_df-managedo.sh $NATIVE_PROPERTIES_PATH $element $3 $4 $5
  taskReturnCode=$?
  if [ $taskReturnCode -ne 0 ];then
    exit $taskReturnCode;
  fi
done

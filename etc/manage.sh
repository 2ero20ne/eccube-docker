#!/bin/bash

cd `dirname $0`
export APP_HOME=.
export MY_PROPERTIES_PATH=dummy

sh $APP_HOME/cmd/_df-manage.sh $MY_PROPERTIES_PATH $@   
taskReturnCode=$?

if [ $taskReturnCode -ne 0 ];then
  exit $taskReturnCode;
fi

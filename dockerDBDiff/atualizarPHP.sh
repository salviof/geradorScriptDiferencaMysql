#!/bin/bash
SEARCH="phar.readonly = Off"
REPLACE=";phar.readonly = On"
FILEPATH="/etc/php.ini"
sed -i "/$SEARCH/$REPLACE/" $FILEPATH

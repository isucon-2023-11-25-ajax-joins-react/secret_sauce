#!/bin/bash

DIR="access_logs"

if [ ! -e $DIR ]; then
  mkdir $DIR
fi

cd $(dirname $0)/../

current_date_time=$(date "+%Y-%m-%d_%H-%M")
sudo alp json --file /var/log/nginx/access.log > "${DIR}/access_log_${current_date_time}.txt"
sudo rm -rf /var/log/nginx/access.log
sudo systemctl reload nginx

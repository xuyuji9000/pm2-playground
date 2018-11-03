#!/bin/sh
set -ex

URL=139.198.19.140 # put your URL here
NODE="/root/.nvm/versions/node/v11.1.0/bin/node" # put the absolute path of NODE here
PM2="/root/.nvm/versions/node/v11.1.0/bin/pm2" # put the absolute path of PM2 here
PM2_CONFIG="/root/pm2-playground/pm2.yaml"

while true; do
    sleep 5
    for i in {0..1}
    do
        RES[$i]=`curl -s -I $URL | grep HTTP/1.1 | awk {'print $2'}`
    done

    # echo ${RES[0]} ${RES[1]}

    if [[ ${RES[0]} != 200 && ${RES[0]} == ${RES[1]} ]]
    then
        eval "$NODE $PM2 delete $PM2_CONFIG "
        eval "$NODE $PM2 reload $PM2_CONFIG"
        if [ $? -ne 0 ] ; then echo "pm2 reload failed."; else echo "pm2 reload successful.";fi;
    fi
done
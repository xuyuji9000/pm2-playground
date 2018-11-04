#!/bin/sh
set -ex

URL=139.198.19.140 # put your URL here
PM2_CONFIG="./pm2.yaml" # pm2 configuration file absolute path
NODE="$(which node)" # put the absolute path of NODE here
PM2="$(which pm2)" # put the absolute path of PM2 here
ERROR_LOG="/var/log/cron"
SUBJECT="PM2 Recovery $(date)"
RECEIVER_EMAIL="karl.yogi.xu@gmail.com"
MAILGUN_CREDENTIAL="your_mailgun_credential"
MAILGUN_DOMAIN="your_mailgun_sandbox_domain"

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

        MAIL_CONTENT=$(tail -100 ${ERROR_LOG})
        # mailx -s "${SUBJECT}" ${RECEIVER_EMAIL}
        curl -s --user "${MAILGUN_CREDENTIAL}" \
        "https://api.mailgun.net/v3/${MAILGUN_DOMAIN}/messages" \
        -F from="Mailgun Sandbox <postmaster@${MAILGUN_DOMAIN}>" \
        -F to="${RECEIVER_EMAIL}" \
        -F subject="${SUBJECT}" \
        -F text="${MAIL_CONTENT}"
    fi
done

# pm2-playground

- Create fork mode: `pm2 start -i 2 app.js`

- Create cron job: `crontab -e`

<!-- - Crontab config: `* * * * * /root/pm2-playground/healthcheck.sh >> /tmp/crontab.log ` -->

- Get log from the running process: `strace -p<process-id> -s9999 -e write`


- Keep the script running in the background: `nohup ./healthcheck.sh &> /dev/null &`




# Reference

1. [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)

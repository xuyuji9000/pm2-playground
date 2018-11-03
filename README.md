# pm2-playground

- Create fork mode: `pm2 start -i 2 app.js`

- Create cron job: `crontab -e`

- Crontab config: `* * * * * /root/pm2-playground/healthcheck.sh >> /tmp/crontab.log `

- Get log from the running process: `tail -f /proc/<pid>/fd/1`




# Reference

1. [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)

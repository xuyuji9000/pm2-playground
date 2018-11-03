# pm2-playground

<!-- - Crontab config: `* * * * * /root/pm2-playground/healthcheck.sh >> /tmp/crontab.log ` -->

- Get log from the running process: `strace -p<process-id> -s9999 -e write`


- Keep the script running in the background: `nohup ./healthcheck.sh &> /dev/null &`




# Reference

1. [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)

2. [Let less secure apps access your account](https://support.google.com/accounts/answer/6010255?p=lsa_blocked&hl=en&visit_id=636768468433298627-748476569&rd=1)

3. [Configure Postfix to use Gmail as a Mail Relay](https://www.huuphan.com/2018/04/configure-postfix-to-use-gmail-as-mail.html)


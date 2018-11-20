# pm2-playground

<!-- - Crontab config: `* * * * * /root/pm2-playground/healthcheck.sh >> /tmp/crontab.log ` -->

- Get log from the running process: `strace -p<process-id> -s9999 -e write`


- Keep the script running in the background: `nohup ./healthcheck.sh &> /dev/null &`

- Check email sending verbose log: `tail -f /var/log/maillog`

- Kill the **healthcheck.sh** process: `ps aux | grep healthcheck.sh | awk  '{print $2}' | xargs kill`

## Setup Mailgun

1. Create free mailgun account

2. Verify an email account for receiving alerting email on Mailgun

3. Get the user credential and default mailing domain of mailgun 

## Setup Nginx

    ``` bash
    yum install -y epel-release
    yum install -y nginx
    ```

# Reference

1. [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)

2. [Let less secure apps access your account](https://support.google.com/accounts/answer/6010255?p=lsa_blocked&hl=en&visit_id=636768468433298627-748476569&rd=1)

3. [Configure Postfix to use Gmail as a Mail Relay](https://www.huuphan.com/2018/04/configure-postfix-to-use-gmail-as-mail.html)

4. [How To Install Nginx on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7)


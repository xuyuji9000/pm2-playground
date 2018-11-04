# pm2-playground

<!-- - Crontab config: `* * * * * /root/pm2-playground/healthcheck.sh >> /tmp/crontab.log ` -->

- Get log from the running process: `strace -p<process-id> -s9999 -e write`


- Keep the script running in the background: `nohup ./healthcheck.sh &> /dev/null &`

- Check email sending verbose log: `tail -f /var/log/maillog`

- Kill the **healthcheck.sh** process: `ps aux | grep healthcheck.sh | awk  '{print $2}' | xargs kill`


## Setup mail server


1. Install postfix: `yum install -y postfix mailx cyrus-sasl cyrus-sasl-plain`

2. To configure postfix to use Gmail as a Mail Relay, append to the bottom of `/etc/postfix/main.cf`

    ``` bash
    #To use smpt gmail with 587 port
    relayhost = [smtp.gmail.com]:587
    smtp_use_tls = yes
    smtp_sasl_auth_enable = yes
    smtp_sasl_security_options = noanonymous
    smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
    smtp_tls_CAfile = /etc/pki/tls/certs/ca-bundle.crt
    smtp_tls_security_level = encrypt
    # Location of CA certificates
    smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
    ```

3. Configure Gmail authentication under `/etc/postfix/sasl_passwd`

    ``` bash
    [smtp.gmail.com]:587    username@gmail.com:password
    ```
    
4. Setup permissions

    ``` bash
    chmod 600 /etc/postfix/sasl_passwd
    chown root:root /etc/postfix/sasl_passwd
    postmap /etc/postfix/sasl_passwd
    ```

5. Restart postfix service:

    ``` bash
    service postfix start
    ```

6. Test send an email

    ``` bash
    echo "Test Mail" | mailx -v -r "AccountEmail@gmail.com" -s "Test Mail 01" anotherAcount@gmail.com
    ```



# Reference

1. [Virtual Hosts on nginx (CSC309)](https://gist.github.com/soheilhy/8b94347ff8336d971ad0)

2. [Let less secure apps access your account](https://support.google.com/accounts/answer/6010255?p=lsa_blocked&hl=en&visit_id=636768468433298627-748476569&rd=1)

3. [Configure Postfix to use Gmail as a Mail Relay](https://www.huuphan.com/2018/04/configure-postfix-to-use-gmail-as-mail.html)

4. [How To Install Nginx on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7)


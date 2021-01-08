This document records the process for upgrade pm2 version on production server.


1. Upgrade node version

    ``` bash
    nvm instal NEW_NODE_VERSION
    nvm alias default NEW_NODE_VERSION
    ```


2. Install existing node dependencies for new node version.

    ``` bash
    nvm install NEW_NODE_VERSION --reinstall-packages-from=OLD_NODE_VERSION
    pm2 updatePM2 # Update in memory pm2
    ```

3. Confirm previous running processes still running.



# Reference

1. [](https://stackoverflow.com/questions/26205065/proper-way-to-update-pm2-after-updating-node-js)
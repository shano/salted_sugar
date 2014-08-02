# SALTED SUGAR
This is a sample salt configuration for SugarCRM.

# HOWTO Initial Setup
 1. Install salt on the server you with to act as the salt-master(the provisioner). DigitalOcean is great and cheap for this sort of non-mission critical task.
 2. Spin up a new server(which will be production), install/configure the salt-minion and point it at the master.
 3. Clone this repo to your salt-master.
 4. Do a grep -iRn 'TODO' sugar_salt/* and fill in all details and copy files where needed.
 5. Overwrite or merge this folder with your existing /srv/salt.

# HOWTO Update config via salt
1. Master: Simply update the config on the sugardev server. (under /srv/salt)
2. Minion: sudo salt-call -l debug state.highstate on the minion 

# HOWTO Add a new minion
**On the minion**

 1. sudo add-apt-repository ppa:saltstack/salt
 2. sudo apt-get update && sudo apt-get install salt-minion
 3. sudo echo 'salt_master_ip salt' >> /etc/hosts //Or whatever the salt master is
 4. sudo salt-call -l debug state.highstate

**Then on the master**

 1. sudo salt-key -L
 2. sudo salt-key -a <key_name>

**Then back on the minion**

 1. sudo salt-call -l debug state.highstate

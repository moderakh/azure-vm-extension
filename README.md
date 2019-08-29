## azure-vm-extension

# Root user
How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
```

Uninstall if previously installed
```bash
sudo java -jar upload-agent.jar -cleanup -configFile conf.json
```

Initialize and run upload agent as a service
```bash
sudo java -jar upload-agent.jar -initialize -configFile conf.json
```

Check the log
```bash
tail -F /opt/cosmos/connectors/cassandra/upload-agent/logs/agent.log
```

# Non Root user

Update the conf.json with 'userName' and 'installationPath'. Set 'registerAsService' to false.

The Non root user needs to have the following permissions:
  - Read permissions for Upload agent files
     - upload-agent.jar
     - conf.json
  - Read and write permissions for all cassandra files
     - data folder for snapshots
     - commitlog folder
  - Read and write permissions for 
     - 'installationPath' specified in conf.json
     - 'commitLogArchive' specified in conf.json

Ideally, the user starting the csassandra service should be the one to start the upload agent as well.

How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
```

Uninstall if previously installed. Input password for user when prompted.
```bash
su - <USER_NAME> -c "java -jar /tmp/upload-agent.jar -cleanup -configFile /tmp/conf.json"
```

Initialize the upload agent. Input password for user when prompted.
```bash
su - <USER_NAME> -c "java -jar /tmp/upload-agent.jar -initialize -configFile /tmp/conf.json"
```

Register and start the upload agent service.
Ensure that the user running the sudo command has the following commands whitelisted in sudoers
  - systemctl start cosmos-upload-agent.service
  - systemctl stop cosmos-upload-agent.service
  - systemctl enable cosmos-upload-agent.service
  - systemctl disable cosmos-upload-agent.service
  (refer : https://askubuntu.com/questions/1089260/start-service-with-sudo)
  
```bash
sudo <INSTALLATION_PATH>/register-and-run-service.sh
```

Check the log
```bash
tail -F <INSTALLATION_PATH>/logs/agent.log
```

In case you want to stop the service, run
```bash
sudo <INSTALLATION_PATH>/stop-service.sh
```

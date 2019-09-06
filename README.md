## azure-vm-extension

To use the Cosmos DB Cassandra Connector Upload agent, put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
```

# Root user

Validate the config file and system schema before running the upload agent
```bash
sudo java -jar upload-agent.jar -validate -configFile conf.json -validationParams '<VALIDATION_PARAMS>'
```

To view all validation parameters
```bash
sudo java -jar upload-agent.jar -validate -configFile conf.json -validationParams '-h'
```

How to install:


Initialize and run upload agent as a service
```bash
sudo java -jar upload-agent.jar -initialize -configFile conf.json
```

Check the log
```bash
tail -F /opt/cosmos/connectors/cassandra/upload-agent/logs/agent.log
```

In case you want to uninstall the upload agent, run
```bash
sudo java -jar upload-agent.jar -cleanup -configFile conf.json
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

Validate the config file and system schema before running the upload agent
```bash
su - <USER_NAME> -c "java -jar /tmp/upload-agent.jar -validate -configFile /tmp/conf.json -validationParams '<VALIDATION_PARAMS>'"
```

To view all validation parameters
```bash
su - <USER_NAME> -c "java -jar /tmp/upload-agent.jar -validate -configFile /tmp/conf.json -validationParams '-h'"
```

How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
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

In case you want to uninstall the upload agent, run the following. Input password for user when prompted.
```bash
su - <USER_NAME> -c "java -jar /tmp/upload-agent.jar -cleanup -configFile /tmp/conf.json"
```

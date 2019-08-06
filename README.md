# azure-vm-extension

How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
```

Ensure that the user starting the upload agent had permissions for the path specified in 'installationPath' in the conf.json, and for accessing cassandra data files. Ideally, the user starting the cassandra service should start the upload agent as well. 

Uninstall if previously installed
```bash
java -jar upload-agent.jar -cleanup -configFile conf.json
```

Initialize and run upload agent (if 'registerAsService' is set to true in config file)
```bash
java -jar upload-agent.jar -initialize -configFile conf.json
```

else, initialize upload agent and run the shell script (as a background process) to start up upload agent
```bash
java -jar upload-agent.jar -initialize -configFile conf.json
/bin/bash <installation_path>/start.sh &
disown
```

Check the log
```bash
tail -F <installation_path>/logs/agent.log
```

If you want to use with cdc use the jar in cdc-lib

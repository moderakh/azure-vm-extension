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

If you do not register the upload agent as a service, the processes need to be monitored and killed before restarting the upload agent.
Make a note of the process Id (START_SCRIPT_PID) of the start.sh script. Then execute the following command to clean up all the upload-agent related processes.
```bash
pkill -9 -g <START_SCRIPT_PID>
```

If you want to use with cdc use the jar in cdc-lib

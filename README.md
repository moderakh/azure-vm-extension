# azure-vm-extension

How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
 ```console
/tmp/upload-agent.jar
/tmp/conf.json
```

uninstall if previously installed
```bash
sudo java -jar upload-agent.jar -cleanup
```

initialize and run upload agent (if 'registerAsService' is set to true in config file)
```bash
sudo java -jar upload-agent.jar -initialize -configFile conf.json
```

else, initialize upload agent and run the shell script to start up upload agent
```bash
sudo java -jar upload-agent.jar -initialize -configFile conf.json
sudo /bin/bash /opt/cosmos/connectors/cassandra/upload-agent/start.sh
```

check the log
```bash
tail -F /opt/cosmos/connectors/cassandra/upload-agent/logs/agent.log
```

If you want to use with cdc use the jar in cdc-lib

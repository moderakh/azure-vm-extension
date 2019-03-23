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

install as a service and run upload agent
```bash
sudo java -jar upload-agent.jar -registerAsService -configFile conf.json
```

check the log
```bash
tail -F /opt/cosmos/connectors/cassandra/upload-agent/logs/agent.log
```

If you want to use with cdc use the jar in cdc-lib

# azure-vm-extension

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

If you want to use with cdc use the jar in cdc-lib

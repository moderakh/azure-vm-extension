# azure-vm-extension

How to install:

put the jar and the conf.json in /tmp/ folder in Cassandra Linux VM:
/tmp/upload-agent.jar
/tmp/conf.json

uninstall if previously installed
sudo java -jar upload-agent.jar -cleanup

install as a service and run upload agent
sudo java -jar upload-agent.jar -cleanup

check the log
tail -F /opt/cosmos/connectors/cassandra/upload-agent/logs/agent.logs



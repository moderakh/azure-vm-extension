#!/bin/bash

echo "downloading upload-agent"
wget "https://raw.githubusercontent.com/moderakh/azure-vm-extension/master/lib/upload-agent.jar" -O /tmp/upload-agent
echo "cleaning up upload agent (if registered before)"
sudo java -jar upload-agent.jar -cleanup
echo "registering upload agent"
sudo java -jar upload-agent.jar -registerAsService

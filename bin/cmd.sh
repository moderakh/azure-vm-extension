#!/bin/bash

echo HELLO

echo "download jar"
wget "https://raw.githubusercontent.com/moderakh/azure-vm-extension/master/lib/upload-agent.jar" -O /tmp/upload-agent.jar

echo "ceanup"
sudo java -jar /tmp/upload-agent.jar -cleanup

echo "register"
sudo java -jar /tmp/upload-agent.jar -registerAsService

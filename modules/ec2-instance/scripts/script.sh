#!/bin/bash

echo "Starting update EC2 Server."
#sudo apt-get update
echo "Server has been updated."

export CLINIC_ROOT=/opt/clinic

echo "clone project from github."

#mkdir $CLINIC_ROOT/clinic

mkdir -p $CLINIC_ROOT

cd $CLINIC_ROOT

sudo git clone --branch develop https://github.com/alialrabi/smartclinic.git

cd smartclinic

sudo ./gradlew bootRun

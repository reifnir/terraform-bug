#!/bin/bash

# Start Docker container with the following command:
#   docker run -it -v "`pwd`:/src" -w "/src" ubuntu:latest
# Then execute this script to install both dotnet 5 and terraform

if [ `whoami` -ne "root" ]
then
  echo "Needs to run as root."
  exit 1
fi
export DEBIAN_FRONTEND="noninteractive"

apt update
apt install -y \
  wget \
  curl \
  apt-transport-https \
  lsb-release \
  software-properties-common \
  gnupg2

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm ./packages-microsoft-prod.deb

apt-get update
apt-get install -y dotnet-sdk-5.0

curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update && apt-get install terraform


#!/bin/bash

sudo apt install wget curl gpg gnupg2 software-properties-common apt-transport-https lsb-release ca-certificates -y
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
wget https://downloads.plex.tv/plex-keys/PlexSign.key
cat  PlexSign.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/PlexSigkey.gpg
sudo apt update
sudo apt install plexmediaserver -y

sudo mv plexmediaserver /etc/ufw/applications.d/plexmediaserver

sudo ufw app update plexmediaserver

sudo ufw allow plexmediaserver-all

clear
echo "double check that this looks right"
sudo ufw status verbose
echo "enter when done"
read waiting

cd 
mkdir plex
cd plex
mkdir movies
mkdir tv
mkdir pictures
mkdir music

clear
echo "head to the static ip to start working on settings."
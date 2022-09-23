#!/bin/bash

sudo apt install curl -y
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
sudo apt update -y sudo apt full-upgrade -y
sudo apt install plexmediaserver -y

sudo touch sudo nano /etc/ufw/applications.d/plexmediaserver

sudo echo "[plexmediaserver]
title=Plex Media Server (Standard)
description=The Plex Media Server
ports=32400/tcp|3005/tcp|5353/udp|8324/tcp|32410:32414/udp

[plexmediaserver-dlna]
title=Plex Media Server (DLNA)
description=The Plex Media Server (additional DLNA capability only)
ports=1900/udp|32469/tcp

[plexmediaserver-all]
title=Plex Media Server (Standard + DLNA)
description=The Plex Media Server (with additional DLNA capability)
ports=32400/tcp|3005/tcp|5353/udp|8324/tcp|32410:32414/udp|1900/udp|32469/tcp
" > /etc/ufw/applications.d/plexmediaserver

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
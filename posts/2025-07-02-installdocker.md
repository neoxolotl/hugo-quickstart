---
title: "Install Docker"
date: 2025-07-02 05:02:23
draft: true
---

How Install Docker. 


```shell

sudo apt update -y
sudo apt upgrade -y
sudo apt install docker.io docker-compose
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker

#sudo groupadd docker
#sudo usermod -aG docker $USER
#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "$HOME/.docker" -R

```

Enjoy


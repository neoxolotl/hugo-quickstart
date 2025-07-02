---
title: "Wireguard"
date: 2024-09-02T20:11:05-03:00
draft: false
---

WireGuard Is your Own VPN Server. Deploy to any cloud provider and after that you can connect between differents apps 


```shell
version: '3.3'
services:
  wireguard:
    image: linuxserver/wireguard
    container_name: wireguard
    cap_add:
      - NET_ADMIN
      - SYS_MODULE
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=America/Mendoza
      - SERVERURL=192.168.1.100 #optional here is Your public IP
      - SERVERPORT=51820 #optional
      - PEERS=2 #optional here peers account 
      - PEERDNS=auto #optional
      - INTERNAL_SUBNET=10.0.0.145 #optional
    volumes:
      - /root/wireguard:/config
      - /lib/modules:/lib/modules
      - /usr/src:/usr/src
    ports:
      - 51820:51820/udp
    sysctls:
      - net.ipv4.conf.all.src_valid_mark=1
    restart: unless-stopped

```

If you need more peers. You must modify only this docker-compose you change peers numers.

Enjoy  

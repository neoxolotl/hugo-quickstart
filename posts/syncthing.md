---
title: "Syncthing"
date: 2022-08-23T13:47:43Z
title: Syncthing
---
Syncthing an p2p Sync 
---

Usefull for move differents configurations to another servers. 




Here source Code 

```shell
version: "2"
services:
  syncthing:
    image: linuxserver/syncthing
    container_name: syncthing
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - UMASK_SET=022
    volumes:
      - ./appdata/config:/config
      - ./data1:/data1
      - ./data2:/data2
    ports:
      - 8384:8384
      - 22000:22000
      - 21027:21027/udp
    restart: unless-stopped
```

this is all after that can you see in your browser. Only need open the port 8384. Remember add your data access user and password. 
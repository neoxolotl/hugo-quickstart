---
title: "Portainer"
date: 2022-08-23T13:47:43Z
title: Portainer
---
Portainer an Easy Explorer 
---

You can explore all dockers pods and images 




Here source Code 

```shell
version: '3'

services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./portainer-data:/data
    ports:
      - 9000:9000
```

this is all after that can you see in your browser. 

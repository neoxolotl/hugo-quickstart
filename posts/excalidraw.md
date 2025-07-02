---
title: "Excalidraw"
date: 2024-09-02T21:05:45-03:00
draft: false
---

Diagram Creator. Is a powerfull tool. 

From command Line for develow your own graph

```shell
docker run --rm -dit --name excalidraw -p 5000:80 excalidraw/excalidraw:latest
```

Here is docker-compose.yml 

```shell

services:

  nginx-proxy:
    image: nginx:alpine
    container_name: nginx-proxy
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - conf:/etc/nginx/conf.d
      - vhost:/etc/nginx/vhost.d
      - html:/usr/share/nginx/html
      - certs:/etc/nginx/certs:ro

  docker-gen:
    image: nginxproxy/docker-gen
    container_name: nginx-proxy-gen
    command: -notify-sighup nginx-proxy -watch -wait 5s:30s /etc/docker-gen/templates/nginx.tmpl /etc/nginx/conf.d/default.conf
    volumes_from:
      - nginx-proxy
    volumes:
      - ./nginx.tmpl:/etc/docker-gen/templates/nginx.tmpl:ro
      - /var/run/docker.sock:/tmp/docker.sock:ro
    labels:
      - "com.github.nginx-proxy.docker-gen"

  acme-companion:
    image: nginxproxy/acme-companion
    container_name: nginx-proxy-acme
    environment:
      - DEFAULT_EMAIL=your_mail@ejemplo.com
    volumes_from:
      - nginx-proxy
    volumes:
      - certs:/etc/nginx/certs:rw
      - acme:/etc/acme.sh
      - /var/run/docker.sock:/var/run/docker.sock:ro

  draw:
    image: excalidraw/excalidraw:latest
    restart: unless-stopped
    healthcheck:
      disable: true
    environment:
      - VIRTUAL_HOST=draw.ejemplo.com
      - VIRTUAL_PORT=80
      - LETSENCRYPT_HOST=draw.ejemplo.com
      - LETSENCRYPT_MAIL=your_mail@ejemplo.com
      - REACT_APP_BACKEND_V1_GET_URL=https://draw.ejemplo.com/api/v1/
      - REACT_APP_BACKEND_V2_GET_URL=https://draw.ejemplo.com/api/v2/
      - REACT_APP_BACKEND_V2_POST_URL=https://draw.ejemplo.com/api/v2/post

  doom:
    image: callumhoughton22/doom-in-docker:0.1
    restart: unless-stopped
    environment:
      - VIRTUAL_HOST=doom.ejemplo.com
      - VIRTUAL_PORT=8080
      - LETSENCRYPT_HOST=doom.ejemplo.com
      - LETSENCRYPT_MAIL=your_mail@ejemplo.com

volumes:
  conf:
  vhost:
  html:
  certs:
```

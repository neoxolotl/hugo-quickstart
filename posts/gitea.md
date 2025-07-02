---
title: "Gitea"
date: 2024-09-02T18:21:31-03:00
draft: false
---

Gitea is your own Git version. If you want ci-cd, you need apply drone.io

```shell

version: '2'
services:
  web:
    image: gitea/gitea:1.7.1
    volumes:
      - ./data:/data
    ports:
      - "3000:3000"
      - "2233:2233"
    depends_on:
      - db
    restart: always
  db:
    image: mariadb:10
    restart: always
    environment:
      - MYSQL_ROOT_PASSWORD=Pass02!a
      - MYSQL_DATABASE=gitea
      - MYSQL_USER=gitea
      - MYSQL_PASSWORD=Pass02!a
    volumes:
      - ./db/:/var/lib/mysql


```

Enjoy



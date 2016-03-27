# docker-mongo-replicaset
Docker image for MongoDB Replica Set

## Getting started

You can use a `docker-compose.yml` like this

```
version: '2'
services:
  mongo_1:
    image: mongo
    command: --smallfiles --replSet replSetName --quiet
  mongo_2:
    image: mongo
    command: --smallfiles --replSet replSetName --quiet
  mongo_3:
    image: mongo
    command: --smallfiles --replSet replSetName --quiet
  mongo_setup:
    image: wdhif/mongo-replicaset-setup
    links:
      - mongo_1
      - mongo_2
      - mongo_3
    environment:
      DATABASE: DatabaseName
      REPLICA_SET_ID: replSetName
      PRIMARY_MEMBER: mongo_1:27017
      SECONDARY_MEMBERS: mongo_2:27017,mongo_3:27017
```

## Setup image

The Dockerfile in mongo-replicaset-setup is for initiating the Replica Set on the nodes before stopping.
You can find the image on Docker Hub at https://hub.docker.com/r/wdhif/mongo-replicaset-setup/

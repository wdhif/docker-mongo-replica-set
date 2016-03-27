# docker-mongo-replicaset
Docker compose for MongoDB Replica Set

## Getting started

1. Modify the docker-compose.yml as you want.
2. Run `docker-compose up`
3. You can check the status of your container with `docker exec -it CONTAINER_NAME bash` and then `mongo`

## Setup image

The Dockerfile in mongo-replicaset-setup is for initiating the Replica Set on the nodes before stopping.
You can find the image on Docker Hub at https://hub.docker.com/r/wdhif/mongo-replicaset-setup/

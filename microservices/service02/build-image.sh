#!/bin/bash

#remove images
docker rmi $(docker images '192.168.56.2:32000/service02' -a -q)

docker build --no-cache=true -t 192.168.56.2:32000/service02 . -f ./microservices/service02/Jenkinsfile
echo "Finish build docker images  "

echo "Begin Push Images to Local Docker Repository"

docker push "192.168.56.2:32000/service02:latest"

echo "Finish Push Images to Local Docker Repository"
docker image ls

exit 0
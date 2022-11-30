#!/bin/bash

#remove images
docker rmi $(docker images '10.19.2.92:5000/service01' -a -q)

docker build --no-cache=true -t 10.19.2.92:5000/service01 .
echo "Finish build docker images  "

echo "Begin Push Images to Local Docker Repository"

docker push "10.19.2.92:5000/service01:latest"

echo "Finish Push Images to Local Docker Repository"
docker image ls

exit 0
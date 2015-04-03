#!/bin/bash
docker build -t $1 .
docker rm -f $2
docker run --name $2 -d --volume=$3 $1

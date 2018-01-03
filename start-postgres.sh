#!/usr/bin/env bash

start_docker() {

	if [ ! "$(docker ps -q -f name=$1)" ]; then
	    if [ "$(docker ps -aq -f status=exited -f name=$1)" ]; then
	        # cleanup
	        docker rm $1
	    fi
	    # run your container
	    docker run -d --name $1 -p 5432:5432 -e POSTGRES_PASSWORD=password -d postgres
	fi
}

start_docker postgres-postgraphile

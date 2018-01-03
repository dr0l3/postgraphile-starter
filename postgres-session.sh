#!/usr/bin/env bash

start_session() {
	if [ ! "$(docker ps -q -f name=$1)" ]; 
	then
	    # run your container
	    docker run -it --rm --link $1:postgres postgres psql -h postgres -U postgres
	else
	    docker run -d --name $1 -e POSTGRES_PASSWORD=password -d postgres
	    docker run -it --rm --link $1:postgres postgres psql -h postgres -U postgres
	fi
}

start_session postgres-postgraphile

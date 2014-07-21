#!/bin/bash

if [ $# == 0 ]; then
	echo must supply a docker container name or id that was a run of builder
fi

docker cp $1:/opt/build/lib/libzmq.so.3.1.0 ./libzmq.so.3.1.0
docker cp $1:/opt/build/lib/pkgconfig/libzmq.pc ./libzmq.pc


#!/bin/bash

CONTAINER=jupyter-base
IMAGE=jupyter/minimal-notebook

ask() {
  echo $1;
  while read ANS
  do {
     case $ANS in
       "Y"|"y" )
           break;
           ;;
       * )
           exit 1;
           ;;
     esac
  }
  done
}

do_up()
{
   	echo "start jupyter" 
	docker-compose up -d
}

do_stop()
{
    echo "stop jupyter"
    docker-compose stop
}

do_reset_docker()
{
  ask "This will delete all docker images and containers installed. Continue? (y/N)"

  # Delete every Docker containers
  # Must be run first because images are attached to containers
  docker rm -f $(docker ps -a -q)

  # Delete every Docker image
  docker rmi -f $(docker images -q)
}

stop() {
    docker stop $CONTAINER
    docker rm $CONTAINER
    echo "$CONTAINER stopped and removed"
}

delete() {
    stop
    docker rmi $(docker images $IMAGE -q)
    echo "Deleted image: $IMAGE"
}

build() {
    docker build -t $IMAGE:$TAG .
}

push() {
    docker push $IMAGE:$TAG
}

create_notebook() {
    docker exec -it $CONTAINER bash
    python $(pwd)/create-notebook.py $2
}

case "$1" in
    'start')
            do_up
            ;;
    'stop')
            do_stop
            ;;
    'update')
            delete
            do_up
            ;;
    'restart')
            do_stop
            do_up
            ;;
    'dockerreset')
            do_reset_docker
            ;;
    'delete')
            delete
            ;;
    'build')
            build
            ;;
    'push')
            push
            ;;
    'create')
            create_notebook $2
            ;;
    *)
            echo
            echo "Usage: $0 { start | stop | restart | delete | build | push | dockerreset }"
            echo
            exit 1
            ;;
esac

exit 0

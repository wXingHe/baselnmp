#!/bin/bash

CURRENT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
SCRIPT="CURRENT_DIR/script"

#Check .env file.
if [ -f "$CURRENT_DIR/.env" ]; then
  source "$CURRENT_DIR/.env"
else 
  echo ".env file is not exist."
  exit 1
fi

#Create a fixed network
NETWORK="$PROJECT_NAME-network"
echo $NETWORK

if [ -z "$(docker network ls | grep "${NETWORK}")" ] ; then
  docker network create --subnet 10.10.0.0/16 -d bridge ${NETWORK}
fi

case "$1" in
    start)
        docker-compose up -d
        ;;
    stop)
        docker-compose stop
        ;;
    down)
        docker-compose down
        ;;
    *)
        echo $"Usage: $0 {start [run_user]|stop|down|logs}"
        exit 1
esac




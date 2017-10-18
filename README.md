# Docker Template
## Dependencies
- docker
- docker-compose
- docker-machine

## Commands building the docker image
'docker-compose up --build' or 'docker-compose build'

## Run docker as daemon
'docker-compose up -d' "-d" flag is short hand for daemon

## Check if docker image is running
'docker ps'

## To stop docker
'docker stop'

## Reset rails database
docker-compose exec --user "$(id -u):$(id -g)" website rails db:reset

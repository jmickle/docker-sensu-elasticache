# docker-sensu-elasticache
Sensu-Uchiwa using Redis elasticache as a transport


# Testing redis

`docker pull redis`
`docker run --name=redis-sensu -p 6379:6379 redis`


## find redis IP:
`docker network inspect bridge`

## running on docker locally to test 
`docker run -p 3000:3000 --name=sensu -e "SENSU_TRANSPORT_NAME=redis" -e "REDIS_URL=redis://<ip from above>:6379/0" -e "SENSU_CLIENT_NAME=sensu-master" -e "SENSU_CLIENT_SUBSCRIPTIONS=dev" sensu`


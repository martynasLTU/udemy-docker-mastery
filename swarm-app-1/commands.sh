docker network create --driver overlay frontend
docker network create --driver overlay backend

# not sure if it is needed
# docker volume create pg_data

# voting app
docker service create --name vote --network frontend --replicas 3 -p 80:80 bretfisher/examplevotingapp_vote
# redis
docker service create --name redis --network frontend redis:3.2
# worker
docker service create --name worker --network frontend --network backend bretfisher/examplevotingapp_worker
# postgres db
docker service create --name db --network backend -e POSTGRES_HOST_AUTH_METHOD=trust --mount type=volume,source=pg_data,target=/var/lib/postgresql/data postgres:9.4
# result
docker service create --name result --network backend -p 5001:80 bretfisher/examplevotingapp_result
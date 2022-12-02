# Docker

## To clear the network

```bash
sudo docker network prune
```

## To dowload containers 
It need to login on aws, then on master, sdc-up ta pull the containers. 

```bash
aws ecr get-login-password --profile bunny_aws_prod | sudo docker login --username AWS --password-stdin 697826815912.dkr.ecr.us-east-1.amazonaws.com
```

## That will delete all dockers images [caution]

```bash
docker system prune -af
``

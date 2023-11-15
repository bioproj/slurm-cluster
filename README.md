##
https://github.com/hokiegeek2/slurm-cloud-integration

```
cd master
docker build -t wangyang1749/slurm-cluster:1.0 . 
docker run  --name slurm-cluster -it --rm --privileged -p 6820:6820 wangyang1749/slurm-cluster:1.0
docker ps

```

##
# slurm-cluster
Docker local slurm cluster

Created by: Rodrigo Ancavil del Pino

https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601

To run slurm cluster environment you must execute:

     $ docker-compose -f docker-compose-jupyter.yml up -d

To stop it, you must:

     $ docker-compose -f docker-compose-jupyter.yml stop

To check logs:

     $ docker-compose -f docker-compose-jupyter.yml logs -f

     (stop logs with CTRL-c")

To check running containers:

     $ docker-compose -f docker-compose-jupyter.yml ps

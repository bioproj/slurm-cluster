FROM ubuntu:22.04

RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurmd slurm-client slurmctld slurmdbd slurmrestd -y
RUN apt-get update && apt-get install mariadb-server  -y
RUN apt-get install sudo  -y
# RUN apt install sudo -y && apt install python3.9 python3-pip -y 
RUN useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
RUN echo "root     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
# RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py

RUN wget https://deb.nodesource.com/setup_18.x
RUN bash ./setup_18.x
RUN apt-get install nodejs -y
RUN apt-get install python3-pip -y
RUN pip install jupyterlab
RUN pip install jupyterlab_slurm

RUN apt-get autoremove -y
RUN apt-get clean -y

COPY slurm.conf /etc/slurm/
COPY cgroup.conf /etc/slurm/
COPY slurmdbd.conf /etc/slurm/
COPY docker-entrypoint.sh /etc/slurm/

EXPOSE 6817 6818 6819 3306 
RUN chmod 600 /etc/slurm/slurmdbd.conf
WORKDIR /home/admin
COPY initialize-mariadb.sh .
COPY start-slurmrestd.sh .
ENV USER root
ENTRYPOINT ["/etc/slurm/docker-entrypoint.sh"]

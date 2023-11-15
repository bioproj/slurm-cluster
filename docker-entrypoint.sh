#!/bin/bash

# sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmd start
sudo service mariadb start
sudo mysql -u root < initialize-mariadb.sh
sudo service slurmdbd start
# sudo service slurmctld start

# service  --status-all
#  srun  hostname
echo 'starting slurmrestd'
sudo -u admin sh start-slurmrestd.sh &
echo 'starting slurmctld'
sleep 2
sudo service slurmctld start
service  --status-all
# slurmctld -D

tail -f /dev/null

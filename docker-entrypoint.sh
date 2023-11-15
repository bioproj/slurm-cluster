#!/bin/bash

# sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

sudo service munge start
sudo service slurmd start
sudo service mariadb start
sudo mysql -u root < initialize-mariadb.sh
sudo service slurmdbd start
sudo service slurmctld start
tail -f /dev/null
# service  --status-all
#  srun  hostname
sudo -u admin sh start-slurmrestd.sh
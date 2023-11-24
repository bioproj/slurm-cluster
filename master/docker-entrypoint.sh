#!/bin/bash

# sudo sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
###################################################
# 授权服务
sudo service munge start
###################################################

###################################################
# 执行节点
sudo service slurmd start
###################################################

###################################################
# 数据库配置
sudo service mariadb start
sudo mysql -u root < initialize-mariadb.sh
sudo service slurmdbd start
###################################################

###################################################
# 控制节点
sleep 2
echo 'starting slurmctld'
sudo service slurmctld start
###################################################

###################################################
# slurmrestd 配置，要运行slurmrestd必须加上参数--privileged 
# docker run  --name slurm-all --privileged    --network=host --rm -it  wangyang1749/slurm-all:1.0
# echo 'starting slurmrestd'
# sudo -u admin sh start-slurmrestd.sh &
###################################################
sudo -u admin  jupyter lab --no-browser --allow-root --ip=0.0.0.0 --NotebookApp.token='' --NotebookApp.password='' &

echo "启动的服务..."
service  --status-all
# slurmctld -D
tail -f /dev/null
# docker build -t wangyang1749/slurm-all:1.0 .
# docker run  --name slurm-all     --network=host --rm -it  wangyang1749/slurm-all:1.0
# docker image push wangyang1749/slurm-all-master:1.0

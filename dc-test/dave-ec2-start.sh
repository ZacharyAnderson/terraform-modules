#!/bin/bash
sudo yum update -y
sudo yum install git -y
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y  http://vault.centos.org/centos/7.3.1611/extras/x86_64/Packages/container-selinux-2.9-4.el7.noarch.rpm
sudo yum install -y docker-ce
sudo systemctl start docker
mkdir workspace
cd workspace/
git clone https://github.com/ZacharyAnderson/dc-python-docker-logs.git
cd dc-python-docker-logs/
sudo docker build --tag=dc-test .
sudo docker run -d --log-driver=awslogs --log-opt awslogs-region="us-west-2" \
                    --log-opt awslogs-group="docker-logs" --log-opt awslogs-stream="docker1" dc-test
sudo docker run -d --log-driver=awslogs --log-opt awslogs-region="us-west-2" \
                    --log-opt awslogs-group="docker-logs" --log-opt awslogs-stream="docker2" dc-test
sudo docker run -d --log-driver=awslogs --log-opt awslogs-region="us-west-2" \
                    --log-opt awslogs-group="docker-logs" --log-opt awslogs-stream="docker3" dc-test     

              
#!/usr/bin/env sh
temp=$(docker-machine env default | grep DOCKER_HOST)
if [ $? -ne 0 ]
then
  exit
fi
temp=${temp//export DOCKER_HOST=\"tcp\:\/\//}
export DOCKER_IP_ADDRESS=${temp//\:2376\"/}
ansible-playbook dev_applications.yml -i inventory
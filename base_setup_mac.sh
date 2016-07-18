#!/usr/bin/env sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install docker
brew install docker-machine
brew install ansible
brew cask install virtualbox
docker-machine create --driver virtualbox --tls-san boot2docker default

VBoxManage showvminfo default | grep -q "NIC 1 Rule(0):   name = http_alt"
if [ $? -ne 0 ]
then
  docker-machine stop default
  VBoxManage modifyvm default --natpf1 http_alt,tcp,0.0.0.0,8080,0.0.0.0,8080
fi
docker-machine start default

grep -q boot2docker /etc/hosts
if [ $? -ne 0 ]
then
  temp=$(docker-machine env default | grep DOCKER_HOST)
  if [ $? -ne 0 ]
  then
    exit
  fi
  temp=${temp//export DOCKER_HOST=\"tcp\:\/\//}
  ip_address=${temp//\:2376\"/}
  sudo -- sh -c -e "echo '${ip_address}   boot2docker' >> /etc/hosts"
fi
grep -q berunici /etc/hosts
if [ $? -ne 0 ]
then
  sudo -- sh -c -e "echo '10.133.23.136    berunici' >> /etc/hosts"
fi

eval "$(docker-machine env default)"
ansible-playbook devbox.yml -i inventory

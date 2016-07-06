#!/usr/bin/env sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install docker
brew install docker-machine
brew cask install virtualbox
docker-machine create --driver virtualbox --tls-san boot2docker default
docker-machine start default
temp=$(docker-machine env default | grep DOCKER_HOST)
temp=${temp//export DOCKER_HOST=\"tcp\:\/\//}
ip_address=${temp//\:2376\"/}
sudo -- sh -c -e "echo '${ip_address}   boot2docker' >> /etc/hosts"
eval "$(docker-machine env default)"

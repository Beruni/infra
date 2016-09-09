#!/usr/bin/env sh
sudo easy_install pexpect
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install docker
brew install docker-machine
docker-machine start default
ansible-playbook gitlab_ci_agent.yml -i inventory
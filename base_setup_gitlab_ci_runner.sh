#!/usr/bin/env sh
sudo easy_install pexpect
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install docker
brew install docker-machine
brew install heroku-toolbelt
echo "*********Going to login via SSO"
echo "\033[0;31m*********Make sure you press an extra <enter> after the logged in message for script to continue...\033[0m"

bash -c '(echo -e "thoughtworks-labs" && cat) | heroku login --sso'
docker-machine start default
ansible-playbook gitlab_ci_agent.yml -i inventory

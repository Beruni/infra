#!/usr/bin/env sh
sudo easy_install pexpect
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install docker
brew install docker-machine
brew install heroku-toolbelt
heroku plugins:install heroku-container-registry
echo "*********Going to login via SSO"
echo "\033[0;31m*********Make sure you press an extra <enter> after the logged in message for script to continue...\033[0m"

bash -c '(echo -e "thoughtworks-labs" && cat) | heroku login --sso'
docker-machine start default
ansible-playbook gitlab_ci_agent.yml -i inventory
echo "\033[1;33;44mYou need to enable the new runner at ->"
echo "https://git.thoughtworks.net/beruni/user_service/runners"
echo "https://git.thoughtworks.net/beruni/data_service/runners"
echo "https://git.thoughtworks.net/beruni/boundary_file_service/runners"
echo "https://git.thoughtworks.net/beruni/web/runners\033[0m"
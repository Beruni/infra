This repository contains the code related to infrastructure

- Dev box setup
- Deployment to production

# Dev Box setup

## Mac 
- Clone infra repository 'git clone git@git.thoughtworks.net:beruni/infra.git'
- Run script 'sh base_setup_mac.sh'

### Troubleshooting 

#### Virtual Box Commands are not accessible
This happens when Virtual Box is already installed and then brew does not install it. To fix this uninstall it and then 
brew will install it again from the script. 

#### Setup fails due to bash
Ensure bash_profile exists in the HOME location

#### Setup fails due to nvm failing
Mostly it is due to zsh. The below script gets added only to `.zshrc`. So copy the below and add it to `.bash_profile`.  
It will look something like below. ***Please note do not copy from this README. Copy from your .zshrc.*** 

```
export NVM_DIR="/Users/machine-name/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
```
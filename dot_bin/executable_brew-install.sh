#! /bin/sh

# Installs brew necessary packages

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> $HOME/.zshrc
brew update && brew upgrade
brew install minikube lazydocker speedtest-cli 

echo 'Brew Installation Done with all its packages'


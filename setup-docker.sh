#!/bin/bash
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y git zsh htop

if [ ! -d ~/.ssh ]; then
  ssh-keygen -f ~/.ssh/id_rsa -N ''
fi

if [ ! -f ~/.zshrc ]; then
  git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
  sudo chsh -s /bin/zsh dev
fi

if [ ! -f /usr/local/bin/docker-compose ]; then
  sudo apt-get install -y linux-image-extra-$(uname -r)
  sudo apt-get install -y docker-engine
  curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-$(uname -s)-$(uname -m) > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  sudo usermod -aG docker $(whoami)
fi

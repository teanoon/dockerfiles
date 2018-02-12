# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = "magicbook2"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.56.101"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"
  config.vm.synced_folder "C:\\Users\\antic\\OneDrive\\backup", "/backup"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  disk = "magicbook2-code.vhd"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "magicbook2"

    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    # Customize hardware on the VM:
    vb.cpus = 4
    vb.memory = 8196
    unless File.exist?(disk)
      vb.customize ['createhd', '--filename', disk, '--size', 30 * 1024]
      vb.customize ['storageattach', :id,  '--storagectl', 'SCSI', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk]
    end
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "storage", type: "shell", inline: <<-SHELL
    if [ ! -d /code ]; then
      mkdir /code
      echo -e "o\nn\np\n1\n\n\nw" | fdisk /dev/sdc
      mkfs -t ext4 /dev/sdc1
      echo "/dev/sdc1 /code ext4 defaults 0 0" >> /etc/fstab
      mount -a
      chown vagrant:vagrant /code -R
    fi
  SHELL

  config.vm.provision "dependencies", type: "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y --no-install-recommends vim htop zsh bc openvpn
  SHELL

  config.vm.provision "docker", type: "shell", inline: <<-SHELL
    if [ ! -f /usr/bin/docker ]; then
      apt-get update
      apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl software-properties-common
      curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
      apt-key fingerprint 0EBFCD88
      add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
      apt-get update
      apt-get install -y --no-install-recommends docker-ce
    fi

    if [ ! -f /etc/docker/daemon.json ]; then
      echo '{ "graph": "/code/docker", "dns": ["8.8.8.8", "8.8.4.4"], "bip": "172.99.0.1/16", "registry-mirrors": ["https://registry.docker-cn.com"] }' > /etc/docker/daemon.json
      systemctl restart docker
    fi

    if [ ! -f /usr/local/bin/docker-compose ]; then
      curl -OL https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m`
      curl -OL https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m`.sha256
      sha256sum -c docker-compose-`uname -s`-`uname -m`.sha256
      cp docker-compose-`uname -s`-`uname -m` /usr/local/bin/docker-compose
      rm docker-compose-`uname -s`-`uname -m`.sha256 docker-compose-`uname -s`-`uname -m`
      chmod +x /usr/local/bin/docker-compose
    fi
  SHELL

  config.vm.provision "user", type: "shell", inline: <<-SHELL
    chsh -s /usr/bin/zsh vagrant
    usermod -aG docker vagrant
    echo "%vagrant ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers.d/vagrant
  SHELL

  config.vm.provision "dev", type: "shell", privileged: false, inline: <<-SHELL
    if [ ! -f ~/.ssh/id_rsa ]; then
      mv ~/.ssh/authorized_keys ./
      tar zxf /backup/ssh.tar.gz
      mv authorized_keys ~/.ssh
    fi
    if [ ! -d ~/.oh-my-zsh ]; then
      git clone git@github.com:teanoon/oh-my-zsh.git ~/.oh-my-zsh
      ln -s ~/.oh-my-zsh/templates/docker-config ~/.docker
      ln -s ~/.oh-my-zsh/templates/tmux.config.template.1 ~/.tmux.conf
      ln -s ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
      echo "source ~/.oh-my-zsh/templates/zshrc.zsh-template.docker-machine" >> ~/.zshrc
    fi
  SHELL
end

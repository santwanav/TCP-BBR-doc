#! /bin/bash

# install the pre-reqs. Please note that the -y flag is to override any confirmation question you might get during the installation.
sudo apt -y update
sudo apt install -y libncurses-dev
sudo apt install -y libelf-dev
sudo apt install -y libssl-dev
sudo apt install -y flex
sudo apt install -y bison
sudo apt install -y pkg-config
sudo apt install -y gcc

# make extra space
sudo /usr/testbed/bin/mkextrafs /mnt

# move the extra space
cd /mnt

# download the git of net-next
sudo git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

# move to the git repo
cd net-next

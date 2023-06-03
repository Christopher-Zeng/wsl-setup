#!/usr/bin/env bash
Script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
Script_name="$(basename $BASH_SOURCE)" 

# Echo color configurations
Red=$(tput setaf 1)
Green=$(tput setaf 2)
Lime_yellow=$(tput setaf 190)
Powder_blue=$(tput setaf 153)
Magenta=$(tput setaf 5)
Cyan=$(tput setaf 6)
Bright=$(tput bold)
Normal=$(tput sgr0)
Underline=$(tput smul)

# Execution begins
echo "${Lime_yellow}Started $Script_name.${Normal}"

# Configure user
export DistroUsername="chris-zeng"
echo "${Lime_yellow}Configuring user.${Normal}"
bash $Script_dir/../essentials/user-setup.sh

# Configure wsl.conf
echo "${Lime_yellow}Configuring wsl.conf.${Normal}"

# Configure default user
sudo printf "[user]\ndefault=\"$DistroUsername\"\n" >> /etc/wsl.conf
# Enable systemd
sudo printf "[boot]\nsystemd=true\n" >> /etc/wsl.conf
# Disable auto-generation of /etc/resolv.conf
sudo printf "[network]\ngenerateResolvConf = false\n" >> /etc/wsl.conf

# Check wsl.conf
echo "The current content of /etc/wsl.conf is:"
cat /etc/wsl.conf

# Refresh APT
echo "${Lime_yellow}Refreshing APT.${Normal}"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

# Install packages
echo "${Lime_yellow}Installing packages.${Normal}"

# Install compilers
echo "${Lime_yellow}Installing compilers.${Normal}"
sudo apt install -y build-essential gcc g++ gdb clang-12 make cmake debian-keyring

# Install jdks
echo  "${Lime_yellow}Installing jdks.${Normal}"
sudo apt install -y default-jdk openjdk-8-jdk

# Install python
echo "${Lime_yellow}Installing Mambaforge.${Normal}"
sudo su - $DistroUsername -c "bash $Script_dir/../user-side-config/mambaforge-setup.sh"

# Configure git
echo "${Lime_yellow}Configuring git.${Normal}"
sudo su - $DistroUsername -c "bash $Script_dir/../user-side-config/git-config-christopher-zeng.sh"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
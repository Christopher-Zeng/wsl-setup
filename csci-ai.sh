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
echo "${Lime_yellow}Started csci AI script.${Normal}"

# Setup user
export distroUsername="chris-zeng"
echo "${Green}Setup user for the distro.${Normal}"
$Script_dir/user-setup.sh
# Update APT
echo "${Green}Update APT${Normal}"
$Script_dir/apt-setup.sh
# Setup Python
echo "${Green}Setup Python.${Normal}"
$Script_dir/python-setup.sh
# Setup C Compilers
echo "${Green}Setup C Compilers.${Normal}"
$Script_dir/compiler-setup.sh
# Setup CUDA
echo "${Green}Setup CUDA support.${Normal}"
$Script_dir/cuda-setup.sh
# Update APT
echo "${Green}Update APT${Normal}"
$Script_dir/apt-setup.sh

# Distro configuration
echo "${Green}Configure Git.${Normal}"
sudo -u $distroUsername distroUsername=$distroUsername $Script_dir/git-config.sh
echo "${Green}Configure Python virtualenv.${Normal}"
sudo -u $distroUsername distroUsername=$distroUsername $Script_dir/virtualenv-config.sh

# Clone the csci repos
echo "${Green}Clone project git repo.${Normal}"
sudo -u $distroUsername git clone https://github.com/Christopher-Zeng/csci567-lab.git /home/$distroUsername/csci567-lab
sudo -u $distroUsername git clone https://github.com/Christopher-Zeng/csci561-lab.git /home/$distroUsername/csci561-lab
sudo -u $distroUsername git clone https://github.com/Christopher-Zeng/csci544-lab.git /home/$distroUsername/csci544-lab
echo "${Green}Git repo cloned.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended csci AI script.${Normal}"
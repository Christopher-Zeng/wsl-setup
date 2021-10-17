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
echo "${Lime_yellow}Started csci567 script.${Normal}"

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
# Setup CUDA
echo "${Green}Setup CUDA support.${Normal}"
$Script_dir/cuda-setup.sh

# Setup project environment

# Distro configuration
echo "${Green}Configure Git.${Normal}"
sudo -u $distroUsername $Script_dir/git-config.sh
echo "${Green}Configure Python virtualenv.${Normal}"
sudo -u $distroUsername distroUsername=$distroUsername $Script_dir/virtualenv-config.sh

# Clone the csci567-lab repo
echo "${Green}Clone project git repo.${Normal}"
sudo -u $distroUsername git clone https://github.com/Christopher-Zeng/csci567-lab.git /home/$distroUsername/csci567-lab
echo "${Green}Git repo cloned.${Normal}"

# Setup project environment
echo "${Green}Setup project environment.${Normal}"
su - $distroUsername << "EOF"
virtualenv ~/csci567-lab/env
printf "\n# Start up within project virtual environment.\ncd ~/csci567-lab\nsource ./env/bin/activate\n" >> ~/.bashrc
source ~/csci567-lab/env/bin/activate
pip install --upgrade pip jupyterlab numpy pandas
EOF
echo "${Green}Project environment setup completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended csci567 script.${Normal}"
#!/usr/bin/env bash -v
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

# Setup user
export distroUsername="capstone"
echo "${Green}Setup user for the distro.${Normal}"
bash $Script_dir/user-setup.sh
# Update APT
echo "${Green}Update APT${Normal}"
bash $Script_dir/apt-setup.sh
# Setup Python
echo "${Green}Setup Python.${Normal}"
bash $Script_dir/python-setup.sh
# Setup R
echo "${Green}Setup R and RStudio.${Normal}"
bash $Script_dir/R-setup.sh
# Setup DBMS
echo "${Green}Setup DBMS backends.${Normal}"
bash $Script_dir/dbms-setup.sh

# Setup project environment

# Distro configuration
echo "${Green}Configure Git.${Normal}"
sudo -u $distroUsername bash $Script_dir/git-config.sh
echo "${Green}Configure Python virtualenv.${Normal}"
sudo -u $distroUsername bash $Script_dir/virtualenv-config.sh

# Clone the apan-capstone repo
echo "${Green}Clone project git repo.${Normal}"
su $distroUsername -c "git clone https://github.com/Christopher-Zeng/capstone.git"
echo "${Green}Git repo cloned.${Normal}"

# Setup project environment
echo "${Green}Setup project environment.${Normal}"
su - $distroUsername << "EOF"
pipx install pgadmin4
virtualenv ~/capstone/env
printf "\n# Start up RStudio on distro login.\nsudo service rstudio-server start.\n" >> ~/.bashrc
printf "\n# Start up within project virtual environment.\ncd ~/csci567-lab\nsource ./env/bin/activate\n" >> ~/.bashrc
source ~/capstone/env/bin/activate
pip install --upgrade pip jupyterlab numpy pandas
EOF
echo "${Green}Project environment setup completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
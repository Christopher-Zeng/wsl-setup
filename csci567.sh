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
echo "${Lime_yellow}Started csci567 script.${Normal}"

# Setup user
export distroUsername="chris-zeng"
echo "${Green}Setup user for the distro.${Normal}"
bash $Script_dir/user-setup.sh
# Update APT
echo "${Green}Update APT${Normal}"
bash $Script_dir/apt-setup.sh
# Setup Python
echo "${Green}Setup Python.${Normal}"
bash $Script_dir/python-setup.sh

# Setup project environment

# Git configurations
echo "${Green}Configure Git settings.${Normal}"
git config --system credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
git config --system user.name 'Christopher-Zeng'
git config --system user.email '32022231+Christopher-Zeng@users.noreply.github.com'
echo "the current git configuration is:"
git config --list
echo "${Green}Git configuration completed.${Normal}"

# Clone the csci567-lab repo
echo "${Green}Clone project git repo.${Normal}"
su $distroUsername -c "git clone https://github.com/Christopher-Zeng/csci567-lab.git ~/csci567-lab"
echo "${Green}Git repo cloned.${Normal}"

# Setup project virtual environment
echo "${Green}Install virtualenv.${Normal}"
su - $distroUsername << "EOF"
python3 -m pip install --user pipx
python3 -m pipx ensurepath 
EOF
su - $distroUsername << "EOF"
eval "$(register-python-argcomplete pipx)"
pipx install virtualenv
EOF
echo "${Green}Installation completed.${Normal}"
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
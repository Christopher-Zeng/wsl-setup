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

# Sudo with password
alias sudo="echo $sudoPW | sudo -S"
if [[ "$USER" != "root" && ("$USER" != "$Username" || -z "$sudoPW") ]]
then 
    echo "please provide password for $USER to invoke sudo:"
    read -s -p "password for $USER:" sudoPW
fi

# Execution begins
echo "${Lime_yellow}Started csci567 script.${Normal}"

# Check prereqs
distroUsername="chris-zeng"
if [ "$USER" != "$distroUsername" ]
then
    # From ubuntu-dev image
    echo "${Green}Prereqs not satisfied.${Normal}"
    echo "${Green}Build ubuntu-dev image.${Normal}"
    export Username
    export sudoPW
    export distroUsername
    bash $Script_dir/ubuntu-dev.sh
    echo "${Green}Build complete: ubuntu-dev.${Normal}"
    echo "${Green}Switch user to continue execution.${Normal}"
    sudo su $distroUsername -c "bash /home/$distroUsername/setup/$Script_name"
else
    echo "${Green}Prereqs satisfied.${Normal}"

    # Python and Jupyter
    echo "${Green}Install Python dependencies.${Normal}"
    sudo apt-get update && sudo apt-get install -y python3-pip python3-venv
    echo "${Green}Install virtualenv.${Normal}"
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    export PATH="$PATH:/home/caesarrav/.local/bin"
    eval "$(/home/caesarrav/.local/bin/register-python-argcomplete pipx)"
    pipx install virtualenv
    echo "${Green}Installation completed.${Normal}"

    # Clone the csci567-lab repo
    echo "${Green}Clone project git repo.${Normal}"
    git clone https://github.com/Christopher-Zeng/csci567-lab.git ~/csci567-lab
    echo "${Green}Git repo cloned.${Normal}"
    # Setup project virtual environment
    echo "${Green}Setup project environment.${Normal}"
    virtualenv ~/csci567-lab/env
    printf "\n# Start up within project virtual environment.\ncd ~/csci567-lab\nsource ./env/bin/activate\n" >> ~/.bashrc
    source ~/csci567-lab/env/bin/activate
    python3 -m pip install --upgrade pip
    pip install --upgrade jupyterlab numpy pandas
    echo "${Green}Project environment setup completed.${Normal}"
fi

# Execution ends
echo "${Lime_yellow}Ended csci567 script.${Normal}"
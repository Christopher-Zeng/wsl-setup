#!/usr/bin/env bash

# From ubuntu-dev
if [$user != "caesarrav"]
then
    export Username="caesarrav"
    bash ./ubuntu-dev.sh
    su caesarrav -c 'bash ~/setup/csci567.sh'
fi

# Clone the csci567-lab repo
git clone https://github.com/Christopher-Zeng/csci567-lab.git ~/csci567-lab

# Python and Jupyter
echo "Install Python dependencies and Jupyter"
sudo apt-get update && sudo apt-get install -y python3-pip python3-venv
python3 -m pip install --user pipx
python3 -m pipx ensurepath
export PATH="$PATH:/home/caesarrav/.local/bin"
eval "$(/home/caesarrav/.local/bin/register-python-argcomplete pipx)"
pipx install virtualenv

# Setup project virtual environment
virtualenv ~/csci567-lab/env
printf "\n# Start up within project virtual environment.\ncd ~/csci567-lab\nsource ./env/bin/activate\n" >> ~/.bashrc
cd ~/csci567-lab
source ./env/bin/activate
python3 -m pip install --upgrade pip
pip install --upgrade jupyterlab numpy pandas

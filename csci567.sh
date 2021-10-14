#!/usr/bin/env bash

# Clone the csci567-lab repo
git clone https://github.com/Christopher-Zeng/csci567-lab.git ~/csci567-lab

# Python and Jupyter
echo "Install Python dependencies and Jupyter"
sudo apt-get update && sudo apt-get install -y python3-pip python3-venv
python3 -m pip install --user pipx
python3 -m pipx ensurepath
eval "$(/home/caesarrav/.local/bin/register-python-argcomplete pipx)"
/home/caesarrav/.local/bin/pipx install virtualenv

# Setup project virtual environment
virtualenv ~/csci567-lab/env
printf "\n# Start up within project virtual environment.\ncd ~/csci567-lab\n./env/bin/activate\n" >> ~/.bashrc
cd ~/csci567-lab
./env/bin/activate
python3 -m pip install --upgrade pip
pip install --upgrade jupyterlab numpy pandas
printf "\n# Start up Jupyter Lab when distro starts.\njupyter-lab --no-browser\n" >> ~/.bashrc
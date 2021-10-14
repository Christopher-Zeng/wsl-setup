#!/usr/bin/env bash

# R and RStudio
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
apt-get update && apt-get install -y --no-install-recommends r-base-dev gdebi-core
wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2021.09.0-351-amd64.deb
gdebi -n rstudio-server-2021.09.0-351-amd64.deb

# Python and Jupyter
echo "Install Python dependencies and Jupyter"
sudo apt-get update && sudo apt-get install -y python3-pip
python3 -m pip install --user pipx
python3 -m pipx ensurepath
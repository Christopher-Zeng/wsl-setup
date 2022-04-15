#!/usr/bin/env bash
Script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
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

# Setup Python virtual environment
echo "${Green}Install Python virtualenv.${Normal}"
python3 -m pip install --user pipx
python3 -m pipx ensurepath
PATH="$PATH:/home/$distroUsername/.local/bin"
eval "$(register-python-argcomplete pipx)"
pipx install virtualenv
echo "${Green}Installation completed.${Normal}"

# Setup miniconda and mamba
echo "${Green}Install Miniconda.${Normal}"
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p /home/$distroUsername/miniconda
cat >>~/.bashrc <<EOF

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$distroUsername/miniconda/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$distroUsername/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/$distroUsername/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/$distroUsername/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
EOF
echo "${Green}Installation completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"

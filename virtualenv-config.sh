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

# Setup Python virtual environment
echo "${Green}Install Python virtualenv.${Normal}"
python3 -m pip install --user pipx
python3 -m pipx ensurepath 
export PATH="$PATH:/home/$distroUsername/.local/bin"
eval "$(register-python-argcomplete pipx)"
pipx install virtualenv
echo "${Green}Installation completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
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

# Setup mambaforge
echo "${Green}Install Mambaforge.${Normal}"
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O /tmp/mambaforge.sh
bash /tmp/mambaforge.sh -b -p /home/$distroUsername/mambaforge
cat >>~/.bashrc <<EOF

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/$distroUsername/mambaforge/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/$distroUsername/mambaforge/etc/profile.d/conda.sh" ]; then
        . "/home/$distroUsername/mambaforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/$distroUsername/mambaforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/$distroUsername/mambaforge/etc/profile.d/mamba.sh" ]; then
    . "/home/$distroUsername/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

EOF
echo "${Green}Installation completed.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"

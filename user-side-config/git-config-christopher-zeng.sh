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

# Importable variable: $WinUserName

# Git configurations
echo "${Green}Configure Git settings.${Normal}"

if [ -z "$WinUserName" ]
then 
    read -p "Windows User Name (Shorthand name): "$WinUserName
fi

git config --global credential.helper "/mnt/c/Users/$GitUserName/AppData/Local/Programs/Git/mingw64/bin/git-credential-manager.exe"
git config --global user.name 'Christopher-Zeng'
git config --global user.email '32022231+Christopher-Zeng@users.noreply.github.com'
echo "the current git configuration is:"
git config --list
echo "${Green}Configuration completed.${Normal}"


# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
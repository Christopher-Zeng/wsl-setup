#!/usr/bin/env bash -v
Script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

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
    read -s -p "please provide password for $USER to invoke sudo:\n" sudoPW
fi

# Execution begins
echo "${Lime_yellow}Started ubuntu-dev script.${Normal}"

# User configuration
echo "${Green}Configure new user.${Normal}"
if [ -z "$distroUsername" ]
then 
    read -p "Username: " distroUsername
fi
sudo adduser $distroUsername
sudo usermod -aG sudo $distroUsername
# Copy the setup directory to the user home directory
sudo mkdir /home/$distroUsername/setup
sudo cp -r $Script_dir/* /home/$distroUsername/setup
sudo chmod +s $(ls /home/$distroUsername/setup/*.sh)
echo "${Green}User setup complete.${Normal}"

# WSL configurations
echo "${Green}Configure WSL settings.${Normal}"
printf "[user]\ndefault=\"$distroUsername\"\n" >>./wsl.conf
sudo mv ./wsl.conf /etc/wsl.conf
echo "the content of /etc/wsl.conf is:"
cat /etc/wsl.conf
echo "${Green}WSL configuration completed.${Normal}"

# Dev Essentials
echo "${Green}Install dev essentials.${Normal}"
sudo apt-get update && sudo apt-get install -y build-essential
echo "${Green}Installation completed.${Normal}"
echo "${Green}Configure Git settings.${Normal}"
#!!!===change here to config git information===!!!#
git config --system credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
git config --system user.name 'Christopher-Zeng'
git config --system user.email '32022231+Christopher-Zeng@users.noreply.github.com'
echo "the current git configuration is:"
git config --list
echo "${Green}Git configuration completed.${Normal}"

# Clean up
echo "${Green}APT upgrade and cleanup.${Normal}"
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean
echo "${Green}APT upgraded.${Normal}"

# Execution ends
echo "${Lime_yellow}Ended ubuntu-dev script.${Normal}"
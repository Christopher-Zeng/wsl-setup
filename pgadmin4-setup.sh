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

# Importable variable distroUsername
echo "Find the user that pgadmin should be available to."
if [ -z "$distroUsername" ]
then 
    read -p "Username: " distroUsername
fi

# Create necessary directories for pgadmin4
sudo mkdir /var/lib/pgadmin
sudo mkdir /var/log/pgadmin
sudo chown $distroUsername /var/lib/pgadmin
sudo chown $distroUsername /var/log/pgadmin
# Install pgadmin4
sudo -u $distroUsername pipx install pgadmin4

# Execution ends
echo "${Lime_yellow}Ended $Script_name.${Normal}"
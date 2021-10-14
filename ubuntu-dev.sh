# User configuration
echo "Configure new user."
read -p "Username: " Username
adduser $Username
usermod -aG sudo $Username
git clone https://github.com/Christopher-Zeng/wsl-setup.git /home/$Username/setup

# WSL configurations
echo "Configure WSL"
printf "[user]\ndefault=\"$Username\"\n" >>./wsl.conf
sudo mv ./wsl.conf /etc/wsl.conf
echo "WSL configuration completed"

# Dev Essentials
echo "Install and check C and C++ build tools"
sudo apt-get update && sudo apt-get install -y build-essential gdb
echo "Installation completed"
echo "Configure Git"
##!!!===change here to config git information===!!!##
git config --system credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe"
git config --system user.name 'Christopher-Zeng'
git config --system user.email '32022231+Christopher-Zeng@users.noreply.github.com'\
echo "Git configuration completed"

# Clean up
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt clean

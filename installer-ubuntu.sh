#!/bin/sh

# This is a post setup script that install all the programs
# that i like to use after an ubuntu-based distro post 
# install. simple and fast.

# Update repos and packages
sudo dpkg --add-architecture i386
sudo apt update -y
sudo apt upgrade -y


# Install from repos
sudo apt install tiled gimp krita audacity simplescreenrecorder lmms git flatpak gnome-software dosbox quadrapassel gnome-boxes plank playonlinux flameshot apt-transport-https curl gnome-software-plugin-flatpak neofetch steam ttf-mscorefonts-installer gnome-characters gnome-software-plugin-snap -y


# Install brave browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update -y
sudo apt install brave-browser -y


# Install github desktop
wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'

sudo apt-get update -y
sudo apt install github-desktop -y


# Install Lutris
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update -y
sudo apt install lutris -y


# Download DEBs
wget -c http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9522/wps-office_11.1.0.9522.XA_amd64.deb
wget -c https://az764295.vo.msecnd.net/stable/a5d1cc28bb5da32ec67e86cc50f84c67cc690321/code_1.46.0-1591780013_amd64.deb
wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
wget -c https://github.com/balena-io/etcher/releases/download/v1.5.99/balena-etcher-electron_1.5.99_amd64.deb

# Install DEBs
sudo dpkg -i wps-office_11.1.0.9522.XA_amd64.deb
sudo dpkg -i code_1.46.0-1591780013_amd64.deb
sudo dpkg -i discord-0.0.10.deb
sudo dpkg -i balena-etcher-electron_1.5.99_amd64.deb

sudo apt install -f


# Who doesn't like some good theming...
sudo add-apt-repository -u ppa:snwh/ppa
sudo add-apt-repository ppa:papirus/papirus
sudo add-apt-repository ppa:numix/ppa

sudo apt update -y

sudo apt install paper-icon-theme
sudo apt install moka-icon-theme faba-icon-theme faba-mono-icons
sudo apt install papirus-icon-theme
sudo apt install arc-theme
sudo apt install numix-icon-theme-circle


# Install flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.libresprite.LibreSprite com.orama_interactive.Pixelorama org.ppsspp.PPSSPP -y


# Install snaps
snap install blender --channel=2.79/stable --classic
snap install cool-retro-term --classic
snap install retroarch kdenlive spotify

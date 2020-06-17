#!/bin/sh

# This is a post setup script that install all the programs
# that i like to use simply and fast.

# Update repos and packages
dpkg --add-architecture i386
apt update -y
apt upgrade -y

# Install from repos
apt install tiled gimp krita audacity simplescreenrecorder lmms git snapd flatpak gnome-software dosbox quadrapassel gnome-boxes plank playonlinux flameshot apt-transport-https curl gnome-software-plugin-flatpak neofetch steam ttf-mscorefonts-installer gnome-characters gnome-software-plugin-snap firmware-linux firmware-linux-nonfree firmware-ralink wireless-tools -y

# Install brave browser
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

apt update -y
apt install brave-browser -y

# Install github desktop
wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo apt-key add -
sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'
apt-get update -y
apt install github-desktop -y

# Install Lutris
echo "deb http://download.opensuse.org/repositories/home:/strycore/Debian_10/ ./" | sudo tee /etc/apt/sources.list.d/lutris.list

wget -q https://download.opensuse.org/repositories/home:/strycore/Debian_10/Release.key -O- | sudo apt-key add -

apt update -y
apt install lutris -y

# Download DEBs
wget -c http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/9522/wps-office_11.1.0.9522.XA_amd64.deb

wget -c https://az764295.vo.msecnd.net/stable/a5d1cc28bb5da32ec67e86cc50f84c67cc690321/code_1.46.0-1591780013_amd64.deb

wget -c https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb

wget -c https://github.com/balena-io/etcher/releases/download/v1.5.99/balena-etcher-electron_1.5.99_amd64.deb

# Install flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.libresprite.LibreSprite com.orama_interactive.Pixelorama org.ppsspp.PPSSPP -y

# Install snaps
snap install blender --channel=2.79/stable --classic
snap install cool-retro-term --classic
snap install retroarch kdenlive spotify

# This is a post setup script that install all the programs
# that i like to use simply and fast.

su

echo "Add the non free repos:"
echo "deb http://deb.debian.org/debian/ buster main contrib non-free"
nano /etc/apt/sources.list

# Update repos and packages
apt update -y
apt upgrade -y

# Install from repos
apt install tiled gimp krita audacity simplescreenrecorder lmms git snapd flatpak gnome-software dosbox quadrapassel gnome-boxes plank playonlinux flameshot apt-transport-https curl gnome-software-plugin-flatpak steam -y

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

# Install WPS office
wget http://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/8865/wps-office_11.1.0.8865_amd64.deb -O wps-office.deb

wget http://kdl.cc.ksosoft.com/wps-community/download/8372/wps-office_11.1.0.8372_amd64.deb -O web-office-fonts.deb

sudo dpkg -i wps-office*.deb -y
sudo apt-get install -f -y

# Install flatpaks
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.libresprite.LibreSprite com.orama_interactive.Pixelorama org.ppsspp.PPSSPP -y

# Install snaps
snap install blender --channel=2.79/stable --classic -y
snap install cool-retro-term retroarch kdenlive spotify -y
snap install code --classic -y



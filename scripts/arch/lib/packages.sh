#! /usr/bin/bash

# setup user folders
mkdir -p ~/Documents
mkdir -p ~/Pictures
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Videos
mkdir -p ~/Screenshots
mkdir -p ~/mpv_screenshots
mkdir -p ~/AppImages

[[ -z $file_manager ]] && 
echo "no file manager in config.sh" >> ~/log ||
pac $file_manager

[[ -z $music_playercli ]] && 
echo "no music player cli in config.sh" >> ~/log ||
pac $music_playercli

[[ -z $video_player ]] && 
echo "no video player in config.sh" >> ~/log ||
pac $video_player

[[ -z $file_manager ]] && 
echo "no file manager in config.sh" >> ~/log
[[ $browser == "Google chrome" ]] && ya "google-chrome"
[[ $browser == "Firefox" ]] && pac "firefox"

pac "zsh"
pac "which"
sudo chsh -s $(which zsh)
pac "zip"
pac "unzip"
pac "wget"
pac "bashtop"
pac "picom"
pac "easytag"
pac "ffmpegthumbnailer"
pac "ffmpegthumbs"
pac "pavucontrol"
pac "nitrogen"
pac "udisks2"
pac "ntfs-3g"
pac "neofetch"
pac "alsa-utils"
pac "code"
pac "feh"
pac "discord"
pac "htop"
pac "imagemagick"
pac "nodejs"
pac "npm"
pac "pulseaudio"
pac "python3"
pac "python-pip"
pac "rxvt-unicode"
pac "scrot"
pac "flameshot"
flameshot config --showhelp false

pac "curl"
pac "highlight"
pac "wine"
pac "youtube-dl"
pac "tree"
pac "xbindkeys"
pac "imwheel"
pac "nautilus"
pac "bc"
pac "lxappearance"
pac "rofi"
pac "gimp"
pac "gnome-calculator"
pac "steam"
pac "jgmenu"
# for more!
# https://jgmenu.github.io/screenshots.html
jgmenu_run init --theme=archlabs_1803

ya "colorpicker"
ya "figma-linux"
ya "cava"
ya "deadd-notification-center-bin"
ya "spaceship-prompt-git"
ya "code-marketplace"
ya "ls-icons"
ya "polybar"
ya "spaceship-prompt-git"

# fonts
pac "ttf-dejavu"
pac "ttf-liberation"
pac "ttf-font-awesome"
pac "noto-fonts-emoji"
pac "ttf-jetbrains-mono"
pac "ttf-fantasque-sans-mono"
pac "noto-fonts"
pac "ttf-droid"
pac "terminus-font"

ya "consolas-font"
ya "siji-git"
ya "ttf-material-icons-git"
ya "ttf-icomoon-feather"
ya "nerd-fonts-iosevka"
ya "noto-fonts-sc"
ya "ttf-ms-fonts"
ya "fontpreview-ueberzug-git"

wget https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip
unzip SteamFonts.zip -d SteamFonts/ && rm SteamFonts.zip
sudo mkdir -p /usr/local/share/fonts
sudo mv SteamFonts/* /usr/local/share/fonts
rm -rf SteamFonts/

wget https://github.com/Superjo149/auryo/releases/download/v2.5.4/Auryo-2.5.4.AppImage
chmod +x Auryo-2.5.4.AppImage
mv Auryo-2.5.4.AppImage ~/AppImages/

wget https://download.kde.org/stable/kdenlive/20.12/linux/kdenlive-20.12.3a-x86_64.appimage
chmod +x kdenlive-20.12.3a-x86_64.appimage
mv kdenlive-20.12.3a-x86_64.appimage ~/AppImages

git clone https://github.com/thameera/vimv.git
sudo cp vimv/vimv /usr/local/bin/
sudo chmod +x /usr/local/bin/vimv

curl -sLf https://spacevim.org/install.sh | bash

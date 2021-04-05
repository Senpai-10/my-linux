# setup user folders
mkdir -p ~/Documents
mkdir -p ~/Pictures
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Videos
mkdir -p ~/Screenshots


pac "zip"
pac "unzip"
pac "wget"
pac "bashtop"
pac "cmus"
pac "picom"
pac "easytag"
pac "nemo"
pac "ffmpegthumbnailer"
pac "ffmpegthumbs"
pac "mpv"
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
pac "curl"
pac "which"
pac "highlight"
pac "youtube-dl"
pac "tree"
pac "xbindkeys"
pac "imwheel"
pac "bc"
pac "lxappearance"

ya "colorpicker"
ya "figma-linux"
ya "cava"

# fonts
pac "ttf-dejavu"
pac "ttf-liberation"
pac "ttf-font-awesome"
pac "noto-fonts-emoji"
ya "noto-fonts-sc"
ya "ttf-ms-fonts"

cd ~/Downloads
wget https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip
unzip SteamFonts.zip -d SteamFonts/ && rm SteamFonts.zip
sudo mkdir -p /usr/local/share/fonts
sudo mv SteamFonts/* /usr/local/share/fonts
rm -rf SteamFonts/
cd ~

browser=$(echo -e "Google chrome
Firefox" | fzf --layout=reverse)

[[ $browser == "Google chrome" ]] && ya "google-chrome"
[[ $browser == "Firefox" ]] && pac "firefox"

# copy dot files
cd ../..
cd dotfiles

mkdir -p ~/.config && 
mkdir -p ~/.config/nvim &&
cp nvim/init.vim ~/.config/nvim/ ||
echo "can't copy init.vim" >> ~/log

cp .* ~/

#cp -r compton ~/.config/
cp picom.conf ~/.config

mkdir -p ~/.config/mpv &&
mkdir -p ~/.config/mpv/scripts &&
cp mpv_scripts/* ~/.config/mpv/scripts/ ||
echo "can't copy mpv scripts" >> ~/log

touch ~/.config/mpv/mpv.conf && 
echo \"osc=no\" >> ~/.config/mpv/mpv.conf

cd ..
cd themes

# copy cmus themes
mkdir -p /usr/share/cmus/ &&
cp cmus/*.theme /usr/share/cmus/

# set system themes
mkdir -p ~/.themes &&
cp -r gtk/* ~/.themes/ ||
echo "can't copy themes" >> ~/log

mkdir -p ~/.icons &&
cp -r icons/* ~/.icons ||
echo "can't copy icons" >> ~/log

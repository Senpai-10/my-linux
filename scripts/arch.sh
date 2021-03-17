#! /bin/bash

installing () {
    echo -e "- \e[92m\e[1mInstalling $1\e[0m"
}

configure () {
    echo -e "- \e[1;93mConfigure $1\e[0m"
}


if pacman -Qe "yay" > /dev/null ; then
    echo
else
    cd ~
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
fi

if pacman -Qe "smenu" > /dev/null ; then
    echo
else
    yay -S smenu
fi

clear

main () {

    option_1="Packages"
    option_2="Window manager"
    option_3="Terminal"
    option_4="Quit"

    options="
    $option_1\n$option_2\n$option_3\n$option_4
    "

    menu=$(echo $options | smenu -c -W $'\n' -N -M -m "install")

    if [[ $menu == $option_1 ]]
    then
        clear
        cd ~
        echo "- \033[1;94msetup user folders\033[0m"
        mkdir -p ~/Documents
        mkdir -p ~/Pictures
        mkdir -p ~/Downloads
        mkdir -p ~/Music
        mkdir -p ~/Videos
        mkdir -p ~/Screenshots

        installing "zip"
        yes | sudo pacman -S zip
        installing "unzip"
        yes | sudo pacman -S unzip
        installing "wget"
        yes | sudo pacman -S wget

        installing "fonts"
        installing "ttf-dejavu"
        yes | sudo pacman -S ttf-dejavu
        installing "ttf-liberation"
        yes | sudo pacman -S ttf-liberation
        installing "ttf font awesome"
        yes | sudo pacman -S ttf-font-awesome
        installing "noto fonts emoji"
        yes | sudo pacman -S noto-fonts-emoji
        installing "noto-fonts-sc"
        yay -S noto-fonts-sc
        yay -S ttf-ms-fonts
        
        cd Downloads
        wget https://support.steampowered.com/downloads/1974-YFKL-4947/SteamFonts.zip
        unzip SteamFonts.zip -d SteamFonts/ && rm SteamFonts.zip
        mkdir -p /usr/local/share/fonts
        sudo mv SteamFonts/* /usr/local/share/fonts
        rm -rf SteamFonts/
        cd ~

        

        installing "nemo"
        yes | sudo pacman -S nemo
        installing "vlc"
        yes | sudo pacamn -S vlc
        installing "pavucontrol"
        yes | sudo pacman -S pavucontrol
        installing "nitrogen"
        yes | sudo pacman -S nitrogen
        #installing "pcmanfm"
        #yes | sudo pacman -S pcmanfm
        installing "udisks"
        yes | sudo pacman -S udisks2
        installing "ntfs-3g"
        yes | sudo pacman -S ntfs-3g
        installing "w3m"
        yay -S w3m
        installing "neofetch"
        yes | sudo pacman -S neofetch
        installing "neovim"
        yes | sudo pacman -S neovim
        installing "alsa-utils"
        yes | sudo pacman -S alsa-utils
        installing "vscode"
        yes | sudo pacman -S code
        installing "discord"
        yes | sudo pacman -S discord
        installing "feh"
        yes | sudo pacman -S feh
        installing "git"
        yes | sudo pacman -S git
        
        menu=$(echo "GoogleChrome\nFirefox" | smenu -c -W $'\n' -N -M -m "browser")

        if [[ $menu == "GoogleChrome" ]]
        then
            yay -S google-chrome
        fi

        if [[ $menu == "Firefox" ]]
        then
            sudo pacman -S firefox
        fi

        installing "htop"
        yes | sudo pacman -S htop
        installing "imagemagick"
        yes | sudo pacman -S imagemagick
        installing "nodejs"
        yes | sudo pacman -S nodejs
        installing "npm"
        yes | sudo pacman -S npm
        

        installing "pulseaudio"
        yes | sudo pacman -S pulseaudio
        installing "python3"
        yes | sudo pacman -S python3
        installing "python pip"
        yes | sudo pacman -S python-pip
        installing "rxvt unicode"
        yes | sudo pacman -S rxvt-unicode
        installing "scrot"
        yes | sudo pacman -S scrot
        installing "which"
        yes | sudo pacman -S which
        installing "curl"
        yes | sudo pacman -S curl
        installing "xbindkeys"
        yes | sudo pacman -S xbindkeys
        
        installing "dot files"
        [ -e ~/.xbindkeysrc ] && rm ~/.xbindkeysrc
        curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/dotfiles/.xbindkeysrc -o ~/.xbindkeysrc

        [ -e ~/.bashrc ] && rm ~/.bashrc
        curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/dotfiles/.bashrc -o ~/.bashrc

        [ -e ~/.nvimrc ] && rm ~/.nvimrc
        curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/dotfiles/.nvimrc -o ~/.nvimrc


        [ -e ~/.xinitrc ] && rm ~/.xinitrc
        curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/dotfiles/.xinitrc -o ~/.xinitrc

        [ -f ~/.env ] || touch ~/.env

        


        menu=$(echo "back" | smenu -c -W $'\n' -N -M -m "Installation finished")
        [[ $menu == "back" ]] && clear; main

    fi

    if [[ $menu == $option_2 ]]
    then
        clear
        
        menu=$(echo "dwm\nopenbox\nback" | smenu -c -W $'\n' -N -M -m "$option_2")

        if [[ $menu == "dwm" ]]
        then
            clear
            installing "dwm"
            mkdir -p ~/wm
            cd ~/wm &&
            git clone https://github.com/Senpai-10/dwm.git &&
            cd dwm
            sudo make install &&
            cd ..

            installing "dmenu"
            git clone https://github.com/Senpai-10/dmenu.git &&
            cd dmenu
            sudo make install &&
            cd ..
            
            installing "slstatus"
            git clone https://github.com/Senpai-10/slstatus.git &&
            cd slstatus
            sudo make install &&
            cd ..
            
            echo "exec slstatus &" >> ~/.xinitrc
            echo "exec dwm" >> ~/.xinitrc

            menu=$(echo "back" | smenu -c -W $'\n' -N -M -m "Installation finished")
            [[ $menu == "back" ]] && clear; main

        fi

        if [[ $menu == "openbox" ]]
        then
            yes | sudo pacman -S openbox
            echo "openbox" >> ~/.xinitrc

            menu=$(echo "back" | smenu -c -W $'\n' -N -M -m "Installation finished")
            [[ $menu == "back" ]] && clear; main
        fi

        [[ $menu == "back" ]] && clear; main

    fi

    if [[ $menu == $option_3 ]]
    then
        clear

        menu=$(echo "st\nkitty\nback" | smenu -c -W $'\n' -N -M -m $option_3)

        if [[ $menu == "st" ]]
        then
            clear
            menu=$(echo "Luke st\nsuckless st\nback" | smenu -c -W $'\n' -N -M -m "st build")

            if [[ $menu == "Luke st" ]]
            then
                installing "Luke's fork of st"
                cd ~
                git clone https://github.com/LukeSmithxyz/st
                cd st
                sudo make install
                cd ~

                clear
                menu=$(echo "back" | smenu -c -W $'\n' -N -M -m "Installation finished")

                if [[ $menu == "back" ]]
                then
                    clear
                    main
                fi

            fi

            if [[ $menu == "suckless st" ]]
            then
                cd ~
                git clone https://git.suckless.org/st
                cd st
                sudo make install
                cd ~
            fi

            if [[ $menu == "back" ]]
            then
                clear
                main
            fi
        fi

        if [[ $menu == "kitty" ]]
        then
            installing "kitty"
            yes | sudo pacman -S kitty && echo -e "\n"
            configure "kitty"; echo -e "\n"
            clear

            menu=$(echo "Theme (1)\ndefault" | smenu -c -W $'\n' -N -M -m "kitty Theme")

            if [[ $menu == "Theme (1)" ]]
            then
                mkdir -p ~/.config/kitty/themes
                curl https://raw.githubusercontent.com/Senpai-10/my-linux/main/themes/1/1.conf \
                -o ~/.config/kitty/themes/1.conf

                echo "include ~/.config/kitty/themes/1.conf" >> ~/.config/kitty/kitty.conf
            fi

            clear
            menu=$(echo "y\nn" | smenu -c -W $'\n' -N -M -m "sync_to_monitor")

            if [[ $menu == "y" ]]
            then
                echo "sync_to_monitor yes" >> ~/.config/kitty/kitty.conf
            fi

            clear

            menu=$(echo "1\n.9\n.8\n.7\n.6\n.5\n.4\n.3\n.2\n.1" | smenu -c -W $'\n' -n10 -N -M -m "background_opacity")

            echo "background_opacity $menu" >> ~/.config/kitty/kitty.conf
        
            menu=$(echo "back" | smenu -c -W $'\n' -N -M -m "Installation finished")

            if [[ $menu == "back" ]]
            then
                clear
                main
            fi
        fi

        if [[ $menu == "back" ]]
        then
            clear
            main
        fi

    fi

    if [[ $menu == $option_4 ]]
    then
        clear
        exit
    fi
}

main
#!/bin/bash

repo_dir=$(pwd)
sudo pacman -Syu xorg lightdm lightdm-gtk-greeter bspwm sxhkd setxkbmap \
    rofi pcmanfm git lxappearance arandr mate-polkit network-manager-applet \
    volumeicon dunst light-locker scrot rsync &
sudo yay -S polybar &
cd /usr/local/src/ &
sudo git clone https://github.com/vim/vim/ &
sudo ./configure --with-features=huge --with-x \
    --enable-python3interp=dynamic --with-python3-command=python3 \
    --with-python3-config-dir=$(python3-config --configdir) \
    --enable-gui=gtk2 --enable-cscope --enable-gui=auto \
    --enable-fail-if-missing &
sudo make && sudo make install &
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &
sudo pacman -Syu ctags &
cd $HOME/Downloads/ &
curl -fLo nerd-fonts/Ubuntu.zip --create-dirs \
    https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip &
sudo mkdir /usr/share/fonts/TTF/UbuntuNerd &
sudo unzip nerd-fonts/Ubuntu.zip -d /usr/share/fonts/TTF/UbuntuNerd/ &
rmdir -r $HOME/Downloads/nerd-fonts &
cd $repo_dir & rsync -a . --exclude bin \
    --exclude .git --exclude vim \
    --exclude desktop-environment-setup.sh \
    --exclude run.bspwm $HOME/.config/ &
sudo mkdir -p $HOME/.local/bin/ & sudo rsync bin/ $HOME/.local/bin/ &
sudo chmod +x $HOME/.local/bin/* &
sudo rsync run.bspwm /usr/share/ & sudo chmod +x /usr/share/run.bspwm &
mkdir $HOME/.screenlayout & sudo rsync -a screenlayout/ $HOME/.screenlayout/ &
sudo chmod +x $HOME/.screenlayout/*.sh
sudo systemctl enable lightdm.service &
COUNTER=15
while [ 1 ] 
do
    if [ ${COUNTER} -eq 0 ]
    then
        break
    fi
    echo "System is rebooting after ${COUNTER}s."
    sleep 1
    COUNTER=$( echo "${COUNTER}-1" | bc )
done
sudo reboot

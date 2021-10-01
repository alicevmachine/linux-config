#/usr/bin/bash


echo "                    %                   "
echo "             .-*#@%%%%@%*-.             "
echo "           :#@*-.  ..  .-*@#:           "
echo "          *@+      =+      +@*          "
echo "         #@:      -==-      :@%         "
echo "        =@=     +@#+=*@*     -@+        "
echo "        #@ +**:=@=    -@=:**+ @%        "
echo "        #@.::: :@*    *@- :::.@#        "
echo "        -@*     :#@%%@#:     +@-        "
echo "         -=                 +@+         "
echo "        :#@@@@@@@@@@@@@@@: +@@#:        "
echo "       .%@  ................  @@:       "
echo "    .+%@@@  ################  @@@%+.    "
echo "   *@#: #@  :.  -  ::  -. .-  @% :*@#   "
echo "  +@#@#-%@  +: .+. ==  +: :+  @%:*@#@+  "
echo "  %@ .*@@@++++++++++++++++++++@@@*. @%  "
echo " .@@%@#*=----------@@----------=*#%%@@. "
echo " =@=               %@               =@= "
echo " #@.               %@                @# "
echo "#@@=              +@@*              -@@#"

#setup variables


#setup users

#assume root
echo $pass | doas su;

pacman -Syu

#start install commands
pacman -S base-devel
pacman -S xorg xorg-xinit picom 
pacman -S kitty neofetch 
pacman -S vim emacs cmatrix
pacman -S pulseaudio nitrogen

#git commands
git clone https://github.com/alicevmachine/linux-config
git clone https://aur.archlinux.org/yay-git.git
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

#install yay

cd ~/yay-git
makepkg -si
cd

#yay commands
yay -S ponymix
cd ponymix
make

yay -S python-pywal
yay -S brave-bin

cp ~/etc/X11/xinit/xinitrc ~/.xinitrc
echo "MAKE SURE YOU EDIT .xinitrc!!!!"
echo "AT BOTTOM OF PAGE DELETE EVERYTHING AND PUT THE FOLLOWING"
echo "nitrogen --restore &"
echo "picom &"
echo "exce dwm&"

#move folders into their proper place
mkdir ~/custom
mv ~/linux-config/dwm ~/
mv ~/linux-config/neofetch ~/
mv ~/linux-config/icons ~/custom
mv ~/linux-config/wallpapers ~/custom

#enviroment set up
cd ~/dwm
make clean install

#generate wallpaper and palette
nitrogen ~/custom/wallpapers/sega.png
wal -i ~/custom/wallpapers/sega.png

#set enviroment configs
printf "\nneofetch\n(cat ~/.cache/wal/sequences &)"

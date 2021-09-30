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
pass=4247

#setup users

#assume root
echo $pass | doas su;

#start install commands
pacman -S base-devel
pacman -S xorg xorg-xinit picom brave
pacman -S kitty neofetch 
pacman -S vim emacs cmatrix
pacman -S pulseaudio nitrogen

yay -S ponymix
yay -S python-pywal


#git commands

git clone https://github.com/alicevmachine/linux-config
git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -si
cd

cp ~/etc/X11/xinit/xinitrc ~/home/alicev/.xinitrc
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
printf "\n neofetch\n(cat ~/.cache/wal/sequences &)"

#!/bin/bash

sudo echo ""
echo "========================================================================="
echo "setting the folders in the directory .config"
if [[ $(ls ~/.config/ | grep "OldConfig") ]]; then
  zip -r "archive-$(date +"%Y-%m-%d").zip" ~/.config/OldConfig/
  rm -rf ~/.config/OldConfig
fi
mkdir ~/.config/OldConfig
if [[ $(ls ~/.config/ | grep "alacritty") ]]; then
  mv -f ~/.config/alacritty ~/.config/OldConfig

fi
cp -r src/alacritty ~/.config/

if [[ $(ls ~/.config/ | grep "i3") ]]; then
  mv -f ~/.config/i3 ~/.config/OldConfig
fi
cp -r src/i3/ ~/.config/

if [[ $(ls ~/.config/ | grep "picom") ]]; then
  mv -f ~/.config/picom ~/.config/OldConfig
fi
cp -r src/picom ~/.config/

if [[ $(ls ~/.config/ | grep "rofi") ]]; then
  mv -f ~/.config/rofi ~/.config/OldConfig
fi
cp -r src/rofi ~/.config/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fish -c "omf install bobthefish"
if [[ $(ls ~/.config/ | grep "fish") ]]; then
  mv -f ~/.config/fish ~/.config/OldConfig
fi
cp -r src/fish ~/.config/

if [[ $(ls ~/.config/ | grep "polybar") ]]; then
  mv -f ~/.config/polybar ~/.config/OldConfig
  sed -i "s/BAT1/$(ls /sys/class/power_supply/ | grep BAT)/g"  ~/.config/polybar/modules.ini
  sed -i "s/AC/$(ls /sys/class/power_supply/ | grep AC)/g"  ~/.config/polybar/modules.ini
fi
cp -rf src/polybar ~/.config/
sudo chown -R ${USER}:${USER} ~/.config/polybar/scripts/
sudo chmod -R 750 ~/.config/polybar/scripts/
echo "========================================================================="
echo "getting the gtk Theme"
wget -qO- https://git.io/papirus-icon-theme-install | DESTDIR="$HOME/.icons" sh
rm -rf ~/.themes/gruvbox-dark-gtk
git clone https://github.com/jmattheis/gruvbox-dark-gtk ~/.themes/gruvbox-dark-gtk
GTK_THEME="gtk-theme-name=\"gruvbox-dark-gtk\"\ngtk-font-name=\"Sans Regular\"\ngtk-icon-theme-name=\"Papirus-Dark\"\n"
echo -e ${GTK_THEME}> ~/.config/gtkrc
sed -i "s/gtk-theme-name=.*/gtk-theme-name=gruvbox-dark-gtk/g" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-font-name=.*/gtk-font-name=Sans Regular/g" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Papirus-Dark/g" ~/.config/gtk-3.0/settings.ini
sed -i "s/gtk-theme-name=.*/gtk-theme-name=gruvbox-dark-gtk/g" ~/.config/gtk-4.0/settings.ini
sed -i "s/gtk-font-name=.*/gtk-font-name=Sans Regular/g" ~/.config/gtk-4.0/settings.ini
sed -i "s/gtk-icon-theme-name=.*/gtk-icon-theme-name=Papirus-Dark/g" ~/.config/gtk-4.0/settings.ini
echo "========================================================================="
echo "getting nerd JetBrainsMono Nerd Fonts"
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip
mkdir -p JBNF
mv *.ttf JBNF && rm -r JetBrainsMono.zip
rm -rf /usr/share/fonts/JBNF
sudo mv -f JBNF /usr/share/fonts/
echo "JetBrainsMono Nerd Fonts installed in the directory /usr/share/fonts/JBNF"
echo "========================================================================="
echo "                                 done                                    "
echo "========================================================================="
echo " - now you need to install omf with bobthefish theme and you're done  :)"


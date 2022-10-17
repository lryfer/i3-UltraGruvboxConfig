#!/bin/bash

sed -i "s/include-file = \$HOME\/.config\/polybar\/modules.ini/#include-file = \$HOME\/.config\/polybar\/modules.ini/g" ~/.config/polybar/config.ini
sed -i "s/#include-file = \$HOME\/.config\/polybar\/modules-fr.ini/include-file = \$HOME\/.config\/polybar\/modules-fr.ini/g" ~/.config/polybar/config.ini

sed -i "s/locale = en_US.UTF-8/#locale = en_US.UTF-8/g" ~/.config/polybar/config.ini
sed -i "s/#locale = fr_FR.UTF-8/locale = fr_FR.UTF-8/g" ~/.config/polybar/config.ini

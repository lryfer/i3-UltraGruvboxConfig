#!/bin/bash

mv ~/.config/i3/config ~/.config/i3/config_stock
mv ~/.config/i3/config_nostock ~/.config/i3/config

xdotool key Super_L+Shift+r

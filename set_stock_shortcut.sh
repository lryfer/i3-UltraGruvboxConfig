#!/bin/bash

if [ -f "${HOME}/.config/i3/config_stock" ]; then
    if [ -f "${HOME}/.config/i3/config" ]; then
        mv ~/.config/i3/config ~/.config/i3/config_nostock
        mv ~/.config/i3/config_stock ~/.config/i3/config

        xdotool key Super_L+Shift+r
    fi
fi

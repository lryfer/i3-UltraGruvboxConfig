#!/bin/bash

if [ -f "${HOME}/.config/i3/config_nostock" ]; then
    if [ -f "${HOME}/.config/i3/config" ]; then
        mv ~/.config/i3/config ~/.config/i3/config_stock
        mv ~/.config/i3/config_nostock ~/.config/i3/config

        xdotool key Super_L+Shift+r
    fi
fi

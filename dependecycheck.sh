#!/bin/bash
$misdep 
misdep=""
if [[ -z $(command -v polybar) ]]; then
  misdep+=" polybar" 
fi
if [[ -z $(command -v alacritty) ]]; then
  misdep+=" alacritty"
fi
if [[ -z $(command -v i3) ]]; then
  misdep+=" i3-gaps/i3-wm"
fi
if [[ -z $(command -v fish) ]]; then
  misdep+=" fish"
fi
if [[ -z $(command -v picom) ]]; then
  misdep+=" picom"
fi
if [[ -z $(command -v feh) ]]; then
  misdep+=" feh"
fi
if [[ $misdep != "" ]]; then
  echo ${misdep:1}" is/are missing in the system"
  if [[ $(command -v pacman) ]]; then
  sudo pacman -S alacritty fish i3-gaps picom polybar feh i3lock
elif [[ $(command -v dnf) ]]; then
  sudo dnf install alacritty fish i3-gaps picom polybar feh i3lock
else
  echo "auto installer is not implemented for your system"
fi
else
  echo 'everything is installed'
fi

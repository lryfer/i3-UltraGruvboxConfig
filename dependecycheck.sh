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
  misdep+=" i3-gaps"
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
if [[ -z $(command -v rofi) ]]; then
  misdep+=" rofi"
fi
if [[ -z $(command -v htop) ]]; then
  misdep+=" htop"
fi
if [[ -z $(command -v gdu) ]]; then
  misdep+=" gdu"
fi
if [[ -z $(command -v i3lock) ]]; then
  misdep+=" i3lock"
fi
if [[ -z $(command -v papirus-icon-theme) ]]; then
  misdep+=" papirus-icon-theme"
fi
if [[ -z $(command -v pavucontrol) ]]; then
  misdep+=" pavucontrol"
fi
if [[ $misdep != "" ]]; then
  echo ${misdep:1}" is/are missing in the system"
  if [[ $(command -v pacman) ]]; then
    sudo pacman -S ${misdep}
  elif [[ $(command -v dnf) ]]; then
    sudo dnf install ${misdep}
  else
    echo "auto installer is not implemented for your system"
  fi
else
  echo 'everything is installed'
fi

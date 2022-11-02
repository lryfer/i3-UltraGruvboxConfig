#!/bin/bash
$misdep
$misdepyay
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
if [[ -z $(command -v pavucontrol) ]]; then
  misdep+=" pavucontrol"
fi
if [[ -z $(command -v xdotool) ]]; then
  misdep+=" xdotool"
fi
if [[ -z $(command -v zip) ]]; then
  misdep+=" zip"
fi

if [[ -z $(command -v rofi-bluetooth-git) ]]; then
  misdepyay+=" rofi-bluetooth-git"
fi
if [[ -z $(command -v rofi-wifi-menu-git) ]]; then
  misdepyay+=" rofi-wifi-menu-git"
fi
if [[ -z $(command -v rofi-mixer-git) ]]; then
  misdepyay+=" rofi-mixer-git"
fi
if [[ -z $(command -v rofi-calc) ]]; then
  misdepyay+=" rofi-calc"
fi
if [[ -z $(command -v rofi-emoji) ]]; then
  misdepyay+=" rofi-emoji"
fi

if [[ $misdep != "" ]]; then
  echo ${misdep:1}" is/are missing in the system"
  if [[ $(command -v pacman) ]]; then
    sudo pacman -S ${misdep}
    yay -S ${misdepyay}
  elif [[ $(command -v dnf) ]]; then
    sudo dnf install ${misdep}
  else
    echo "auto installer is not implemented for your system"
  fi
else
  echo 'everything is installed'
fi

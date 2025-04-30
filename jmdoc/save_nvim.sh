#!/bin/bash
#save nvim folder

NAME="jm-"

mv ~/.config/nvim ~/.config/nvim.bak$NAME$(date +%d-%m-%Y)
mv ~/.local/share/nvim ~/.local/share/nvim.bak$NAME$(date +%d-%m-%Y)
mv ~/.local/state/nvim ~/.local/state/nvim.bak$NAME$(date +%d-%m-%Y)
mv ~/.cache/nvim ~/.cache/nvim.bak$NAME$(date +%d-%m-%Y)

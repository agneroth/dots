#!/bin/bash

# TODO: Change %APPDATA% to WSL variable
# Requires installing FiraCode Nerd

cat <<EOF >> %APPDATA%/alacritty/alacritty.toml
[terminal]
[terminal.shell]
program = "wsl"
args: "cd && tmux"
[font]
size = 12.0

[font.bold]
family = "FiraCode Nerd Font"
style = "Bold"

[font.bold_italic]
family = "FiraCode Nerd Font"
style = "Bold Italic"

[font.italic]
family = "FiraCode Nerd Font"
style = "Italic"

[font.normal]
family = "FiraCode Nerd Font"
style = "Regular"

EOF

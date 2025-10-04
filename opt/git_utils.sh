#!/bin/bash

set -e # Set to error if command fails

GIT_FOLDER=$HOME/git

# ============ GOTO ============

git clone https://github.com/iridakos/goto.git $GIT_FOLDER/goto

# Enable GOTO
source $GIT_FOLDER/goto/goto.sh
goto -r git $GIT_FOLDER
goto -r dots $DOTS_FOLDER
goto -r ssh $HOME/.ssh

# ============ TMUX PLUGIN MANAGER ============

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
tmux source ~/.tmux.conf

# ============ ZSH ============

# TODO: Add ZSH and its plug-ins...
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unnatended
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# ============ NVIM Kickstart ============

# requires some dependencies... check the git
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
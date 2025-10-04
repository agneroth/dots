#!/bin/bash

# -------------------- NOTES --------------------
# It is best to install the commom dependencies and git utils before running this script.

set -eo pipefail # Set to error if command fails

# ============ Script variables ==============

# Base directory for cloning tools
export GIT_FOLDER=$HOME/git

# Directory where the dots repository is cloned to
# This should be updated / syncronized with bashrc_dots and zshrc_dots
export DOTS_FOLDER=$GIT_FOLDER/dots

MARKER_START="# === Dotfiles Sources - Start ==="
MARKER_END="# === Dotfiles Sources - End ==="

# ============ BASH ============

stow -d $DOTS_FOLDER -t ~ bash

sed -i.bak "/$MARKER_START/,/$MARKER_END/d" $HOME/.bashrc

cat<<EOF >> $HOME/.bashrc
$MARKER_START

source $HOME/.bashrc_dots
source $HOME/.bash_aliases

# For dinamically sourcing environment files with tmux
if [[ ! -z $TARGET_ENV ]]; then
        source $TARGET_ENV
fi

$MARKER_END
EOF

# =========== TMUX ===========

stow -d $DOTS_FOLDER -t ~ tmux

# =========== ZSH ============

sed -i.bak "/$MARKER_START/,/$MARKER_END/d" $HOME/.zshrc

cat<<EOF >> $HOME/.zshrc
$MARKER_START

source $HOME/.zshrc_dots
source $HOME/.zsh_aliases

# For dinamically sourcing environment files with tmux
if [[ ! -z $TARGET_ENV ]]; then
        source $TARGET_ENV
fi

$MARKER_END
EOF

# ============ OTHER ============

# Disable login message
if [ ! -f $HOME/.hushlogin ]; then 
    touch $HOME/.hushlogin
fi

# ============ .CONFIG COMBO ============

stow -d $DOTS_FOLDER -t ~/.config .config

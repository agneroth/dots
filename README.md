# Installation

For example on Ubuntu:

```sh
sudo apt install -y fzf neovim tmux ripgrep btop zsh starship fd-find bat tree-sitter-cli gcc make unzip git
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply https://github.com/agneroth/dots.git --branch main
```

> [!warning] 
> This will overwrite your nvim configurartion

Use the bleeding edge of nvim, for example

```
sudo apt install nix
sudo systemctl enable nix-daemon.socket --now
sudo usemod -aG nix-users ${USER}
nix profile add nixpkgs#neovim
```

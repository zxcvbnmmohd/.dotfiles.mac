# Dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system:

```shell
brew tap leoafarias/fvm
brew install fvm

brew install gh

brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

brew install neovim

brew install pyenv

brew install stow

brew install tmux

brew install zoxide
```

## Installation

First, clone the repo and cd into it

```shell
git clone zxcvbnmmohd/.dotfiles.mac --recurse-submodules ~/.dotfiles && cd ~/.dotfiles
```

Next, use GNU stow to create symlinks

```shell
stow .
```

Finall, ensure to download and install the nerd font, preferably JetBrainsMono Nerd Font:
https://www.nerdfonts.com/font-downloads

## Start Yabai

```shell
yabai --start-service
skhd --start-service
```

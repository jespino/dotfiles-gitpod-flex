#!/bin/bash
set -ex

echo "Setting up dotfiles"

sudo chsh "$(id -un)" --shell "/usr/bin/zsh"
sudo apt update

if [[ -z "$ZSH_VERSION" ]]; then
    echo "Installing zsh"
    sudo apt install zsh
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    echo "Installing oh-my-zsh..."
    sh "$HOME/dotfiles/.oh-my-zsh/install.sh" --unattended
fi

if [[ -d "$HOME/dotfiles" ]]; then
    # In gitpod, dotfiles are stored in this directory
    pushd "$HOME/dotfiles"
        cp .zshrc "$HOME/.zshrc"
        cp -r .oh-my-zsh/themes/* "$HOME/.oh-my-zsh/themes/"
    popd
fi

mkdir -p $HOME/.config
cp -r $HOME/dotfiles/nvim $HOME/.config/

sudo apt install -y neovim
alias vim=nvim
sudo apt install -y postgresql-client

export SHELL=zsh

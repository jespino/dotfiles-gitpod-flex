#!/bin/bash
set -ex

echo "Setting up dotfiles"


if [[ -z "$ZSH_VERSION" ]]; then
    echo "Installing zsh"
    sudo apt install zsh
fi

if [[ ! -d "~/.oh-my-zsh" ]]; then
    echo "Installing oh-my-zsh..."
    sh ~/dotfiles/.oh-my-zsh/install.sh --unattended
fi

if [[ -d "~/dotfiles" ]]; then
    # In gitpod, dotfiles are stored in this directory
    pushd "~/dotfiles"
        mv .zshrc ~/.zshrc
    popd
fi

export SHELL=zsh

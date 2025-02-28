# Install zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    sudo apt-get update
    sudo apt-get install -y zsh
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh ~/dotfiles/.oh-my-zsh/install.sh --unattended
fi

# TODO: Remove when zsh is working?
source ~/dotfiles/git/.alias
source ~/dotfiles/kubernetes/.alias
source ~/dotfiles/system/.alias

source ~/dotfiles/kubernetes/.functions
source ~/dotfiles/system/.functions

source ~/dotfiles/kubernetes/.env
source ~/dotfiles/git/.run

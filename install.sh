#!/usr/bin/env bash

# Dependency checks
if ! [ -x "$(command -v zsh)" ]; then
    echo "Error: Zsh not found. Please install it first."
    exit 1
fi

if ! [ -x "$(command -v nvim)" ]; then
    echo "Error: Neovim not found. Please install it first."
    exit 1
fi

if ! [ -x "$(command -v curl)" ]; then
    echo "Error: Curl not found. Please install it first."
    exit 1
fi

# Zsh + Oh My Zsh
echo "Changing default shell of user \"$USER\" to $(which zsh)"
chsh -s $(which zsh)
if [ -e ~/.oh-my-zsh ]; then
    echo "Backing up old ~/.oh-my-zsh to $PWD/.oh-my-zsh.old"
    mv ~/.oh-my-zsh $PWD/.oh-my-zsh.old
fi
if [ -e ~/.zshrc ]; then
    echo "Backing up old ~/.zshrc to $PWD/.zshrc.old"
    mv ~/.zshrc $PWD/.zshrc.old
fi
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "Symlinking .zshrc to ~/.zshrc"
rm ~/.zshrc
ln -s $PWD/.zshrc ~/.zshrc

# Powerline fonts
echo "Installing Powerline Fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Neovim
echo "Making nvim backup folder"
mkdir -p ~/.config/nvim/backup
echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if [ -e ~/.config/nvim/init.vim ]; then
    echo "Backing up old ~/.config/nvim/init.vim to $PWD/init.vim.old"
    mv ~/.config/nvim/init.vim $PWD/init.vim.old
fi
ln -s $PWD/init.vim ~/.config/nvim/init.vim

# Bin utilities
echo "Copying utilities to ~/.bin"
mkdir -p ~/.bin
cp $PWD/.bin/* ~/.bin

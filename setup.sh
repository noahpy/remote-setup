#!/bin/bash

echo "Neovim"

# Installation
sudo apt install neovim
if [ $? -ne 0 ]; then
    echo "Neovim installation failed"
    exit 1
fi

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
    echo "vim-plug installation failed"
    exit 1
fi

# Copy the neovim config
mkdir -p ~/.config/nvim && cp ./configs/neovim/init.vim ~/.config/nvim/init.vim
if [ $? -ne 0 ]; then
    echo "neovim config copy failed"
    exit 1
fi

# Run Pluginstall and quit
nvim -c PlugInstall -c q -c q
if [ $? -ne 0 ]; then
    echo "neovim plugin install failed"
    exit 1
fi

echo "Neovim setup complete"
echo "====================="
echo "Tmux"

# Installation
sudo apt install tmux
if [ $? -ne 0 ]; then
    echo "Tmux installation failed"
    exit 1
fi

# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
if [ $? -ne 0 ]; then
    echo "Tmux plugin manager installation failed"
    exit 1
fi

# Copy the tmux config
mkdir -p ~/.config/tmux && cp ./configs/tmux/tmux.conf ~/.config/tmux/tmux.conf
if [ $? -ne 0 ]; then
    echo "tmux config copy failed"
    exit 1
fi

# source config
tmux source ~/.config/tmux/tmux.conf
if [ $? -ne 0 ]; then
    echo "tmux config source failed"
    exit 1
fi

echo "Tmux setup complete"
echo "====================="
echo "Bashrc"

# Extend bashrc
cat ./configs/bash/bashrc-extend.sh >> ~/.bashrc
if [ $? -ne 0 ]; then
    echo "bashrc extend failed"
    exit 1
fi

# source config
source ~/.bashrc
if [ $? -ne 0 ]; then
    echo "bashrc source failed"
    exit 1
fi

echo "Bashrc setup complete"
echo "====================="

echo "Done"

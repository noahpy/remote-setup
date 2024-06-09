#!/bin/bash

echo "[INFO]: Neovim"

# Installation
sudo apt install neovim
if [ $? -ne 0 ]; then
    echo "[INFO]: Neovim installation failed"
    exit 1
fi

# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
    echo "[INFO]: vim-plug installation failed"
    exit 1
fi

# Copy the neovim config
mkdir -p ~/.config/nvim && cp ./configs/neovim/init.vim ~/.config/nvim/init.vim
if [ $? -ne 0 ]; then
    echo "[INFO]: neovim config copy failed"
    exit 1
fi

# Run Pluginstall and quit
nvim -c PlugInstall -c q -c q
if [ $? -ne 0 ]; then
    echo "[INFO]: neovim plugin install failed"
    exit 1
fi

echo "[INFO]: Neovim setup complete"
echo "[INFO]: ====================="
echo "[INFO]: Tmux"

# Installation
sudo apt install tmux
if [ $? -ne 0 ]; then
    echo "[INFO]: Tmux installation failed"
    exit 1
fi

# Install tpm
# Skip if already installed
if [ -d ~/.tmux/plugins/tpm ]; then
    echo "[INFO]: Tmux plugin manager already installed"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    if [ $? -ne 0 ]; then
        echo "[INFO]: Tmux plugin manager installation failed"
        exit 1
    fi
fi

# Copy the tmux config
mkdir -p ~/.config/tmux && cp ./configs/tmux/tmux.conf ~/.config/tmux/tmux.conf
if [ $? -ne 0 ]; then
    echo "[INFO]: tmux config copy failed"
    exit 1
fi

# source config
tmux -c "tmux source ~/.config/tmux/tmux.conf"
if [ $? -ne 0 ]; then
    echo "[INFO]: tmux config source failed"
    exit 1
fi

# Install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
if [ $? -ne 0 ]; then
    echo "[INFO]: tmux plugin install failed"
    exit 1
fi

echo "[INFO]: Tmux setup complete"
echo "[INFO]: ====================="
echo "[INFO]: Bashrc"

# Extend bashrc
cat ./configs/bash/bashrc-extend.sh >> ~/.bashrc
if [ $? -ne 0 ]; then
    echo "[INFO]: bashrc extend failed"
    exit 1
fi

echo "[INFO]: Bashrc setup complete"
echo "[INFO]: ====================="

echo "[INFO]: Done"

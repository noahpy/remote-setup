#!/bin/bash

echo -e "\033[33m[INFO]: Neovim \033[0m"
 
# Installation
echo -e "\033[33m[INFO]: Install neovim \033[0m"
sudo apt install neovim
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: Neovim installation failed \033[0m"
    exit 1
fi

# Install vim-plug
echo -e "\033[33m[INFO]: Install vim-plug\033[0m"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: vim-plug installation failed \033[0m"
    exit 1
fi

# Copy the neovim config
echo -e "\033[33m[INFO]: Copy neovim config \033[0m"
mkdir -p ~/.config/nvim && cp ./configs/neovim/init.vim ~/.config/nvim/init.vim
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: neovim config copy failed \033[0m"
    exit 1
fi

# Run Pluginstall and quit
echo -e "\033[33m[INFO]: Install neovim plugins \033[0m"
nvim -c PlugInstall -c q -c q
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: neovim plugin install failed \033[0m"
    exit 1
fi

echo -e "\033[33m[INFO]: Neovim setup complete \033[0m"
echo -e "\033[33m[INFO]: ===================== \033[0m"
echo -e "\033[33m[INFO]: Tmux \033[0m"

# Installation
echo -e "\033[33m[INFO]: Install tmux \033[0m"
sudo apt install tmux
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: Tmux installation failed \033[0m"
    exit 1
fi

# Install tpm
echo -e "\033[33m[INFO]: Install tmux plugin manager \033[0m"
# Skip if already installed
if [ -d ~/.tmux/plugins/tpm ]; then
    echo -e "\033[33m[INFO]: Tmux plugin manager already installed \033[0m"
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    if [ $? -ne 0 ]; then
        echo -e "\033[33m[INFO]: Tmux plugin manager installation failed \033[0m"
        exit 1
    fi
fi

# Copy the tmux config
echo -e "\033[33m[INFO]: Copy tmux config \033[0m"
mkdir -p ~/.config/tmux && cp ./configs/tmux/tmux.conf ~/.config/tmux/tmux.conf
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: tmux config copy failed \033[0m"
    exit 1
fi

# source config
echo -e "\033[33m[INFO]: Source tmux config \033[0m"
tmux -c "tmux source ~/.config/tmux/tmux.conf"
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: tmux config source failed \033[0m"
    exit 1
fi

# Install plugins
echo -e "\033[33m[INFO]: Install tmux plugins \033[0m"
~/.tmux/plugins/tpm/scripts/install_plugins.sh
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: tmux plugin install failed \033[0m"
    exit 1
fi

echo -e "\033[33m[INFO]: Tmux setup complete \033[0m"
echo -e "\033[33m[INFO]: ===================== \033[0m"
echo -e "\033[33m[INFO]: Bashrc \033[0m"

# Extend bashrc
echo -e "\033[33m[INFO]: Extend bashrc \033[0m"
cat ./configs/bash/bashrc-extend.sh >> ~/.bashrc
if [ $? -ne 0 ]; then
    echo -e "\033[33m[INFO]: bashrc extend failed \033[0m"
    exit 1
fi

echo -e "\033[33m[INFO]: Bashrc setup complete \033[0m"
echo -e "\033[33m[INFO]: ===================== \033[0m"

echo -e "\033[33m[INFO]: Done \033[0m"

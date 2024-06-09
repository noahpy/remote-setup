
# Remote Setup Guide
This is a setup guide for working on remote machines.
It is a relatively minimal setup with tmux, neovim, where one can navigate
between panes with Ctrl+[H,J,K,L].
Installation commands may vary depending on the distribution.
The respective config file can be found in the configs folder.

## Quick Start
You can simply enter the cloned repo and run:
```
./setup.sh
```
If you want to run the commands manually, follow the setup guide below.

## Setup Guide
### Neovim
Install [neovim](https://github.com/neovim/neovim)
```
sudo apt install neovim
```
Install [vim-plug](https://github.com/junegunn/vim-plug) for neovim:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Copy the neovim config:
```
cp <PATH_TO_REPO>/configs/neovim/init.vim ~/.config/nvim/init.vim
```
Install plugins:
```
nvim -c PlugInstall
```

### Tmux
Install [tmux](https://github.com/tmux/tmux)
```
sudo apt install tmux
```
Install [tmux plugin manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Copy the tmux config file from this repo:
```
cp <PATH_TO_REPO>/configs/tmux.conf ~/.config/tmux/tmux.conf
```
Then source it:
```
tmux source ~/.config/tmux/tmux.conf
```
Aliasing (also done in bashrc):
```
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
```

### Bashrc
Extend the default bashrc :
```
cat <PATH_TO_REPO>/configs/bashrc-extend.sh >> ~/.bashrc
```


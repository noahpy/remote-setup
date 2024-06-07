
# Remote Setup Guide
This is a setup guide for working on remote machines.
It is a relatively minimal setup with tmux, neovim and bash made compatible to each other.
Installation commands may vary depending on the distribution.

## Neovim
Install neovim:
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
cp <PATH_TO_NEOVIM_CONF> ~/.config/nvim/init.vim
```

## Tmux
Install [tmux](https://github.com/tmux/tmux)
```
sudo apt install tmux
```
Install [tmux plugin manager](https://github.com/tmux-plugins/tpm)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Intialize tmux-conf and source it:
```
tmux source <PATH_TO_TMUX_CONF>
```
Aliasing (also done in bashrc):
```
alias tmux="tmux -f <PATH_TO_TMUX_CONF>"
```

## Bashrc
Extend the default bashrc:
```
cat <PATH_TO_BASHRC> >> ~/.bashrc
```


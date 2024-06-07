" Plugin for tmux navigation
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Some basic configurations
set number
set clipboard=unnamedplus

" Key bindings for copying / pasting
" between tmux panes / windows / sessions.
" copy to buffer
vmap <C-c> :w! ~/.vimbuffer<CR>
nmap <C-c> :.w! ~/.vimbuffer<CR>
" paste from buffer
map <C-p> :r ~/.vimbuffer<CR>

" Some basic key bindings
inoremap jj <Esc>
nnoremap <Space> :

syntax on

set encoding=utf-8
set number
set cindent
set hlsearch
set incsearch
set ignorecase
set backspace=2
set background=dark
set tags=tags;
set nofixendofline
set expandtab
set tabstop=4
set shiftwidth=4

" open vim at the location that was last edited
if has("autocmd")
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" highlight extra white space
highlight ExtraWhitespace ctermbg=red guibg=red
highlight Pmenu ctermbg=gray guibg=gray
highlight PmenuSel ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" statusline
set laststatus=0

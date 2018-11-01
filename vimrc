set nocompatible

" ================= PLUGINS ==========================
source $HOME/.vimrc-plugins

" ================= GENERAL ==========================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmatch                   "Do matching brackets
set smartcase                   "Do smart case matching
set autoread                    "Reload files changed outside vim
set wrap                        "Soft Wrapping text (fit within window size)
set encoding=utf-8              "Standard encoding to UTF-8
set ffs=unix,dos,mac            "Unix as the standard filetype
set laststatus=2                "Set statusline = 2
set noshowmode                  "Show current mode down the bottom (vim-airline)
set colorcolumn=80
set cinoptions=t0
set hidden                      "Hide buffers in background
set lazyredraw                  "Buffer screen update
set linebreak                   "Wrap lines at convenient points
set list                        "Enable listchars
set listchars=tab:\ \ ,trail:·  "Set trails for tabs and spaces

"" Disable bells
set noerrorbells
set novisualbell
set tm=500
autocmd VimEnter * set vb t_vb=

let g:tex_flavor = "latex"      "Latex favor

" Temporary fix for cursor not blink in neovim
if has('nvim')
    set guicursor=n:blinkon1
endif

" ================= TURN OFF SWAP FILES ==============
set noswapfile
set nobackup
set nowb

" ================= PERSISTENT UNDO ==================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================= INDENTATION ======================
set autoindent                  "Auto indent
set smartindent                 "Smart indent
set expandtab                   "Use spaces instead of tabs
set smarttab

set shiftwidth=4                "1 tab == 4 spaces
set softtabstop=4
set tabstop=4

set cindent

"Setting makefiles with tabs, not spaces
autocmd FileType make setlocal noexpandtab

" ================ CURSOR =============================
" Restore cursor position to where it was before
"au BufWinLeave ?* mkview 1
"au BufWinEnter ?* silent loadview 1
au BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

"Enable mouse control
"set mouse=a

" Enable cursorline
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" ================= SEARCH ===========================
set ignorecase                  "Ignore case when searching
set incsearch                   "Find the next match as we type the search
set hlsearch                    "Hilight searches by default
nnoremap <esc><esc> :silent! nohlsearch<cr>
                                "Double ESC to disable hilight searches
"set viminfo='100,f1            "Save up to 100 marks, enable capital marks

" ================= FOLDS ============================
set foldmethod=indent           "Fold based on indent
set nofoldenable                "Dont fold by default
"set foldnestmax=3              "Deepest fold is 3 levels


" ================= SCROLLING ========================
"set scrolloff=8                "Start scrolling when we're 8 lines away from margins
"set sidescrolloff=15
"set sidescroll=1
"set cul!
"set grepprg=grep\ -nH\ $*

"" ================ KEY MAP ==========================
"if &term =~ '^screen'
"    "TMUX will send xterm-style keys when its xterm-keys option is on
"    execute "set <xUp>=\e[1;*A"
"    execute "set <xDown>=\e[1;*B"
"    execute "set <xRight>=\e[1;*C"
"    execute "set <xLeft>=\e[1;*D"
"endif
"
" ================= COPY PASTE =======================
set clipboard+=unnamedplus

" ================= FANCY COLORS =====================
                                "Enable full color supported
silent set termguicolors
if &term =~# '^screen'
    silent let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    silent let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if !has('gui_running')
  set t_Co=256
endif

set background=dark             "Set background dark
"let g:python_highlight_all = 1  "Enable python syntax highlight

silent colorscheme molokai      "Set default theme
silent let g:airline_theme = 'powerlineish'
                                "Set status-line theme

" Set color for error and warning signs
silent hi clear ALEErrorSign
silent hi clear ALEWarningSign
silent hi ALEErrorSign ctermbg=NONE ctermfg=red guifg=#FF0000
silent hi ALEWarningSign ctermbg=NONE ctermfg=white guifg=#FFFFFF

autocmd FileType tex,latex
    \ set background=dark |
    \ colorscheme base16-macintosh |
    \ set spell

autocmd FileType sh colorscheme luna

function! SetColor()
    "Highlight specific colors

    "normal color
    "hi Normal ctermbg=233 guibg=#1e1e1e ctermfg=255 guifg=#FFFFFF

    "line number
    "hi LineNr ctermbg=NONE guibg=NONE ctermfg=240 guifg=#585858

    "selected code color (visual)
    "hi Visual ctermbg=25 guibg=#1A49A5 ctermfg=15 guifg=#FFFFFF

    "autocomplete menu color
    hi Pmenu ctermbg=235 guibg=#333333 ctermfg=NONE guifg=NONE
    hi PmenuSel ctermfg=15 guifg=#FFFFFF ctermbg=25 guibg=#1A49A5
    hi PmenuSbar ctermfg=15 guifg=#FFFFFF ctermbg=245 guibg=#8a8a8a
    hi PmenuThumb ctermfg=15 guifg=#FFFFFF ctermbg=25 guibg=#1A49A5
    " hi Pmenu ctermbg=235 guibg=#2e3134 ctermfg=NONE guifg=NONE
    " hi PmenuSel ctermfg=25 guifg=#1f6ad7 ctermbg=237 guibg=#46494c
    " hi PmenuSbar ctermfg=15 guifg=#FFFFFF ctermbg=245 guibg=#8a8a8a
    " hi PmenuThumb ctermfg=15 guifg=#FFFFFF ctermbg=25 guibg=#1A49A5

    "column color (right)
    hi ColorColumn ctermbg=236 guibg=#303030 ctermfg=255 guifg=#FFFFFF

    "search keyword
    hi Search ctermbg=220 guibg=#FFD700 ctermfg=16 guifg=#000000

    "cursorline
    hi CursorLine ctermbg=235 guibg=#333333 cterm=NONE gui=NONE
    hi CursorLineNR ctermfg=208 guifg=#ff8700 ctermbg=NONE guibg=NONE

endfunction
autocmd FileType * call SetColor()



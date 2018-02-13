" ================== NEOVIM CONFIGURATION =======================================
" This must be first, because it changes other options as a side effect.
"set nocompatible

" ================= VIMPLUG ==========================
" Use vim-plug as vim plugin manager
call plug#begin('~/.vim/plugged')

" ================= PLUGINS
Plug 'vim-airline/vim-airline'				"vim-airline: status line
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/syntastic'					"vim-syntastic: syntax checker

Plug 'Yggdroot/indentLine'                  "vim-indentline: draw indent line

Plug 'ervandew/supertab'					"vim-supertab: autocomplete with tab

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
                                            "deoplete.vim: autocomplete
Plug 'zchee/deoplete-jedi'					"python

Plug 'scrooloose/nerdcommenter'             "nerdcommenter: comment

"Plug 'lervag/vimtex'						"vimtex
Plug 'sheerun/vim-polyglot'                 "vim-polyglot: language packs
Plug 'vim-python/python-syntax'             "vim-python syntax
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/dbext.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'LaTex-Box-Team/LaTeX-Box'

" ================= COLORSCHEME
Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
Plug 'pthk/vim-luna'
Plug 'Soares/base16.nvim'

call plug#end()

filetype plugin indent on       "Enable plugins and indents by filetype
syntax on                       "Enable syntax

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
set hidden 			            "Hide buffers in background
set lazyredraw                  "Buffer screen update
set linebreak           	    "Wrap lines at convenient points
set list                        "Enable listchars
set listchars=tab:\ \ ,trail:· 	"Set trails for tabs and spaces


"" Disable bells
set noerrorbells
set novisualbell
set tm=500
autocmd VimEnter * set vb t_vb=

let g:tex_flavor = "latex" 	" Latex favor

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
set autoindent          "Auto indent
set smartindent         "Smart indent
set expandtab           "Use spaces instead of tabs
set smarttab

set shiftwidth=4        "1 tab == 4 spaces
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
set ignorecase          "Ignore case when searching
set incsearch           "Find the next match as we type the search
set hlsearch            "Hilight searches by default
nnoremap <esc><esc> :silent! nohlsearch<cr>
                        "Disable hilight searches
"set viminfo='100,f1    "Save up to 100 marks, enable capital marks

" ================= FOLDS ============================
set foldmethod=indent   "Fold based on indent
set nofoldenable        "Dont fold by default
"set foldnestmax=3       "Deepest fold is 3 levels


" ================= SCROLLING ========================
"set scrolloff=8        "Start scrolling when we're 8 lines away from margins
"set sidescrolloff=15
"set sidescroll=1
"set cul!
"set grepprg=grep\ -nH\ $*

"" ================= KEY MAP ==========================
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

" ================ FANCY COLOR =======================
set termguicolors          "Enable full color supported
set t_Co=256

let g:polyglot_disable = ['python']
let g:python_highlight_all = 1
                            "Enable python syntax highlight

set background=dark         "Set background dark
colorscheme molokai

autocmd FileType tex,latex
    \ set background=dark |
    \ colorscheme base16-macintosh |
    \ set spell

autocmd FileType python
    \ colorscheme luna

function! SetColor()

    "Highlight normal color
    hi Normal ctermbg=233 guibg=#1e1e1e ctermfg=255 guifg=#FFFFFF

    "Highlight line number
    hi LineNr ctermbg=NONE guibg=NONE ctermfg=240 guifg=#585858

    "Highlight selected code color (visual)
    hi Visual ctermbg=255 guibg=#FFFFFF ctermfg=16 guifg=#000000

    "Highlight column color
    hi ColorColumn ctermbg=236 guibg=#303030 ctermfg=255 guifg=#FFFFFF

    "Highlight search
    hi Search ctermbg=220 guibg=#FFD700 ctermfg=16 guifg=#000000

    "Highlight cursorline
    hi CursorLine ctermbg=235 guibg=#333333 cterm=NONE gui=NONE
    hi CursorLineNR ctermfg=208 guifg=#ff8700 ctermbg=NONE guibg=NONE

    endfunction

autocmd FileType * call SetColor()

" ================= PLUGINS ==========================
" ================= DEOPLETE
set completeopt-=preview
let g:deoplete#enable_at_startup = 1 "Enable deoplete

source $HOME/.vimrc-plugins

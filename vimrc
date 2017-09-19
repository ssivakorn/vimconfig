" ================== VIM CONFIGURATION =======================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"" ================= PATHOGEN =========================
"" This loads all the plugins in ~/.vim/plugins
"" Use tpope's pathogen plugin to manage all other plugins
"
""runtime plugins/tpope-vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()
"call pathogen#helptags()
""call pathogen#runtime_append_all_bundles()
"
" ================= GENERAL ===========================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set showmatch                   "Do matching brackets
set smartcase                   "Do smart case matching
set autoread                    "Reload files changed outside vim
set wrap                        "Soft Wrapping text (fit within window size)
set lazyredraw                  "Buffer screen update
set encoding=utf-8              "Standard encoding to UTF-8
set ffs=unix,dos,mac            "Unix as the standard filetype
set laststatus=2                "Set statusline = 2
set colorcolumn=80
set cinoptions=t0
"" This makes vim act like all other editors, buffers can
"" exist in the background without being in a window.
"" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Disable bells
set noerrorbells
set novisualbell
set tm=500
autocmd VimEnter * set vb t_vb=

" Latex favor
let g:tex_flavor = "latex"

" ================ CURSOR =============================
" Restore cursor position to where it was before
au BufWinLeave ?* mkview 1
au BufWinEnter ?* silent loadview 1
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

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

"set viminfo='100,f1    "Save up to 100 marks, enable capital marks


" ================= TURN OFF SWAP FILES ==============
set noswapfile
set nobackup
set nowb

" ================= PERSISTENT UNDO ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================= INDENTATION ======================
set autoindent          "Auto indent
set smartindent         "Smart indent
set expandtab           "Use spaces instead of tabs
set smarttab

set shiftwidth=4        "1 tab == 4 spaces
set softtabstop=4
set tabstop=4
set ts=4

set cindent

filetype plugin indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set linebreak           "Wrap lines at convenient points

" ================= FOLDS ============================
set foldmethod=indent   "Fold based on indent
set nofoldenable        "Dont fold by default
"set foldnestmax=3       "Deepest fold is 3 levels


" ================= SCROLLING ========================
"set scrolloff=8        "Start scrolling when we're 8 lines away from margins
"set sidescrolloff=15
"set sidescroll=1
"set cul!

"Setting makefiles with tabs, not spaces
autocmd FileType make setlocal noexpandtab

set grepprg=grep\ -nH\ $*

" ================= COPY PASTE =======================
"Copy to X11 clipboard
map <Leader>y "+yy
"Cut to X11 clipboard
map <Leader>d "+dd
"Paste X11 clipboard
map <Leader>p "+p

set clipboard+=unnamed

" ================ FANCY COLOR =======================
" Enable full color supported
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

"Turn on syntax highlighting
syntax on

"Enable python syntax highlight
let python_highlight_all = 1

"Set background dark
set background=dark
colorscheme molokai

autocmd FileType tex,latex
    \ set background=light |
    \ colorscheme pablo

autocmd FileType python
    \ colorscheme luna-term

hi Normal ctermbg=NONE guibg=NONE ctermfg=255 guifg=#FFFFFF

"Highlight line number
hi LineNr ctermbg=NONE guibg=NONE ctermfg=240 guifg=#585858

"Highlight selected code color (visual)
hi Visual ctermbg=255 guibg=#FFFFFF ctermfg=16 guifg=#000000

"Highlight column color
hi ColorColumn ctermbg=236 guibg=#303030 ctermfg=255 guifg=#FFFFFF

"Highlight search
hi Search ctermbg=220 guibg=#FFD700 ctermfg=16 guifg=#000000

"Highlight cursorline
hi CursorLine ctermbg=235 guibg=#262626
hi CursorLineNR ctermfg=208 guifg=#ff8700 ctermbg=NONE guibg=NONE

" ================= PLUGINS ==========================
source $HOME/.vimrc-plugins

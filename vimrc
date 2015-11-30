" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set nohlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set ts=4
set cindent

filetype plugin indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Setting makefiles with tabs, not spaces
autocmd FileType make setlocal noexpandtab

set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

set clipboard^=unnamed


" =============== Pathogen Initialization ===========
" This loads all the plugins in ~/.vim/plugins
" Use tpope's pathogen plugin to manage all other plugins

"runtime plugins/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()

" ================ General Config ===================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set wrap                        "Soft Wrapping text (fit within window size)
set colorcolumn=80
set cinoptions=t0
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" enable full color supported
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

" ================ Fancy Colorscheme ================
set background=dark

"turn on syntax highlighting
syntax on

"enable python syntax highlight
let python_highlight_all = 1

"hilight systax from start of file
autocmd BufEnter * :syntax sync fromstart

"color themes
function SetColor()
    highlight Comment cterm=bold
    highlight Normal ctermbg=None ctermfg=white
    highlight LineNr ctermbg=None

    "highlight line number
    highlight LineNr ctermfg=DarkGray

    "selected code color (visual)
    hi Visual ctermbg=White ctermfg=Black

    "highlight column color
    highlight ColorColumn ctermbg=DarkRed
endfunction

" ================ Cursor ===========================
" highlight current line
function SetCursorStyle()
    hi clear CursorLine
    set cursorline
    hi CursorLine   cterm=NONE ctermbg=234
    hi CursorLineNR ctermfg=172

    " Restore cursor position to where it was before
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    "enable mouse control
    "set mouse=a
endfunction

" ================ Colorscheme ======================

colorscheme luna-term
call SetColor()
call SetCursorStyle()

autocmd FileType tex
        \ colorscheme harlequin |
        \ call SetColor() |
        \ call SetCursorStyle()
"autocmd FileType python colorscheme molokai

" ================ LaTeX ============================
" faster scrolling in tex file
autocmd FileType tex :NoMatchParen
" set auto new line
autocmd FileType tex :set tw=78

" ================ Plugins  =========================

" ================ Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
set laststatus=2
let g:airline_powerline_fonts=1


" ================ Airlineish
"let g:airline_theme = 'airlineish'
let g:airline_theme = 'powerlineish'

" ================ Syntastic
highlight SyntasticWarning NONE
highlight SyntasticError NONE
let g:syntastic_echo_current_error = 1
let g:syntastic_error_symbol='xx'
let g:syntastic_warning_symbol='>>'
let g:syntastic_style_error_symbol='>>'
let g:syntastic_style_warning_symbol='>>'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" syntax checker: https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '-d C0111'
let g:syntastic_python_python_use_codec = 1
let g:syntastic_c_compiler = 'clang'
let g:syntastic_html_checkers = ['w3']


" ================ Taglist
"let Tlist_Display_Prototype=1
let Tlist_Exit_OnlyWindow=1
"let Tlist_WinWidth=50
"let Tlist_Auto_Open=1
"autocmd BufWritePost *.cpp :TlistUpdate
"autocmd BufWritePost *.c :TlistUpdate



" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================= PATHOGEN =========================
" This loads all the plugins in ~/.vim/plugins
" Use tpope's pathogen plugin to manage all other plugins

"runtime plugins/tpope-vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles()

" ================= GENERAL ===========================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=100                 "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set showmatch                   "Do matching brackets
set ignorecase                  "Do case insensitive matching
set smartcase                   "Do smart case matching
set autoread                    "Reload files changed outside vim
set wrap                        "Soft Wrapping text (fit within window size)
set lazyredraw                  "Buffer screen update
set colorcolumn=80
set cinoptions=t0
"" This makes vim act like all other editors, buffers can
"" exist in the background without being in a window.
"" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Disable bell
autocmd VimEnter * set vb t_vb=

" Latex favor
let g:tex_flavor = "latex"

" ================ CURSOR =============================
" Restore cursor position to where it was before
au BufWinLeave * mkview
au BufWinEnter * silent loadview
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

"enable mouse control
"set mouse=a

" ================= SEARCH ===========================
set incsearch           "Find the next match as we type the search
set nohlsearch          "Hilight searches by default
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

" ================= FOLDS ============================
set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================= SCROLLING ========================
"set scrolloff=8         "Start scrolling when we're 8 lines away from margins
"set sidescrolloff=15
"set sidescroll=1
"set cul!

"Setting makefiles with tabs, not spaces
autocmd FileType make setlocal noexpandtab

set grepprg=grep\ -nH\ $*

" ================= COPY PASTE =======================
"Copy to X11 clipboard
map <Leader>y "+2yy
"Cut to X11 clipboard
map <Leader>d "+dd
"Paste X11 clipboard
map <Leader>p "+p

"set clipboard=unnamedplus

" ================ FANCY COLOR =======================
" enable full color supported
if $COLORTERM == 'gnome-terminal'
      set t_Co=256
endif

"turn on syntax highlighting
syntax on

"enable python syntax highlight
let python_highlight_all = 1

colorscheme molokai

autocmd FileType tex,latex
    \ colorscheme PaperColor |
    \ set background=light |
    \ highlight ColorColumn ctermbg=DarkRed |
    \ let g:airline_theme = 'light'

autocmd FileType python
    \ colorscheme luna-term |
    \ highlight ColorColumn ctermbg=DarkRed |
    \ let g:airline_theme = 'dark'

" colorize
"highlight Comment cterm=bold
"highlight Normal ctermbg=None ctermfg=white

"highlight line number
highlight LineNr ctermbg=None
highlight LineNr ctermfg=DarkGrey

"selected code color (visual)
hi Visual ctermbg=White ctermfg=Black

"highlight column color
highlight ColorColumn ctermbg=DarkRed

" ================= PLUGINS ==========================
" ================= AIRLINE
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_exclude_preview=1
" airline theme: https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme = 'dark'

set laststatus=2

" ================= NERDTREE
"open vi nerdtree when vi starts up
"autocmd vimenter * NERDTree
"toggle Ctrl + l to open and close Nerdtree
map <C-l> :NERDTreeToggle<CR>
"close vi if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ================= SYNTASTIC
let g:syntastic_mode_map = {
        \ 'mode': 'active',
        \ 'active_filetypes':   ['python', 'html', 'javascript', 'c'],
        \ 'passive_filetypes':  ['java'] }

highlight SyntasticWarning NONE
highlight SyntasticError NONE
let g:syntastic_echo_current_error = 1
let g:syntastic_error_symbol='xx'
let g:syntastic_warning_symbol='!!'
"let g:syntastic_style_error_symbol='>>'
"let g:syntastic_style_warning_symbol='>>'
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_html_checkers = ['w3']
let g:syntastic_c_compiler = 'gcc'

" Disable some verbosy syntax checkers
let g:syntastic_python_pylint_args = '-d C0111 -d C0326 -d C0103'
let g:syntastic_python_python_use_codec = 1


" ================= TAGBAR
nmap <C-f> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
"let g:tagbar_autopreview = 1

" ================= SUPERTAB
""let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
""let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"
" ================= DELIMITMATE
let g:delimitMate_expand_cr = 1
let g:delimitMate_jump_expansion = 1

" ================= INDENTLINE
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239
let g:indentLine_fileTypeExclude = ['tex', 'html']
let g:indentLine_setConceal = 0


# vimconfig
a simple .vimrc configuration for linux and mac includes:
* **vim-pathogen** plugin managing plugin
    https://github.com/tpope/vim-pathogen
* **vim-airline** nice and light status line with pure vim script
    https://github.com/vim-airline/vim-airline
* **vim-airline-themes** vim airline theme set
    https://github.com/vim-airline/vim-airline-themes.git
* vim-nerdtree traverse directory easier
    https://github.com/scrooloose/nerdtree
* **vim-taglist** listing all functions in the code
    http://vim-taglist.sourceforge.net/
* ~~**vim-pandoc**~~
    ~~https://github.com/vim-pandoc/vim-pandoc~~

Configuration
-------------
save .vimrc into home directory: /home/user/.vimrc

Colorschemes
------------
save colorscheme (vim theme) file into home directory: /home/user/.vim/colors/

colorschemes including:
* harlequin https://github.com/nielsmadan/harlequin
* 256-jungle https://github.com/vim-scripts/256-jungle
* molokai https://github.com/tomasr/molokai
* luna-term (newly added) https://github.com/Pychimp/vim-luna

Fonts
-----
vim-airline is much beautiful when integrated with vim-powerline font
see https://github.com/powerline/fonts for installation instruction.

Syntax Checker
--------------
checkers support by syntastic:
https://github.com/scrooloose/syntastic/wiki/Syntax-Checkers


Installation
------------
```shell
$ chmod +x vcf_installer.sh
$ ./install
```

Ctag must be installed to enable taglist:
* Debian / Ubuntu
```shell
$ sudo apt-get install exuberant-ctags
```
* RedHat, Fedora, CentOS
```shell
sudo yum install ctags
```
* Mac OS
```shell
$ brew install ctags
$ alias ctags="`brew --prefix`/bin/ctags"
```

To Uninstall
------------
```shell
$ ./uninstall
```

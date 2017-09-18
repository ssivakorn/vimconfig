My simple vimrc configuration for Linux/Mac environments.

Installation
------------
1. Run installer
```shell
$ chmod +x install.sh
$ ./install
```


2. Install Ctag must be installed to enable taglist:

* Debian / Ubuntu
```shell
$ sudo apt-get install exuberant-ctags
```

* Mac OS
```shell
$ brew install ctags
$ alias ctags="`brew --prefix`/bin/ctags"
```

Uninstall
---------
```shell
$ ./uninstall
```

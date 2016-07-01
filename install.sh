#!/bin/bash

COLOR="colors"
SYNTAX="syntax"
PLUGIN="plugin"
BUNDLE="bundle"
AUTOLOAD="autoload"

VIM_PATH="$HOME/.vim"
COLOR_PATH="${VIM_PATH}/${COLOR}"
SYNTAX_PATH="${VIM_PATH}/${SYNTAX}"
PLUGIN_PATH="${VIM_PATH}/${PLUGIN}"
BUNDLE_PATH="${VIM_PATH}/${BUNDLE}"
AUTOLOAD_PATH="${VIM_PATH}/${AUTOLOAD}"

echo "[>] Installing VIM CONFIG ..."
cp vimrc ~/.vimrc

echo "[>] Installing SYNTAX ..."
mkdir -p "${VIM_PATH}"
#cp -rf ${SYNTAX}  "${VIM_PATH}/."


echo "[>] Installing COLORSCHEMES ..."
mkdir -p "${COLOR_PATH}"
curl -LSso "${COLOR_PATH}/luna-term.vim" https://raw.githubusercontent.com/notpratheek/vim-luna/master/colors/luna-term.vim
curl -LSso "${COLOR_PATH}/molokai.vim" https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
curl -LSso "${COLOR_PATH}/256-jungle.vim" https://raw.githubusercontent.com/vim-scripts/256-jungle/master/colors/256-jungle.vim
curl -LSso "${COLOR_PATH}/harlequin.vim" https://raw.githubusercontent.com/nielsmadan/harlequin/master/colors/harlequin.vim


echo "[>] Installing PLUGINS ..."
echo "[+] vim-pathogen"
mkdir -p ${AUTOLOAD_PATH}
mkdir -p ${BUNDLE_PATH}
curl -LSso "${AUTOLOAD_PATH}/pathogen.vim" https://tpo.pe/pathogen.vim

echo "[+] vim-airline"
airline="${BUNDLE_PATH}/vim-airline"
rm -rf ${airline}
git clone https://github.com/vim-airline/vim-airline.git ${airline}

echo "[+] vim-airline themes"
airline_themes="${BUNDLE_PATH}/vim-airline-themes"
rm -rf ${airline_themes}
git clone https://github.com/vim-airline/vim-airline-themes.git ${airline_themes}


echo "[+] vim-syntastic"
syntastic="${BUNDLE_PATH}/syntastic"
rm -rf ${syntastic}
git clone https://github.com/scrooloose/syntastic.git ${syntastic}

echo "[+] vim-nerdtree"
nerdtree="${BUNDLE_PATH}/nerdtree"
rm -rf ${nerdtree}
git clone https://github.com/scrooloose/nerdtree.git ${nerdtree}

#echo "[+] vim-pandoc"
#pandoc="${BUNDLE_PATH}/vim-pandoc"
#rm -rf ${pandoc}
#git clone https://github.com/vim-pandoc/vim-pandoc.git ${pandoc}
#
#echo "[+] vim-pandoc-syntax"
#pandocsyn="${BUNDLE_PATH}/vim-pandoc-syntax"
#rm -rf ${pandocsyn}
#git clone https://github.com/vim-pandoc/vim-pandoc-syntax.git ${pandocsyn}

echo "[+] vim-taglist"
mkdir -p ${PLUGIN_PATH}
curl -LSso "${PLUGIN_PATH}/taglist.vim" https://raw.githubusercontent.com/vim-scripts/taglist.vim/master/plugin/taglist.vim


#!/bin/bash

THEME_NAME=$1
THEME_URL=$2


mkdir -p "$HOME/.vim/colors"
curl -LSSo "$HOME/.vim/colors/${THEME_NAME}.vim" "$THEME_URL" 2>/dev/null

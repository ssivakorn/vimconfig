# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal vim/neovim configuration managed as a repo and deployed via symlinks. The two config files (`vimrc`, `vimrc-plugins`) are symlinked into `$HOME` by the installer; plugins are managed with [vim-plug](https://github.com/junegunn/vim-plug).

## Install / Uninstall

```bash
./install    # checks deps, removes old install, symlinks configs, installs vim-plug + plugins
./uninstall  # removes ~/.vimrc, ~/.vimrc-plugins, ~/.vim, ~/.config/nvim
```

Dependencies: `curl`, `git`, `python3`, `exuberant-ctags`

## File structure

| File | Purpose |
|---|---|
| `vimrc` | Main config — sources `vimrc-plugins`, then sets all options, keymaps, colors |
| `vimrc-plugins` | `plug#begin` / `plug#end` block + per-plugin configuration |
| `install` | Bash installer: symlinks both files, bootstraps vim-plug, runs `:PlugInstall` |
| `uninstall` | Removes all symlinks and plugin dirs |

## Key design points

- `vimrc` sources `vimrc-plugins` as its first line, so plugin settings must live in `vimrc-plugins` to be available before the rest of `vimrc` runs.
- Clipboard is OS-aware: `unnamed` on macOS, `unnamedplus` on Linux.
- Color overrides are applied via `autocmd FileType * call SetColor()` — per-filetype colorscheme switches (tex, sh) must come before that autocmd or they will be overridden.
- The status line is **lightline** (`itchyny/lightline.vim`).

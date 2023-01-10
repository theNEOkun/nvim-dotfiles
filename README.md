# Neovim dotfiles

## Introduction

These are my neovim dotfiles

## Colorscheme

The colorscheme is a try to copy the helix default theme, due to the colors being so good
It is built on top of [nightfox](https://github.com/EdenEast/nightfox.nvim) due to ease of use of
building on-top of nightfox itself.

## LSP

The LSP is built upon [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim) and also uses
[null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

Ensured are:

- tsserver
- sumneko_lua
- jdtls

And installed on the machine is

- rust_analyzer
- clangd

Which are in turn handled by clangd-extensions and rust-tools

### Rust

[rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)

Handles all rust-related, and hooks into the lsp

### Clangd

[clangd-extensions](https://git.sr.ht/~p00f/clangd_extensions.nvim)

Works similar to rust-tools, just for C and CPP

## Treesitter

[ TreeSitter ](https://github.com/nvim-treesitter/nvim-treesitter) has these dependencies:

- Used to help refactor using treesitter [nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- Used to auto-add tags at the end [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- Colors different levels of tags i.e `( ( ) )` the outer will have different colors from the inner [nvim-ts-rainbow](https://github.com/mrjones2014/nvim-ts-rainbow)
- Used to auto-add the end after a function [nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise)
- Adds some objects to act upon [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- Gets the comment-type based on treesitter [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- Used to play around and test treesitter [playground](https://github.com/nvim-treesitter/playground)

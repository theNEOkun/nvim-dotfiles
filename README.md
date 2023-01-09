# Neovim dotfiles

## Introduction

These are my neovim dotfiles

## Colorscheme

The colorscheme is a try to copy the helix default theme, due to the colors being so good
It is built on top of [nightfox](https://github.com/EdenEast/nightfox.nvim) due to ease of use of
building ontop of nightfox itself.

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

### CLang

[clangd-extensions](https://git.sr.ht/~p00f/clangd_extensions.nvim)

Works the same as rust

## Treesitter

[ TreeSitter ](https://github.com/nvim-treesitter/nvim-treesitter) has these dependencies:

[nvim-treesitter-refactor](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
[nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
[nvim-ts-rainbow](https://github.com/mrjones2014/nvim-ts-rainbow)
[nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise)
[nvim-treesitter-textsubjects](https://github.com/RRethy/nvim-treesitter-textsubjects)
[nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
[nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
[playground](https://github.com/nvim-treesitter/playground)

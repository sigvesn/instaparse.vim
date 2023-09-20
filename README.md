# Instaparse.vim

[Instaparse](https://github.com/engelberg/instaparse) syntax highlighting for Vim and Neovim

## Syntax highlighting

Highlighting rules for the [instaparse notatation](https://github.com/engelberg/instaparse#notation)

<img src="images/example.png?raw=true" alt="Example Highlight"/>

*Alpha state: not tested for many types of instaparse grammars*

## Indentation

Defines a very simple indendexpr to match rules with alterations. See the [indent script](indent/instaparse.vim) for more information

or disable this indentation by setting `let g:instaparse_vim_noindent=1`

## Installation

Install with any plugin manager e.g.,

```vim
Plug 'sigvesn/instaparse.vim'
```

The following options needs set in your vim configuration if the features are to be enabled

```vim
syntax on
filetype plugin indent on
```

## Usage

Set the filetype manually or detect it automatically with an autocommand

```vim
au BufRead,BufNewFile *.instaparse set filetype=instaparse
```

## Bonus

Get regex highlighting using [vim-regex-syntax](https://github.com/Galicarnax/vim-regex-syntax) with

```vim
Plug 'Galicarnax/vim-regex-syntax'
au FileType instaparse call EnableEmbeddedSyntaxHighlight('pcre', "#'", "'", 'Comment')
au FileType instaparse call EnableEmbeddedSyntaxHighlight('pcre', "#\\\"", "\\\"", 'Comment')
```

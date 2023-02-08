" Vim indent file
" Language:         Instaparse <https://github.com/engelberg/instaparse>
" Maintainer:       Sigve Nordgaard
" Contributors:     Inspiration from <https://github.com/vim-scripts/ebnf.vim>
"                                and <https://github.com/clojure-vim/clojure.vim>
" URL:              https://github.com/sigvesn/instaparse.vim

if exists("b:did_indent") ||
            \ (exists("g:instaparse_vim_noindent") && g:instaparse_vim_noindent==1)
    finish
endif
let b:did_indent = 1

let s:save_cpo = &cpo
set cpo&vim

setlocal autoindent smartindent

let b:instaparse_rule="\\(:\\|=\\|:=\\|::=\\)"
let b:instaparse_indentifier="[a-zA-Z-]\\w*"

" Very simple indent rules which will indent lines beginning with an alteration
" to the column position of their open rule token. E.g.:
" rule = foo
"      | bar
"      | baz
"
"      ^ matches the indenation of '|' to the preceding '='
function InstaparseIndent(lnum)
    let curline = getline(a:lnum)
    let indent = indent(lnum)

    if (curline =~ '^\s*|')
        let start_regex = b:instaparse_indentifier . "\\s*" . b:instaparse_rule
        let start = search(start_regex, 'bW')
        let start_line = getline(start)
        let indent = match(start_line, b:instaparse_rule)
    endif
    return indent
endfunction

setlocal indentexpr=InstaparseIndent(v:lnum)

let &cpo = s:save_cpo
unlet! s:save_cpo

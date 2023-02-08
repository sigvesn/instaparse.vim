" Vim syntax file
" Language:         Instaparse <https://github.com/engelberg/instaparse>
" Maintainer:       Sigve Nordgaard
" Contributors:     Inspiration from <https://github.com/vim-scripts/ebnf.vim>
"                                and <https://github.com/clojure-vim/clojure.vim>
" URL:              https://github.com/sigvesn/instaparse.vim

if exists("b:current_syntax")
    finish
endif

let s:keepcpo= &cpo
set cpo&vim

setlocal commentstring=(*%s*)

syn region instaparseComment start="(\*" end="\*)"

syn region instaparseTerminal start='"' end='"'
syn region instaparseTerminal start="'" end="'"

syn match instaparseRegexStart "#"

syn match instaparseRule "="
syn match instaparseRule ":"
syn match instaparseRule ":="
syn match instaparseRule "::="

syn match instaparseAlteration "|"

syn match instaparseEndOfRule ";"
syn match instaparseOneOrMore "+"

syn match instaparseIdentifier "[a-zA-Z-]\w*"

syn match instaparseZeroOrMore "\*"
syn match instaparseOptional "\v\?"

syn region instaparseZeroOrMoreBracket matchgroup=instaparseZeroOrMore    start="{"        end="]" contains=@instaparseTop
syn region instaparseOptionalBracket   matchgroup=instaparseOptional      start="\["       end="]" contains=@instaparseTop
syn region instaparseHiddenBracket     matchgroup=instaparseHiddenBracket start="<"        end=">" contains=instaparseIdentifier
syn region instaparseGrouping          matchgroup=instaparseParen         start="(\ze[^*]" end=")" contains=@instaparseTop

syntax cluster instaparseTop contains=instaparseTerminal,instaparseAlteration,instaparseOneOrMore,instaparseZeroOrMore,instaparseOptional,instaparseIdentifier,instaparseGrouping,instaparseHiddenBracket,instaparseOptionalBracket,instaparseZeroOrMoreBracket

" Highlight superfluous closing parens, brackets and braces.
syntax match clojureError "]\|}\|)"

hi def link instaparseComment     Comment

hi def link instaparseTerminal    String

hi def link instaparseRule        Special
hi def link instaparseAlteration  Special

hi def link instaparseEndOfRule   Constant

hi def link instaparseParen       Delimiter

hi def link instaparseOptional    Conditional
hi def link instaparseZeroOrMore  Conditional
hi def link instaparseOneOrMore   Conditional
hi def link instaparseZeroOrMore  Conditional

hi def link instaparseIdentifier  Identifier

hi def link instaparseHiddenBracket Include
hi def link instaparseRegexStart Include

hi def link instaparseError Error

let &cpo = s:keepcpo
unlet s:keepcpo

let b:current_syntax = "instaparse"

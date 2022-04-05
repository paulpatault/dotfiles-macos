" Vim syntax file
" Language:     Gospel annotations in OCaml programs
" Maintainers:  Paul Patault (paul.patault@universite-paris-saclay.fr)
"
" Last Change:
"              - 2022 Apr 04 - first very basic version included in OCaml syntax
"
" You can put this file in your .vim/syntax, and you have to modify (or create)
" .vim/after/syntax/c.vim and copy these lines :
"
" syn include @GOSPEL syntax/gospel.vim
" syn region GospelComment matchgroup=GospelComment start="(\*@"rs=e-1 end="\*)" contains=@GOSPEL
"
" so you use the normal OCaml syntax highlighting,
" and enhance it with Gospel annotations highlighting.
"-------------------------------------------------------------------------------

syn match GospelStart /@/

syn region GospelCommentInComment start="(\*" end="\*)" containedin=GospelComment contained

"-------------------------------------------------------------------------------

syn keyword GospelKeyword  requires
syn keyword GospelKeyword  checks
syn keyword GospelKeyword  modifies
syn keyword GospelKeyword  ensures
syn keyword GospelKeyword  raises

syn keyword GospelKeyword2 axiom
syn keyword GospelKeyword2 consumes
syn keyword GospelKeyword2 diverges
syn keyword GospelKeyword2 ephemeral
syn keyword GospelKeyword2 equivalent
syn keyword GospelKeyword2 model
syn keyword GospelKeyword2 mutable
syn keyword GospelKeyword2 pure
syn keyword GospelKeyword2 variant
syn keyword GospelKeyword2 coercion
syn keyword GospelKeyword2 exists
syn keyword GospelKeyword2 forall
syn keyword GospelKeyword2 variant
syn keyword GospelKeyword2 predicate

syn match   GospelSymbol   /<->/
" syn match   GospelSymbol   /->/
" syn match   GospelSymbol   /<-/
syn match   GospelSymbol   /\\\//
syn match   GospelSymbol   /\/\\/

"-------------------------------------------------------------------------------

" hi GospelStart gui=bold

hi def link GospelError            Error
hi def link GospelCommentInComment Comment
hi def link GospelComment          Comment
hi def link GospelKeyword          Keyword
hi def link GospelKeyword2         PreProc
hi def link GospelSymbol           Comment
hi def link GospelStart            Comment


"-------------------------------------------------------------------------------

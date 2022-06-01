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

syn keyword GospelKeyword requires
syn keyword GospelKeyword checks
syn keyword GospelKeyword modifies
syn keyword GospelKeyword ensures
syn keyword GospelKeyword raises
syn keyword GospelKeyword axiom
syn keyword GospelKeyword with
syn keyword GospelKeyword type
syn keyword GospelKeyword rec
syn keyword GospelKeyword open
syn keyword GospelKeyword consumes
syn keyword GospelKeyword diverges
syn keyword GospelKeyword ephemeral
syn keyword GospelKeyword equivalent
syn keyword GospelKeyword model
syn keyword GospelKeyword mutable
syn keyword GospelKeyword pure
syn keyword GospelKeyword invariant
syn keyword GospelKeyword variant
syn keyword GospelKeyword coercion
syn keyword GospelKeyword exists
syn keyword GospelKeyword forall
syn keyword GospelKeyword variant
syn keyword GospelKeyword predicate
syn keyword GospelKeyword function
syn keyword GospelKeyword val
syn keyword GospelKeyword match

syn match   GospelSymbol   /<->/
" syn match   GospelSymbol   /->/
" syn match   GospelSymbol   /<-/
syn match   GospelSymbol   /\\\//
syn match   GospelSymbol   /\/\\/

"-------------------------------------------------------------------------------


" hi! Keyword gui=bold
" hi KW guifg=#C260B5 guibg=NONE guisp=NONE gui=bold
" hi KW guifg=#B460C2 guibg=NONE guisp=NONE gui=bold


" ctermfg=30 ctermbg=NONE cterm=bold

hi def link GospelError            Error
hi def link GospelCommentInComment Comment
hi def link GospelComment          Comment
hi def link GospelKeyword          Identifier
hi def link GospelSymbol           Comment
hi def link GospelStart            Comment

" hi! GospelKeyword   gui=italic guifg=#d3869b
" hi! GospelKeyword2  gui=italic guifg=#d3869b
" hi! GospelStart    gui=italic guifg=#d3869b
" hi! GospelSymbol   gui=italic guifg=#d3869b
" #fabd2f

"-------------------------------------------------------------------------------

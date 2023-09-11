" Vim syntax file
" Language: Coma
" Author: Paul Patault paul.patault@ens-paris-saclay.fr

syn clear

syn case ignore

syn keyword comaConstant    true false
syn keyword comaOperator    and or not xor
syn keyword comaKeyword     fun
syn keyword comaType        bool int list
syn keyword comaPrimitive   unList div halt if assign any

syn match comaBoxes "!" conceal cchar=↑
syn match comaBoxes "?" conceal cchar=↓

syn match comaDelimiter   "[({})]"
syn match comaIdentifier  "\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn match comaNumber      "\<[0-9]\+\>"
syn match comaOperator    "[&+*=><^]"
syn match comaOperator    ">="
syn match comaOperator    "<="
syn match comaOperator    "->" conceal cchar=→
syn match comaDefinition  "\/ \<[a-zA-Z_][a-zA-Z0-9_]*\>"

syn match  comaType       "'\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn region comaTypes      start="<" end=">" contains=comaType
syn match  comaOperator   "<>"

syn keyword comaTodo contained TODO
" syn region  comaComment  start="(\*" end="\*)" contains=comaTodo
syn match   comaComment  "--.*" contains=lusTodo

syn region  comaPrewrites  start="\["  end="\]"

syn sync lines=250

if !exists("did_coma_syntax_inits")
  let did_coma_syntax_inits = 1
  hi link comaComment        Comment
  hi link comaParam          Ignore
  hi link comaConstant       Number
  hi link comaDelimiter      Comment
  hi link comaIdentifier     Ignore 
  hi link comaPrimitive      Ignore
  hi link comaNumber         Number
  hi link comaOperator       Keyword
  hi link comaKeyword        Keyword
  hi link comaTodo           Todo
  hi link comaType           Type
  hi link comaTypes          StorageClass
  hi link comaPrewrites      Special
  hi link comaDefinition     Ignore
  hi link comaBoxes          Keyword
  hi! link Conceal           Keyword
  set conceallevel=2

  function! ToggleConcealLevel()
      if &conceallevel == 0
          setlocal conceallevel=2
      else
          setlocal conceallevel=0
      endif
  endfunction

  nnoremap <silent> <C-c><C-y> :call ToggleConcealLevel()<CR>

endif

let b:current_syntax = "coma"

" vim: ts=8

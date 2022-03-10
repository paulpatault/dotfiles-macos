" Vim syntax file
" Language: patmat
" Author: Paul Patault

syn clear

syn case ignore

syn keyword patmatStatement  match with of when type

syn match   patmatDelimiter  "[()]"
syn region  patmatComment    start="/\*"  end="\*/"
syn keyword patmatType       int action
syn match   patmatOperator   "->" "|" "="

syn sync lines=250

if !exists("did_patmat_syntax_inits")
  let did_patmat_syntax_inits = 1
  hi link patmatStatement      Statement
  hi link patmatConditional    Conditional
  hi link patmatConstant       Number
  hi link patmatOperator       Operator
  hi link patmatFunction       Function
  hi link patmatType           Type
  hi link patmatComment        Comment
  hi link patmatDelimiter      Identifier
endif

let b:current_syntax = "patmat"

" vim: ts=8

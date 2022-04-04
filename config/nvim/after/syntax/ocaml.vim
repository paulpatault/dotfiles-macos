syn include @GOSPEL syntax/gospel.vim
syn region GospelComment matchgroup=GospelComment start="(\*@"rs=e-1 end="\*)" contains=@GOSPEL

" if exists('g:no_ocaml_conceal') || !has('conceal')
"     finish
" endif

" syntax keyword ocamlNiceKeyword fun conceal cchar=λ
" syntax match ocamlNiceOperator "->" conceal cchar=→
" syntax match ocamlNiceOperator "<=" conceal cchar=≲
" " Make sure >>= isn't matched
" syntax match ocamlNiceOperator /\s>=\s/ms=s+1,me=e-1 conceal cchar=≳
" syntax match ocamlNiceOperator "<>" conceal cchar=≠
" syntax match ocamlNiceOperator "\:\:" conceal cchar=∷
" syntax match ocamlniceoperator "++" conceal cchar=⧺

" syntax match ocamlNiceTypes "'a" conceal cchar=α
" syntax match ocamlNiceTypes "'b" conceal cchar=β
" syntax match ocamlNiceTypes "'c" conceal cchar=γ
" syntax match ocamlNiceTypes "'d" conceal cchar=δ
" syntax match ocamlNiceTypes "'e" conceal cchar=ε

" hi link ocamlNiceOperator Operator
" hi! link Conceal Operator
" hi link ocamlNiceKeyword Keyword
" set conceallevel=2

syn clear

" Les mots-cles
syn keyword proofTerm         Bool true false Type fun Pi Ind J Nat Z S
syn keyword proofCommand      assume context define check eval exit type read check_val

syn sync lines=250

if !exists("did_proof_syntax_inits")
  let did_proof_syntax_inits = 1
  hi link proofTerm         Type
  hi link proofCommand      Statement
endif

let b:current_syntax = "proof"

" vim: ts=8

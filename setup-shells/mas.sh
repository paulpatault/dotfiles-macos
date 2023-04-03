#!/bin/zsh

###################################################################################################

MAS_MIN=()

MAS_ALL=(
1176895641 # spark email
1494457680 # Smash: File transfer
1440147259 # AddGuard for Safari
)

if [[ $1 ]]
then
    mas install ${MAS_MIN[@]}
else
    mas install ${MAS_MIN[@]}
    mas install ${MAS_ALL[@]}
fi


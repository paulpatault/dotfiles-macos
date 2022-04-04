syn include @GOSPEL syntax/gospel.vim
syn region GospelComment matchgroup=GospelComment start="(\*@"rs=e-1 end="\*)" contains=@GOSPEL

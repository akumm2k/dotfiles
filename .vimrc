" set line number
set nu
set rnu

" turn syntax highlighting on
syntax on

" disable arrow keys
for arrow_key in ['<Up>', '<Right>', '<Down>', '<Left>']
	exec 'noremap' arrow_key '<nop>'
endfor

" set tab width
:set tabstop=4

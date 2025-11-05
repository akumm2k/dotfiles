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

" set ruler for line width
:set colorcolumn=70

" set ruler color to red in vim term
:hi ColorColumn ctermbg=red

" turn on search highlight and incremental search
:set hls is

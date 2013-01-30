function! SectionFolds()
	let thisline = getline(v:lnum + 1)
	if match(thisline, '\$\$') >= 0
		return ">1"
	else
		return "="
	endif
endfunction
setlocal foldmethod=expr
setlocal foldexpr=SectionFolds()

function! SectionFoldText()
	let foldsize = (v:foldend-v:foldstart)
	return getline(v:foldstart + 1).' ('.foldsize.' lines)'
endfunction
setlocal foldtext=SectionFoldText()

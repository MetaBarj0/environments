function DisplayTreeAndTags()
  TagbarOpen
  NERDTree
  wincmd p
  wincmd =
  call FindFileInTree()
endfunction

function FindFileInTree()
  if &modifiable
    NERDTreeFind
    wincmd p
    wincmd =
  endif
endfunction


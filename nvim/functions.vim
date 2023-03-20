"
" General Commands
"
function s:del_marks()
	delm! | delm A-Z0-9
endfunction
command DelMarks :call s:del_marks()


" Zoom
function! ToggleZoom()
    let g:zoom_status = get(g:, 'zoom_status', 0)
    if g:zoom_status == 0 && winheight(1) > 50
        " Not currently zoomed, so lets zoom in
        wincmd _
        wincmd |
        let g:zoom_status = 1
    elseif winheight(1) > 50
        " Currently zoomed in, so lets zoom out
        wincmd =
        let g:zoom_status = 0
    endif
endfunction

nnoremap <leader>0 :call ToggleZoom()<CR>

function! RetainZoomStatus()
    " Assume that if we haven't called ToggleZoom() before then all windows
    " are probably meant to be equal (set g:zoom_status to 0)
    let g:zoom_status = get(g:, 'zoom_status', 0)
    if g:zoom_status == 0 && winheight(1) > 50
        wincmd =
    elseif winheight(1) > 50
        wincmd _
        wincmd |
    endif
endfunction

augroup zoom
    autocmd!
    autocmd VimResized * call RetainZoomStatus()
augroup END

"
" Plugin-specific commands
"

" fzf: delete buffers
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" vimspector: monkey-patch config & key mappings on startup
	" disable dwm
	" define convenient mappings for step into, step over etc.
function s:vimspector_launch()
	let g:dwm_no_compatible = 1
	nnoremap I :call vimspector#StepInto()<cr>
	nnoremap O :call vimspector#StepOver()<cr>
	nnoremap C :call vimspector#Continue()<cr>
	:call vimspector#Launch()
endfunction
command VimspectorLaunch :call s:vimspector_launch()

" vimspector: monkey-patch config & key mappings on exit
	" enable dwm
	" remove mappings for step into, step over etc.
function s:vimspector_exit()
	let g:dwm_no_compatible = 0
	unmap I
	unmap O
	unmap C
	:call vimspector#Reset()
endfunction
command VimspectorExit :call s:vimspector_exit()

" zk: follow links to Markdown files and open in new window
function s:follow_link()
	let $file = expand("<cword>") . ".md"
	silent! Plug DWM_New()
	edit $file
endfunction
command FollowLink :call s:follow_link()

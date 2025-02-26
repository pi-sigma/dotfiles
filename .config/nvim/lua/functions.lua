-- maximize current window
function ToggleZoom()
    vim.g.zoom_status = vim.g.zoom_status or 0
    local winheight = vim.api.nvim_win_get_height(0)

    -- zoom in (maximize current window)
    if vim.g.zoom_status == 0 and winheight > 50 then
        vim.api.nvim_win_set_height(0, 1000)
        vim.api.nvim_win_set_width(0, 1000)
        vim.g.zoom_status = 1
    -- zoom out (make all windows equal)
    elseif winheight > 50 then
        vim.cmd("wincmd =")
        vim.g.zoom_status = 0
    end
end
vim.keymap.set("n", "<leader>+", ":lua ToggleZoom()<CR>", {})


-- Lua version does not work properly
vim.cmd([[
function! RetainZoomStatus()
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
]])

-- delete marks
vim.cmd([[
    function s:del_marks()
        delm! | delm A-Z0-9
    endfunction
    command DelMarks :call s:del_marks()
]])

-- delete buffers
vim.cmd([[
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
]])

-- copy path of current buffer to clipboard
vim.api.nvim_create_user_command('CopyPath', function(opts)
  local path
  if opts.args == 'nameonly' then
    path = vim.fn.expand('%:t')
  elseif opts.args == 'relative' then
    path = vim.fn.expand('%')
  else
    path = vim.fn.expand('%:p')
  end
  vim.fn.setreg('+', path)
  print('Copied: ' .. path)
end, {nargs = '?'})

vim.cmd([[
    function s:follow_link()
        let $file = expand("<cword>") . ".md"
        silent! Plug DWM_New()
        edit $file
    endfunction
    command FollowLink :call s:follow_link()
]])

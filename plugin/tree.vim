if has('win32') || exists('g:loaded_tree') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

hi def link LuaTreePopup Normal

au BufWritePost * lua require'tree'.refresh()
" au BufEnter * lua require'tree'.check_windows_and_close()
" au VimEnter * lua require'tree'.check_buffer_and_open()

" TODO set status line dynamically on bufenter in the luatree
" to remove lightline and other possible components
au BufEnter LuaTree setlocal statusline="" 

if get(g:, 'lua_tree_follow') != 0
    au BufEnter * :LuaTreeFindFile
endif

" TODO: WinEnter is not the right autocommand for this task,
" but we do not have LayoutChange or WinMove kind of option atm,
" so this is deactivated by default to avoid messing up users workflows

" au WinEnter * lua require'tree'.replace_tree()

command! LuaTreeToggle lua require'tree'.toggle()
command! LuaTreeRefresh lua require'tree'.refresh()
command! LuaTreeFindFile lua require'tree'.find()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_tree = 1

"=============================================================================
" FILE: session.vim
" AUTHOR: Tung Dao <me@tungdao.com>
" Last Modified: 2011-02-05
" License: MIT license
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
"=============================================================================

let s:kind = {
            \ 'name': 'session',
            \ 'default_action': 'load',
            \ 'action_table': {},
            \ 'parents': [],
            \ }
let s:kind.action_table.load = {
            \ 'description': 'load session',
            \ 'is_selectable': 1,
            \ }
function! s:kind.action_table.load.func(candidates)
    if len(a:candidates) != 1
        echo "candidates must be only one"
        return
    endif
    execute "source " . substitute(a:candidates[0].action__path, '\v(\s)', '\\\1', 'g')
endfunction

let s:kind.action_table.delete = {
            \ 'description': 'delete session',
            \ 'is_selectable': 1,
            \ }
function! s:kind.action_table.delete.func(candidates)
    if len(a:candidates) != 1
        echo "candidates must be only one"
        return
    endif
    if has("win32") || has("win64")
        silent execute '!del ' . shellescape(a:candidates[0].action__path, 1)
    else
        silent execute '!rm ' . shellescape(a:candidates[0].action__path, 1)
    endif
endfunction

let s:kind.action_table.edit = {
            \ 'description': 'edit existing session',
            \ 'is_selectable': 1,
            \ }
function! s:kind.action_table.edit.func(candidates)
    if len(a:candidates) != 1
        echo "candidates must be only one"
        return
    endif
    execute "edit " . substitute(a:candidates[0].action__path, '\v(\s)', '\\\1', 'g')
endfunction

function! unite#kinds#session#define()
    return s:kind
endfunction

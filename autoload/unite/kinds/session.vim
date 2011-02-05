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
            \ 'default_action': 'execute',
            \ 'action_table': {},
            \ 'parents': [],
            \ }
let s:kind.action_table.execute = {
            \ 'is_selectable': 1,
            \ }
function! s:kind.action_table.execute.func(candidates)
    if len(a:candidates) != 1
        echo "candidates must be only one"
        return
    endif
    execute "source ~/.vim/sessions/" . a:candidates[0].word
endfunction

function! unite#kinds#session#define()
    return s:kind
endfunction

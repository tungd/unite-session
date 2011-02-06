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

if !exists('g:unite_session_path')
    if has("win32") || has("win64")
        " Default path for Windows
        let s:session_path = $HOME . '/Documents/vimfiles'
    else
        " Default path for Linux, Unix and Mac OS X
        let s:session_path = $HOME . '/.vim/sessions/'
    endif
else
    s:session_path = g:unite_session_path
endif

let s:unite_source = {
    \ 'name': 'session',
    \ }

function! s:unite_source.gather_candidates(args, context)
    " [(name, dir)]
    let session_list = map(split(globpath(s:session_path, '/*'), '\n'),
                \ '[fnamemodify(v:val, ":t:r"), fnamemodify(v:val, ":h")]')

    return map(session_list, '{
            \ "word": v:val[0],
            \ "source": "session",
            \ "kind": "session",
            \ "action__path": printf("%s/%s", v:val[1], v:val[0]),
            \ "action__directory": v:val[1],
            \ }')
endfunction

function! unite#sources#session#define()
    return s:unite_source
endfunction

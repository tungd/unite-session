let s:unite_source = {
    \ 'name': 'session',
    \ }

function! s:unite_source.gather_candidates(args, context)
    " [(name, dir)]
    let session_list = map(split(globpath(&runtimepath, 'sessions/*'), '\n'),
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

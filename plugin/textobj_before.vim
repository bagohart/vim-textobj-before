" Reload guard {{{
if &compatible || exists("g:loaded_textobj_before")
    " finish
endif " }}}

" Finish guard {{{
let g:textobj_before_enabled = get(g:, "textobj_before_enabled", 0)
if g:textobj_before_enabled != 1
    " finish
endif " }}}

" Options {{{
let g:textobj_before_prefix_i = get(g:, "textobj_before_prefix_i", "ib")
let g:textobj_before_prefix_a = get(g:, "textobj_before_prefix_a", "ab")
" }}}

" Textobject definitions {{{
let prefix_a = g:textobj_before_prefix_a
let prefix_i = g:textobj_before_prefix_i

" separators: =,:;|./\'"!#<>[]{}()

" not trivially loopable since the different special signs need to be escaped
" and it is just more robust this way ~_X
call textobj#user#plugin('before', {
\   'equal_a': {
\     'pattern': '\v^[^=]*\=',
\     'select': [ prefix_a . '=' ],
\     'scan': 'nearest',
\   },
\   'equal_i': {
\     'pattern': '\v^\s*\zs[^=]{-1,}\ze\s*\=',
\     'select': [ prefix_i . '=' ],
\     'scan': 'nearest',
\   },
\   'comma_a': {
\     'pattern': '\v^[^,]*\,',
\     'select': [ prefix_a . ',' ],
\     'scan': 'nearest',
\   },
\   'comma_i': {
\     'pattern': '\v^\s*\zs[^,]{-1,}\ze\s*\,',
\     'select': [ prefix_i . ',' ],
\     'scan': 'nearest',
\   },
\   'colon_a': {
\     'pattern': '\v^[^:]*\:',
\     'select': [ prefix_a . ':' ],
\     'scan': 'nearest',
\   },
\   'colon_i': {
\     'pattern': '\v^\s*\zs[^:]{-1,}\ze\s*\:',
\     'select': [ prefix_i . ':' ],
\     'scan': 'nearest',
\   },
\   'semicolon_a': {
\     'pattern': '\v^[^;]*\;',
\     'select': [ prefix_a . ';' ],
\     'scan': 'nearest',
\   },
\   'semicolon_i': {
\     'pattern': '\v^\s*\zs[^;]{-1,}\ze\s*\;',
\     'select': [ prefix_i . ';' ],
\     'scan': 'nearest',
\   },
\   'verticalbar_a': {
\     'pattern': '\v^[^|]*\|',
\     'select': [ prefix_a . '<bar>' ],
\     'scan': 'nearest',
\   },
\   'verticalbar_i': {
\     'pattern': '\v^\s*\zs[^|]{-1,}\ze\s*\|',
\     'select': [ prefix_i . '<bar>' ],
\     'scan': 'nearest',
\   },
\   'dot_a': {
\     'pattern': '\v^[^.]*\.',
\     'select': [ prefix_a . '.' ],
\     'scan': 'nearest',
\   },
\   'dot_i': {
\     'pattern': '\v^\s*\zs[^.]{-1,}\ze\s*\.',
\     'select': [ prefix_i . '.' ],
\     'scan': 'nearest',
\   },
\   'slash_a': {
\     'pattern': '\v^[^/]*\/',
\     'select': [ prefix_a . '/' ],
\     'scan': 'nearest',
\   },
\   'slash_i': {
\     'pattern': '\v^\s*\zs[^/]{-1,}\ze\s*\/',
\     'select': [ prefix_i . '/' ],
\     'scan': 'nearest',
\   },
\   'backslash_a': {
\     'pattern': '\v^[^\\]*\\',
\     'select': [ prefix_a . '\' ],
\     'scan': 'nearest',
\   },
\   'backslash_i': {
\     'pattern': '\v^\s*\zs[^\\]{-1,}\ze\s*\\',
\     'select': [ prefix_i . '\' ],
\     'scan': 'nearest',
\   },
\   'singlequote_a': {
\     'pattern': '\v^[^'']*''',
\     'select': [ prefix_a . '''' ],
\     'scan': 'nearest',
\   },
\   'singlequote_i': {
\     'pattern': '\v^\s*\zs[^'']{-1,}\ze\s*''',
\     'select': [ prefix_i . '''' ],
\     'scan': 'nearest',
\   },
\   'doublequote_a': {
\     'pattern': '\v^[^"]*"',
\     'select': [ prefix_a . '"' ],
\     'scan': 'nearest',
\   },
\   'doublequote_i': {
\     'pattern': '\v^\s*\zs[^"]{-1,}\ze\s*"',
\     'select': [ prefix_i . '"' ],
\     'scan': 'nearest',
\   },
\   'bang_a': {
\     'pattern': '\v^[^!]*!',
\     'select': [ prefix_a . '!' ],
\     'scan': 'nearest',
\   },
\   'bang_i': {
\     'pattern': '\v^\s*\zs[^!]{-1,}\ze\s*!',
\     'select': [ prefix_i . '!' ],
\     'scan': 'nearest',
\   },
\   'sharp_a': {
\     'pattern': '\v^[^#]*#',
\     'select': [ prefix_a . '#' ],
\     'scan': 'nearest',
\   },
\   'sharp_i': {
\     'pattern': '\v^\s*\zs[^#]{-1,}\ze\s*#',
\     'select': [ prefix_i . '#' ],
\     'scan': 'nearest',
\   },
\   'smaller_a': {
\     'pattern': '\v^[^<]*\<',
\     'select': [ prefix_a . '<' ],
\     'scan': 'nearest',
\   },
\   'smaller_i': {
\     'pattern': '\v^\s*\zs[^<]{-1,}\ze\s*\<',
\     'select': [ prefix_i . '<' ],
\     'scan': 'nearest',
\   },
\   'greater_a': {
\     'pattern': '\v^[^>]*\>',
\     'select': [ prefix_a . '>' ],
\     'scan': 'nearest',
\   },
\   'greater_i': {
\     'pattern': '\v^\s*\zs[^>]{-1,}\ze\s*\>',
\     'select': [ prefix_i . '>' ],
\     'scan': 'nearest',
\   },
\   'openbracket_a': {
\     'pattern': '\v^[^(]*\(',
\     'select': [ prefix_a . '(' ],
\     'scan': 'nearest',
\   },
\   'openbracket_i': {
\     'pattern': '\v^\s*\zs[^(]{-1,}\ze\s*\(',
\     'select': [ prefix_i . '(' ],
\     'scan': 'nearest',
\   },
\   'closebracket_a': {
\     'pattern': '\v^[^)]*\)',
\     'select': [ prefix_a . ')' ],
\     'scan': 'nearest',
\   },
\   'closebracket_i': {
\     'pattern': '\v^\s*\zs[^)]{-1,}\ze\s*\)',
\     'select': [ prefix_i . ')' ],
\     'scan': 'nearest',
\   },
\   'openbrace_a': {
\     'pattern': '\v^[^{]*\{',
\     'select': [ prefix_a . '{' ],
\     'scan': 'nearest',
\   },
\   'openbrace_i': {
\     'pattern': '\v^\s*\zs[^{]{-1,}\ze\s*\{',
\     'select': [ prefix_i . '{' ],
\     'scan': 'nearest',
\   },
\   'opensquarebracket_a': {
\     'pattern': '\v^[^[]*\[',
\     'select': [ prefix_a . '[' ],
\     'scan': 'nearest',
\   },
\   'opensquarebracket_i': {
\     'pattern': '\v^\s*\zs[^[]{-1,}\ze\s*\[',
\     'select': [ prefix_i . '[' ],
\     'scan': 'nearest',
\   },
\   'closesquarebracket_a': {
\     'pattern': '\v^[^]]*\]',
\     'select': [ prefix_a . ']' ],
\     'scan': 'nearest',
\   },
\   'closesquarebracket_i': {
\     'pattern': '\v^\s*\zs[^]]{-1,}\ze\s*\]',
\     'select': [ prefix_i . ']' ],
\     'scan': 'nearest',
\   },
\ })
" }}}

let g:loaded_textobj_before = 1

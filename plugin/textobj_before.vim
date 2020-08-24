" Reload guard {{{
if &compatible || exists("g:loaded_textobj_before")
    " finish
endif
" }}}

" Options {{{
let g:textobj_before_separators = get(g:, "textobj_before_separators", [])
let g:textobj_before_prefix_i = get(g:, "textobj_before_prefix_i", "ib")
let g:textobj_before_prefix_a = get(g:, "textobj_before_prefix_a", "ab")
" }}}
"lol= aha
"lol = aha
"lol lol = aha
    " lol = aha
" \     'pattern': '\v^\s*\zs[^=]+\ze\s*\=',
call textobj#user#plugin('before', {
\   'equal_a': {
\     'pattern': '\v^[^=]*\=',
\     'select': ['ab='],
\     'scan': 'nearest',
\   },
\   'equal_i': {
\     'pattern': '\v^\s*\zs[^=]{-1,}\ze\s*\=',
\     'select': ['ib='],
\     'scan': 'nearest',
\   },
\   'letter_a': {
\     'pattern': '\v^[^a]*\a',
\     'select': ['aba'],
\     'scan': 'nearest',
\   },
\   'letter_i': {
" \a does not work equivalently in regex, denotes character class.
\     'pattern': '\v^\s*\zs[^a]{-1,}\ze\s*a',
\     'select': ['iba'],
\     'scan': 'nearest',
\   },
\   'comma_a': {
\     'pattern': '\v^[^,]*\,',
\     'select': ['abc'],
\     'scan': 'nearest',
\   },
\   'comma_i': {
\     'pattern': '\v^\s*\zs[^,]{-1,}\ze\s*\,',
" ib, does not work, but ibc does. why? o_O
\     'select': ['ibc'],
\     'scan': 'nearest',
\   },
\ })

" function! textobj_before#enable(separators) abort " {{{
"     for separator in separators
"         execute 'onoremap ' . g:textobj_before_prefix_i . " :\<C-u>call s:select_i('" . separator . "')\<CR>"
"         execute 'onoremap ' . g:textobj_before_prefix_a . " :\<C-u>call s:select_a('" . separator . "')\<CR>"
"         execute 'xnoremap ' . g:textobj_before_prefix_i . " :\<C-u>call s:select_i('" . separator . "')\<CR>"
"         execute 'xnoremap ' . g:textobj_before_prefix_a . " :\<C-u>call s:select_a('" . separator . "')\<CR>"
"     endfor
" endfunction " }}}

" function! s:select_i(separator) abort " {{{
"     let save_cursor = getcurpos()
"     normal! ^
"     " if the separator exists, then the following two positions are correct
"     let start_pos = getcurpos()
"     execute 'normal! f' . a:separator
"     let separator_pos = getcurpos()

"     " now check if the separator exists
"     normal! 0
"     " We could use / as a separator
"     let search_string = LiteralPattern(separator)
"     let pos = search(search_string, 'c')
"     if pos == 0 || pos != current_line
"         " not found (in current line)
"         call setpos('.', save_cursor)
"     else
"         " found. now check if separator is first character on line, in which case we abort
"         if separator_pos[?] == start_pos[?]
"             call setpos('.', save_cursor)
"         else
"             " we need to skip whitespace before separator
"             " cursor is at correct position after search
"             call search('\v\S', 'b')	   	   
"             let end_pos = getcurpos()
"             normal! m>
"             call setpos('.', start_pos)
"             normal! m<
"             normal! `<v`>
"         endif
"     endif
" endfunction " }}}

" " https://vi.stackexchange.com/questions/17465/how-to-search-literally-without-any-regex-pattern
" " ^ lol. dafuq. geht wohl nicht anders.
" " todo: make scriptlocal
" function! LiteralPattern(literal_string)
"     " case sensitive enforce?
"     return '\V' . escape(a:literal_string, '\')
" endfunction

" " for i in g:textobj_surrounding_lines_numbers " {{{
" "     let key_sequence = g:textobj_surrounding_prefix . i . g:textobj_surrounding_postfix
" "     " activate visual line mode, go i lines up, change visual mode cursor side, go i lines down
" "     " Vimscript metaprogramming is so much fun u_U
" "     execute "onoremap " . key_sequence . " :\<C-u> normal! V" . i . 'ko' . i . 'j' . "\<CR>"
" "     execute "xnoremap " . key_sequence . " \<Esc>:\<C-u> normal! V" . i . 'ko' . i . 'j' . "\<CR>"
" " endfor " }}}

" let g:loaded_textobj_before = 1



" todo: old stuff. throw away if the new thing works.
"" Reload guard {{{
"if &compatible || exists("g:loaded_textobj_before")
"    finish
"endif
"let g:loaded_textobj_before = 1
"" }}}

"" Autoloading hack: Activate this to enforce local reloading. {{{
"" call TextobjBefore#textobj_before#Baaaad()
"" }}}

"" Options {{{
"let g:TextobjBefore_keep_visual_selection_on_failure = get(g:, "TextobjBefore_keep_visual_selection_on_failure", 0)
"let g:TextobjBefore_default_separator = get(g:, 'TextobjBefore_default_separator', '=')
"let g:TextobjBefore_enable_default_separator = get(g:, 'TextobjBefore_enable_default_separator', 0)
"let g:TextobjBefore_show_prompt = get(g:, 'TextobjBefore_show_prompt', 1)
"" }}}

"" User mappings. {{{
"" omap ib <Plug>(textobj-before-i-current-line-forward)
"" xmap ib <Plug>(textobj-before-i-current-line-forward)
"" omap ab <Plug>(textobj-before-a-current-line-forward)
"" xmap ab <Plug>(textobj-before-a-current-line-forward)

"" omap ibn <Plug>(textobj-before-i-forward)
"" xmap ibn <Plug>(textobj-before-i-forward)
"" omap ibl <Plug>(textobj-before-i-backward)
"" xmap ibl <Plug>(textobj-before-i-backward)
"" omap abn <Plug>(textobj-before-a-forward)
"" xmap abn <Plug>(textobj-before-a-forward)
"" omap abl <Plug>(textobj-before-a-backward)
"" xmap abl <Plug>(textobj-before-a-backward)
""
"" Or, alternatively e.g.:
"" omap ib <Plug>(textobj-before-i-forward)
"" xmap ib <Plug>(textobj-before-i-forward)
"" omap iB <Plug>(textobj-before-i-backward)
"" xmap iB <Plug>(textobj-before-i-backward)
"" omap ab <Plug>(textobj-before-a-forward)
"" xmap ab <Plug>(textobj-before-a-forward)
"" omap aB <Plug>(textobj-before-a-backward)
"" xmap aB <Plug>(textobj-before-a-backward)
"" }}}

"" <Plug> definitions {{{
"onoremap <Plug>(textobj-before-i-current-line-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "i", "o")<CR>
"xnoremap <Plug>(textobj-before-i-current-line-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "i", "v")<CR>
"onoremap <Plug>(textobj-before-i-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "i", "o")<CR>
"xnoremap <Plug>(textobj-before-i-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "i", "v")<CR>
"onoremap <Plug>(textobj-before-i-backward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "i", "o")<CR>
"xnoremap <Plug>(textobj-before-i-backward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "i", "v")<CR>
"onoremap <Plug>(textobj-before-a-current-line-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "a", "o")<CR>
"xnoremap <Plug>(textobj-before-a-current-line-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "a", "v")<CR>
"onoremap <Plug>(textobj-before-a-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "a", "o")<CR>
"xnoremap <Plug>(textobj-before-a-forward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "a", "v")<CR>
"onoremap <Plug>(textobj-before-a-backward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "a", "o")<CR>
"xnoremap <Plug>(textobj-before-a-backward)
"            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "a", "v")<CR>
"" }}}

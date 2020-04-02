" Reload guard {{{
if &compatible || exists("g:loaded_textobj_before")
    finish
endif
let g:loaded_textobj_before = 1
" }}}

" Autoloading hack: Activate this to enforce local reloading. {{{
" call TextobjBefore#textobj_before#Baaaad()
" }}}

" Options {{{
let g:TextobjBefore_keep_visual_selection_on_failure = get(g:, "TextobjBefore_keep_visual_selection_on_failure", 0)
let g:TextobjBefore_default_separator = get(g:, 'TextobjBefore_default_separator', '=')
let g:TextobjBefore_enable_default_separator = get(g:, 'TextobjBefore_enable_default_separator', 0)
let g:TextobjBefore_show_prompt = get(g:, 'TextobjBefore_show_prompt', 1)
" }}}

" User mappings. {{{
" omap ib <Plug>(textobj-before-i-current-line-forward)
" xmap ib <Plug>(textobj-before-i-current-line-forward)
" omap ab <Plug>(textobj-before-a-current-line-forward)
" xmap ab <Plug>(textobj-before-a-current-line-forward)

" omap ibn <Plug>(textobj-before-i-forward)
" xmap ibn <Plug>(textobj-before-i-forward)
" omap ibl <Plug>(textobj-before-i-backward)
" xmap ibl <Plug>(textobj-before-i-backward)
" omap abn <Plug>(textobj-before-a-forward)
" xmap abn <Plug>(textobj-before-a-forward)
" omap abl <Plug>(textobj-before-a-backward)
" xmap abl <Plug>(textobj-before-a-backward)
"
" Or, alternatively e.g.:
" omap ib <Plug>(textobj-before-i-forward)
" xmap ib <Plug>(textobj-before-i-forward)
" omap iB <Plug>(textobj-before-i-backward)
" xmap iB <Plug>(textobj-before-i-backward)
" omap ab <Plug>(textobj-before-a-forward)
" xmap ab <Plug>(textobj-before-a-forward)
" omap aB <Plug>(textobj-before-a-backward)
" xmap aB <Plug>(textobj-before-a-backward)
" }}}

" <Plug> definitions {{{
onoremap <Plug>(textobj-before-i-current-line-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "i", "o")<CR>
xnoremap <Plug>(textobj-before-i-current-line-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "i", "v")<CR>
onoremap <Plug>(textobj-before-i-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "i", "o")<CR>
xnoremap <Plug>(textobj-before-i-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "i", "v")<CR>
onoremap <Plug>(textobj-before-i-backward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "i", "o")<CR>
xnoremap <Plug>(textobj-before-i-backward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "i", "v")<CR>
onoremap <Plug>(textobj-before-a-current-line-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "a", "o")<CR>
xnoremap <Plug>(textobj-before-a-current-line-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("current-line-forward", "a", "v")<CR>
onoremap <Plug>(textobj-before-a-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "a", "o")<CR>
xnoremap <Plug>(textobj-before-a-forward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("forward", "a", "v")<CR>
onoremap <Plug>(textobj-before-a-backward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "a", "o")<CR>
xnoremap <Plug>(textobj-before-a-backward)
            \ :<C-u>call TextobjBefore#textobj_before#TextobjBefore("backward", "a", "v")<CR>
" }}}


" direction = "current_line_forward", "forward", "backward"
" selection_type = "i/a"
" previous_mode = "o/v" No distinction between v/V/<C-v> necessary
function! TextobjBefore#textobj_before#TextobjBefore(direction, selection_type, previous_mode) abort
    let save_cursor = getcurpos()
    if !g:TextobjBefore_enable_default_separator
        if g:TextobjBefore_show_prompt
            echo "Input separator..."
        endif
        let separator = nr2char(getchar())
    else
        " echom "Use g:TextobjBefore_separator"
        let separator = g:TextobjBefore_default_separator
    endif
    let escaped_separator = LiteralPattern(separator)
    " todo: brauche ich flag "c" ?
    " here, cursor is at start position
    if a:direction ==# "current-line-forward"
        " search() starts from current cursor position and we want to include the current line in the search!
        normal! 0
        let line_number = search(escaped_separator, "nW")
    elseif a:direction ==# "forward"
        if line(".") ==# line("$")
            let line_number = 0
        else
            normal! j0
            let line_number = search(escaped_separator, "nW")
        endif
    elseif a:direction ==# "backward"
        if line(".") ==# 1
            let line_number = 0
        else
            let line_number = search(escaped_separator, "nbW")
        endif
    else
        throw "Called TextobjBefore#textobj_before#TextobjBefore() with invalid direction=" . a:direction
    endif
    if line_number ==# 0
        " echom "No match found."
        call TextobjBefore#textobj_before#CancelSelection(a:previous_mode, save_cursor) 
        return
    endif
    " echom "Match is on line " . line_number
    if a:selection_type ==# 'i'
        let selection = TextobjBefore#textobj_before#SelectInner(separator, line_number, a:previous_mode, save_cursor)
    elseif a:selection_type ==# 'a'
        let selection = TextobjBefore#textobj_before#SelectAround(separator, line_number, a:previous_mode, save_cursor)
    else
        throw "Called TextobjBefore#textobj_before#TextobjBefore() with invalid selection_type=" . a:selection_type
    endif
    if selection ==# []
        call TextobjBefore#textobj_before#CancelSelection(a:previous_mode, save_cursor)
        return
    else
        call TextobjBefore#textobj_before#MarkSelection(selection)
    endif
endfunction

" todo: make functions scriptlocal
function! TextobjBefore#textobj_before#SelectInner(separator, line_number, previous_mode, original_curpos)
    " echom "Called TextobjBefore#textobj_before#SelectInner() with sep=" . a:separator . ", line_num=" . a:line_number
    call cursor(a:line_number, 1)
    normal! ^
    let selection_start = getcurpos()
    let actual_line_number = search(LiteralPattern(a:separator), "cW")
    if actual_line_number !=# a:line_number
        " throw "Called TextobjBefore#textobj_before#SelectInner() on line without separator!"
        " This can actually happen if the separating character is a <Space> and the line is e.g.
        " word
        " then a space is found with the first search, but not the second
        " not sure what to do with such edge cases. Do I even want to allow <Space> as a separator?
        return []
    endif
    let separator_pos = getcurpos()
    if selection_start[2] ==# separator_pos[2]
        " echom "Abort!". "The separator is the first non-white character on the line => nothing to select here."
        return []
    endif
    " Note: the cursor is now on the separator!
    call search('\v\S', "bW")
    let selection_end = getcurpos()
    return [selection_start, selection_end]
endfunction

function! TextobjBefore#textobj_before#SelectAround(separator, line_number, previous_mode, original_curpos)
    " echom "Called TextobjBefore#textobj_before#SelectAround() with sep=" . a:separator . ", line_num=" . a:line_number
    call cursor(a:line_number, 1)
    normal! 0
    let selection_start = getcurpos()
    let actual_line_number = search(LiteralPattern(a:separator), "cW")
    if actual_line_number !=# a:line_number
        throw "Called TextobjBefore#textobj_before#SelectInner() on line without separator!"
    endif
    let separator_pos = getcurpos()
    if selection_start[2] ==# separator_pos[2]
        " echom "Abort!". "The separator is the first character on the line => nothing to select here."
        return []
        " call TextobjBefore#textobj_before#CancelSelection(a:previous_mode, a:original_curpos)
    endif
    " Note: the cursor is now on the separator!
    normal! h
    let selection_end = getcurpos()
    return [selection_start, selection_end]
endfunction

" https://vi.stackexchange.com/questions/17465/how-to-search-literally-without-any-regex-pattern
" ^ lol. dafuq. geht wohl nicht anders.
" todo: make scriptlocal
function! LiteralPattern(literal_string)
    " case sensitive enforce?
    return '\V' . escape(a:literal_string, '\')
endfunction

function! TextobjBefore#textobj_before#CancelSelection(previous_mode, original_curpos)
    if a:previous_mode ==# "o"
        " I don't know why this cancels the selection, but textobj-user does it this way and it works.
        call cursor(a:original_curpos[1], a:original_curpos[2])
    else " visual mode
        if g:TextobjBefore_keep_visual_selection_on_failure
            normal! gv
        else
            call cursor(a:original_curpos[1], a:original_curpos[2])
        endif
    endif
endfunction

function! TextobjBefore#textobj_before#MarkSelection(selection)
    call setpos('.', a:selection[0])
    normal! m<
    call setpos('.', a:selection[1])
    normal! m>
    normal! gv
endfunction

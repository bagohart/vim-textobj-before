# Vim-Textobj-Before
This Vim plugin provides text objects to select text on a line *before* the specified character.

*This plugin works well, but has a high startuptime. If you use Neovim, consider using a lua version of this plugin instead:*
[*textobj-before.nvim*](https://github.com/bagohart/textobj-before.nvim)

## Requirements
Developed and tested on Neovim 0.4.4, but should work on Vim 8, too.
This plugin depends on [vim-textobj-user](https://github.com/kana/vim-textobj-user).

## Installation
Install with your favourite package manager or Vim's built-in package management system.
For example using Vim-Plug:
```
Plug 'kana/vim-textobj-user'
Plug 'bagohart/vim-textobj-before'
```

# Guide
By default, this plugin does nothing. To activate it, add the following lines to your vimrc:
```
let g:textobj_before_enabled = 1
```
This will add mappings for the following text objects:
`ib=`, `ab=`, `ib,`, `ab,`, `ib:`, `ab:`, `ib;`, `ab;`, `ib|`, `ab|`, `ib.`, `ab.`, `ib/`, `ab/`, `ib\`, `ab\`, `ib'`, `ab'`, `ib"`, `ab"`, `ib!`, `ab!`, `ib#`, `ab#`, `ib<`, `ab<`, `ib>`, `ab>`, `ib[`, `ab[`, `ib]`, `ab]`, `ib{`, `ab{`, `ib}`, `ab}`, `ib(`, `ab)`

To change the default prefix (`ib`/`ab`), add:
```
let g:textobj_before_prefix_i = 'ix'
let g:textobj_before_prefix_a = 'ax'
```

# Related Plugins
* [vim-after-object](https://github.com/junegunn/vim-after-object): Select the right hand side of a line after a separator

# License
The Vim licence applies. See `:help license`.


# Vim-Textobj-Before
This Vim plugin provides text objects to select text *before* the specified character.

# Guide
## Mappings
No mappings are created automatically. Add your own. I use:
```
omap ib <Plug>(textobj-before-i-current-line-forward)
xmap ib <Plug>(textobj-before-i-current-line-forward)
omap ab <Plug>(textobj-before-a-current-line-forward)
xmap ab <Plug>(textobj-before-a-current-line-forward)

omap ibn <Plug>(textobj-before-i-forward)
xmap ibn <Plug>(textobj-before-i-forward)
omap ibl <Plug>(textobj-before-i-backward)
xmap ibl <Plug>(textobj-before-i-backward)
omap abn <Plug>(textobj-before-a-forward)
xmap abn <Plug>(textobj-before-a-forward)
omap abl <Plug>(textobj-before-a-backward)
xmap abl <Plug>(textobj-before-a-backward)
```
If you intend to use `b` or `l` as separating characters, you'll have to come up with something else, e.g.:
```
omap ib <Plug>(textobj-before-i-current-line-forward)
xmap ib <Plug>(textobj-before-i-current-line-forward)
omap iB <Plug>(textobj-before-i-backward)
xmap iB <Plug>(textobj-before-i-backward)
omap ab <Plug>(textobj-before-a-current-line-forward)
xmap ab <Plug>(textobj-before-a-current-line-forward)
omap aB <Plug>(textobj-before-a-backward)
xmap aB <Plug>(textobj-before-a-backward)
```
where you would not use the `forward` variant at all.\
This shadows the built-in `ib` text object, but that is duplicated by `i)`.

## Usage
The `i` variants select without whitespace, the `a` variants include the whitespace.\
The separating character is not included.\
There are three variants (for both `i` and `a`):
* `ib` searches on the current and all following lines, but does not wrap around the end of the file.
* `ibn` searches on all following lines, but excludes the current line.
* `ibl` searches on all previous lines, excluding the current line.

All variants always select the match that is closest to the cursor.\
After activating the text object, enter a single character that will serve as delimiter.
Examples:
* `ib=` selects the left hand side of an assignment such as `a = 5`, without surrounding whitespace, on the current or a following line
* `abl:` selects the date of a line such as `   2020-02-02: blabla`, with surrounding whitespace, on a previous line

## Predefined Separator
If you don't want to enter the separator after `ib`, you could set it in two ways:
1. Add this to your vimrc:
```
let g:TextobjBefore_enable_default_separator=0
let g:TextobjBefore_default_separator="="
```
2. Define `Plug` mappings such as `omap ib <Plug>(textobj-before-i-current-line-forward)=`

## Combination with other Plugins
This plugin is not too useful on its own, since it can mostly be replaced with e.g. `^yt=`.
But in combination with custom operators it can be quite convenient. 2 Examples:
* Using [vim-exchange](https://github.com/tommcdo/vim-exchange), put your cursor on the first line of
```
val first = 23
val second = 42
```
and type `cxib=j.=` to obtain
```
val second = 23
val first = 42
```
* Using [vim-subversive](https://github.com/svermeulen/vim-subversive), put your cursor on the second line of
```
val first = 23
val second = 42
val third = 1337
```
and type `yibl=suibn=` to get
```
val first = bar()
val second = foo()
val first = second + first
```

## Settings
### `g:TextobjBefore_keep_visual_selection_on_failure`
**default: `0`**

If in visual mode you type `ib=` but nothing is selected, then the current visual selection is either kept or discarded.

### `g:TextobjBefore_default_separator`
**default: `=`**

Only used if `g:TextobjBefore_enable_default_separator` is `1`.

### `g:TextobjBefore_enable_default_separator`
**default: `0`**

If enabled, the user is not prompted for a separating character.\
Instead, `g:TextobjBefore_default_separator` is used.

### `g:TextobjBefore_show_prompt`
**default: `1`**

If enabled, show a prompt after typing `ib`.
Does not apply if `g:TextobjBefore_enable_default_separator` is enabled.

# Bugs
If `<Space>` is used as a separator, the resulting selection may fail or be unintended.

# Requirements
Developed and tested on Neovim 0.4.3. When I tested it on Vim 8.2, it worked, too.

# Related Plugins
* [vim-after-object](https://github.com/junegunn/vim-after-object): Select the right hand side of a line after a separator
* [vim-left-right-text-object](https://github.com/vim-scripts/text-object-left-and-right/blob/master/plugin/left_right_text_object.vim): Select the right or left side of an assignment

# License
The Vim licence applies. See `:help license`.

# KEYMAPS

leader key is configured as space.

## Terminal
- alt + ' -> Toggle powershell
- alt + ; -> Toggle powershell with MSVC environment

## File Navigation
- leader + e -> Toggle neo-tree

- leader + j -> Open telescope file search mode
- leader + f -> Open telescope grep mode

- leader + h -> Toggle harpoon
- leader + a -> Add current file to harpoon
- leader + 1 -> Open 1st file in harpoon
- leader + 2 -> Open 2st file in harpoon
- ...
- leader + 5 -> Open 5st file in harpoon

## Window Navigation
- ctrl + h -> Focus window on left
- ctrl + j -> Focus window on below
- ctrl + k -> Focus window on top
- ctrl + l -> Focus window on right

- leader + v -> vertical split

## Editor
- u -> undo
- r -> Redo

- gl -> Go end of line
- gh -> Go beginning of line

- alt + j -> page down (these are very useful if you don't use number + j/k for going to a line, also very useful when skimming code.)
- alt + k -> page up

- jk or kj -> Switch to normal mode from insert mode

- ctrl + j -> move selection to down (on visual mode)
- ctrl + k -> move selection to up (on visual mode)

- tab -> indent to right (on visual mode)
- shift + tab -> indent to left (on visual mode)

- \> -> indent to right (on visual mode)
- < -> indent to left (on visual mode)

- leader + s -> save file

- leader + w -> close buffer

## LSP
- leader + p -> Run code formatter (format on save is enabled in my default configuration, if you prefer to close it, you can use this.)

- gk -> open diagnostics
- \[d -> previous diagnostic
- \]d -> next diagnostic

- gd -> go definition
- g shift + d -> go declaration
- gi -> go implementation
- gr -> show references
- shift + k -> hover

- ga -> show code actions
- leader + rn -> rename symbol
- gs -> show signature

## Default Keymaps
Keymaps I use a lot, but that are preconfigured (default vim or plugin bindings):

- / -> Search (after search, press n for next occurrence, shift + n to previous occurrence)
- o -> Add a new line and go into insert mode
- . -> Repeat last action
- gg -> go to beginning of the file
- shift + g -> go to end of the file
- y -> copy
- p -> paste

## Navigation between options
- For options in code completion or telescope etc, press tab for forward and shift + tab for backward.
- Also ctrl + k to move up and ctrl + j to move down (code completion is going to be added.)

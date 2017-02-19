vim-visitf
==========

Open the file where the current path rewritten.

Usage
-----

Hit the assigned key.
But you need to configure following two things in advance.

1. Assign `<Plug>(visitf-next)` to any key.
2. Write rules to `g:visitf_rules`.

```vim
nmap gs <Plug>(visitf-next)

let g:visitf_rules = [
\   'Please refer to the following "Rules"'
\ ]
```

Rules
-----

`vim-visitf` rewrite the path
according to the rules described in `g:visitf_rules`.

`g:visitf_rules` is a list of elements which has following members:

#### `at` (required)

A regexp which detects target to be rewritten.

#### `rewrite` (required)

A function which recive the current path and return the rewrited path.

#### `check_exists` (default: 1)

A boolean value which describe
whether or not to open even if the rewritten path doesn't exist.

### example

```vim
" Switch plugin/*.vim and autoload/*.vim
let g:visitf_rules = [
\   {
\     'at': 'plugin.*\.vim$',
\     'rewrite': {path -> substitute(path, 'plugin\(.*\)\.vim$', 'autoload\1.vim', '')},
\   },
\   {
\     'at': 'autoload.*\.vim$',
\     'rewrite': {path -> substitute(path, 'autoload\(.*\)\.vim$', 'plugin\1.vim', '')},
\   },
\ ]
```

License
-------

MIT License

Author
------

kusabashira <kusabashira227@gmail.com>

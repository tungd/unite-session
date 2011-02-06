unite-session.vim
=================

Description
-----------
Session source for [unite.vim](https://github.com/shougo/unite.vim).
Based on [unite-colorscheme](https://github.com/ujihisa/unite-colorscheme) by Ujihisa.

For quick opening your sessions saved in **~/.vim/sessions/**.

Features
--------
1. Load the session files stored in **~/.vim/sessions/** or g:unite_session_path
2. Actions: edit, delete sessions

Future features:
1. `session_mru` source

Installation
------------
* Get the source from Github <https://github.com/tungd/unite-session>  
  `git clone https://github.com/tungd/unite-session.git`
* Copy `autoload/unite/sources/session.vim` and `autoload/unite/kinds/session.vim`  
  to appropriate location (e.g ~/.vim/autoload/).
* Add to your `.vimrc` file to make sessions updated automatically:  
  `autocmd VimLeavePre * if v:this_session != '' | exec "mks! " . v:this_session | endif`

**NOTE**: Or use Tim Pope's [pathogen](https://github.com/tpope/vim-pathogen) plugin.

Bug report or feature request
-----------------------------
You can report issues via Github or send me email (see Credits).

Credits
-------
Author: Tung Dao <me@tungdao.com>. Special thanks to:

* Shougo: https://github.com/shougo
* Ujihisa: https://github.com/ujihisa

License
-------
MIT License


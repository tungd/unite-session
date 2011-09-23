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

Installation
------------
* Get the source from Github <https://github.com/tungd/unite-session>
  `git clone https://github.com/tungd/unite-session.git`
* Copy `autoload/unite/sources/session.vim` and `autoload/unite/kinds/session.vim`
  to appropriate location (e.g ~/.vim/autoload/).

**NOTE**: Or use Tim Pope's [pathogen](https://github.com/tpope/vim-pathogen) plugin.

Options
-------
* `g:unite_session_path`: By default the plugin looks for session files in `$HOME/.vim/sessions/`
  on Mac OS and Linux, and `$HOME/Documents/vimfiles/sessions` on Windows. You can overdrive
  this behavior by setting this variable.
* `g:unite_session_keep_buffers`: By default when load new buffers the plugin will delete
  all current buffer. Set this options to keep your current buffers loading along side
  session's buffers. NOTE: These current buffers will be save to session file at quit.
* `g:unite_session_force_no_update`: The previous tips to keep the session automatically
  updated is now enabled by default. Set this options to disable it.

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


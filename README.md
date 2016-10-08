# My Emacs Configuration Files #


elpa packages list
==================

basic packages
--------------

- use-package
- ido
- undo-tree
- popup
- yasnippet
- auto-complete
- smex

outlooking packages
-------------------

- solarized-theme
- powerline

programming support packages
----------------------------

- C/C++ support
 - cedet
 - irony-mode
- common-list support
 - slime
- web support
 - web-mode
- python support
 - elpy
 - jedi
- lua support
 - lua-mode
- javascript
 - react-snippets
 - sws-mode
 - jade-mode
- documents support
 - markdown-mode

prepare for using those packages
================================

- Install depend packages
`sudo apt-get install exuberant-ctags`
- Install python depend packages
`pip install rope`
`pip install jedi`
`pip install flake8`
`pip install importmagic`
`pip install autopep8`
`pip install yapf`
- Install cedet
 `cd .emacs.d/`

 `git clone http://git.code.sf.net/p/cedet/git cedet`

 `cd cedet`

```
 touch `find . -name Makefile`
```

 `make`
 **or**
 `make MAKEINFO=/usr/bin/makeinfo` 

 *specified the path of makeinfo*


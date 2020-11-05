" vim: set sts=4:
"
" Inform filetype plugin v0.5.1
"    Language: Inform
"  Maintainer: Martin Bays <vim@zugzwang.port5.com>
"         URL: http://mbays.freeshell.org/informindent.tgz
" Last Change: Sat Mar 06 01:00 PM 2004 GMT
"
" (adapted from vim.vim by Bram Moolenaar (himself)) 

" Just the basics

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let cpo_save = &cpo
set cpo-=C

let b:undo_ftplugin = "setl fo< com< tw< commentstring<"
	    \ . "| unlet! b:match_ignorecase b:match_words"

" Set 'formatoptions' to break comment lines,
" and insert the comment leader when hitting <CR>, but not when using "o",
" becuase that really ticks me off.
setlocal fo+=crql

" Set 'comments' 
setlocal com=:!

" Format comments to be up to 78 characters long
setlocal tw=78

" Comments start with a bang
setlocal commentstring=!%s

" Include doesn't need a hash
setlocal include=^#\\?\\s*[iI]nclude

" Various definition statements
setlocal define=^#\\?\\s*\\([Cc]onstant\\\\|[Dd]efault\\\\|[Gg]lobal\\\\|[Aa]rray\\)

" For :make
" Depending on your setup, you may want to add a library path 
" (TODO - make that a config variable)
setlocal makeprg=inform\ %

" Due to Neil Cerutti -
setlocal errorformat=%f(%l):\ Error:\ \ %m,%f(%l):\ Warning:\ \ %m,%f(%l):\ Fatal\ error:\ %m

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '\<if\>:\<else\>,' .
		\ '\<do\>:\<until\>,' .
		\ '\<IF\(DEF\|NDEF\|TRUE\|FALSE\|V3\|V5\|NOT\)\>:\<ENDIF\>'

endif

let &cpo = cpo_save

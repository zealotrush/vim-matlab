" Vim compiler file
" Compiler:         Matlab mlint code checker
" Maintainer:       Fabrice Guy <fabrice.guy at gmail dot com>
" Latest Revision:  2008 Oct 16
" Comment:          mlint messages are either 
"                   - L x (C y): message (where x and y are line number and
"                   column number)
"                   - L x (C y-z): message (where x is the line number, y and
"                   z the column numbers where the error comes from)


if exists("current_compiler")
  finish
endif
let current_compiler = "mlint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=mlint\ -id\ %

CompilerSet errorformat=
      \%-P==========\ %f\ ==========,
      \%-G%>==========\ %s\ ==========,
      \%-G%>L\ %l\ (C\ %c):\ MDOTM%m,
      \L\ %l\ (C\ %c):\ %m,
      \L\ %l\ (C\ %c-%*[0-9]):\ %m,
      \%-Q

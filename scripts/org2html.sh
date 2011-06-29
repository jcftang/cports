#!/bin/sh

f=""

for file in "$@"
do
##emacs --batch -q --no-site-file --eval "(add-to-list 'load-path "~/.emacs.d/org-mode/lisp/")" --load $HOME/.emacs.d/org-mode/lisp/org.el --visit ${file} --funcall org-export-as-html-batch
    f="${f} --visit ${file} --funcall org-export-as-html-batch"
done
#emacs --batch -q --no-site-file --eval "(add-to-list 'load-path "~/.emacs.d/org-mode/lisp/")" --load $HOME/.emacs.d/org-mode/lisp/org.el $f
emacs --batch -q --no-site-file $f
## use emacsclient, check if running, execute. otherwise u this ## NO, emacsclient takes in elisp argument with 

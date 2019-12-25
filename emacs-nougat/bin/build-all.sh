#!/usr/bin/env bash
if [ -n "$(pgrep emacsclient)" ]
   then
       emacsclient -e '(save-buffers-kill-emacs)'
       echo "shutting down existing emacs processes before rebuilding"
fi

emacs --batch -l ./build.el  --eval "(to-elisp \"./user-outlines/$1.org\" t)"
emacs --batch -l ./build.el  --eval '(to-html ./user-outlines/$1.org t)'

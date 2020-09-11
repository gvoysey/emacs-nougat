#!/usr/bin/env bash
# if [ -n "$(pgrep emacsclient)" ]
#    then
#        emacsclient -e '(save-buffers-kill-emacs)'
#        echo "shutting down existing emacs processes before rebuilding"
# fi
echo weaving config for $1
emacs --batch -l ./build.el  --eval "(to-elisp \"./user-outlines/$1.org\" t)"
emacs --batch -l ./build.el  --eval "(to-html \"./user-outlines/$1.org\" t)"
echo regenerating HTML
rm -f "../docs/index.html"
ln -fn "./user-outlines/$1.html" "../docs/index.html"
echo setting symlinks
ln -sfn "./user-outlines/$1.el" "../init.el"
echo done!

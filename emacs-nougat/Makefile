all: clean init

clean:
	@-rm -f ./user-outlines/$(user).e*

init:
	@emacsclient -e "(save-buffers-kill-emacs)"
	./bin/build-elisp.sh $(user)

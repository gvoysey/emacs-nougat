#!/bin/bash
exec emacsclient -c -a="" "$@" & > /dev/null

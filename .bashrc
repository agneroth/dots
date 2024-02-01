#!/bin/bash

alias nohist="HISTFILE= bash"
alias clrhist="history -c && history -w"

eval "$(starship init bash)"


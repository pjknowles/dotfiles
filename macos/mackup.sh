#!/bin/sh
cat << EOF > ~/.mackup.cfg
[storage]
engine = file_system
path = .dotfiles/macos
directory = mackup
EOF
#mackup 

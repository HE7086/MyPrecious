#!/bin/bash

# ssh wrapper for easier cli usage
# make a symbolic link in the path or make a alias for better usage

# ln -s ~/.local/bin/ssh /path/to/this/file
# alias ssh='/path/to/this/file'

# fallback to default ssh when there's more than 1 argument
if [[ $# -ne 1 ]]; then
    /usr/bin/ssh $@

# a normal example to a host
elif [[ $1 = "1" ]]; then
    /usr/bin/ssh -i /path/to/identity user@host.postfix

# example connecting to host on specific port
elif [[ $1 = "2" ]]; then
    /usr/bin/ssh -p 1234 -i /path/to/identity user@host.postfix

# connect to host2 by first connect to host1 then jump to 2
elif [[ $1 = "3" ]]; then
    /usr/bin/ssh -i /path/to/identity -J user@host1 user2@host2

# test the connection and output the debug messages
elif [[ $# -eq 2 ]] && [[ $1 = "test" ]]; then
    /usr/bin/ssh -vT $2

# fallback
else
    /usr/bin/ssh $@
fi

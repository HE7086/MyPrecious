#!/bin/bash

# sftp wrapper for easier cli usage
# make a symbolic link in the path or make a alias for better usage
# baicly same as ssh, with minor differences

# ln -s ~/.local/bin/sftp /path/to/this/file
# alias sftp='/path/to/this/file'

# fallback to default sftp when there's more than 1 argument
if [[ $# -ne 1 ]]; then
    /usr/bin/sftp $@

# a normal example to a host
elif [[ $1 = "1" ]]; then
    /usr/bin/sftp -i /path/to/identity user@host.postfix

# example connecting to host on specific port
# note that -P option is capital, unlike ssh
elif [[ $1 = "2" ]]; then
    /usr/bin/sftp -P 1234 -i /path/to/identity user@host.postfix

# connect to host2 by first connect to host1 then jump to 2
elif [[ $1 = "3" ]]; then
    /usr/bin/sftp -i /path/to/identity -J user@host1 user2@host2

# test the connection and output the debug messages
elif [[ $# -eq 2 ]] && [[ $1 = "test" ]]; then
    /usr/bin/sftp -vT $2

# fallback
else
    /usr/bin/sftp $@
fi

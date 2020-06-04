#!/bin/bash

# GRNVS submission system auto tester
# commit test and checkout the result

# put this inside the folder uXXXX 
# run this inside result/assignmentN folder on result branch
# with following command:
# . ../../test
# consider make a symbolic link to this

current=${PWD##*/}


git checkout master
cd ../../$current
git add .

if [[ -z $* ]]; then
    git commit
else
    git commit -m $*
fi

git push

git checkout result
sleep 8 # sleep 8 seconds waiting for remote test
# TODO: auto pull?
git pull
cd ../result/$current

# vim test.log


#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    echo "Usage: clone-and-set-remote <git URL>"
    exit 1
fi

MY_GITHUB_USERNAME=vihanga-liyanage

BASE_URL=$1

# clone the repo
echo git clone $BASE_URL
git clone $BASE_URL

# split url by /
IFS=\/ arr=($BASE_URL)

echo cd ${arr[4]::-4}
cd ${arr[4]::-4}

# reset IFS
IFS=#

FORK_URL="${arr[0]}/${arr[1]}/${arr[2]}/$MY_GITHUB_USERNAME/${arr[4]}"

# Set pull remote
echo git remote set-url origin $1
git remote set-url origin $1

# Set push remote
echo git remote set-url --push origin $FORK_URL
git remote set-url --push origin $FORK_URL
#!/bin/bash
dir=~/.ssh
if [[ ! -e $dir ]]; then
    mkdir $dir
elif [[ ! -d $dir ]]; then
    echo "$dir already exists but is not a directory"
    exit 0
fi
cd $dir
printf "\n Github account username: "
read input
git config --global user.name "$input"
printf "\n Github account email: "
read input
git config --global user.email "$input"
ssh-keygen -t rsa -b 4096 -C $input -f id_github -q -N ""
echo "Host github.com" >> config
echo "    IdentityFile ~/.ssh/id_github" >> config
chmod 600 config
eval $(ssh-agent -s)
ssh-add id_github
ssh-keyscan -t rsa github.com >>known_hosts
clear
printf "Copy this code to github.com > settings > SSH ann GPG keys > New SSH Key : \n \n "
cat id_github.pub
printf "\n \n Press enter when finished to test the connection: "
read input
ssh -T git@github.com

#!/bin/bash

function add_ssh() {
  echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

function sshlist() {
  awk '$1 ~ /Host$/ { print $2 }' ~/.ssh/config
}

# export ssh public key to a remote server
function sshkey() {
  KEY="$HOME/.ssh/id_dsa.pub"

  if [ ! -f ${KEY} ];then
    KEY="$HOME/.ssh/id_rsa.pub"    
    echo "private key not found at ${KEY}"
    echo "* please create it with "ssh-keygen -t dsa" *"
    echo "* to login to the remote host without a password, don't give the key you create with ssh-keygen a password! *"
    return
  fi

  if [ -z $1 ];then
      echo "Please specify user@host.tld as the first switch to this script"
      return
  fi

  echo "Putting your key on $1... "

  KEYCODE=`cat $KEY`
  ssh -q $1 "mkdir ~/.ssh 2>/dev/null; chmod 700 ~/.ssh; echo "$KEYCODE" >> ~/.ssh/authorized_keys; chmod 644 ~/.ssh/authorized_keys"

  echo "Done!" 
}
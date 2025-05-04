#!/bin/bash

logger="./user_manager.log"
create_user() {

local username=$1
if id "$username" &>/dev/null; then
    echo "[$(date)] ERROR: User $username already exists. Choose another username." >> "$logger"
  else
    sudo useradd "$username"
    echo "[$(date)] INFO: User $username has been created." >> "$logger"
  fi
}

delete_user(){
    local username=$1   
    if id "$username" &>/dev/null; then
    sudo userdel "$username"
    echo "INFO: User $username deleted successfully." >> "$logger"
  else
    echo "ERROR: User $username does not exist." >> "$logger"
  fi
}
delete_user "userTest2"
create_user "userTest2"
delete_user "userTest2"
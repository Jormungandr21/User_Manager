#!/bin/bash

logger="./user_manager.log"
create_user() { 
    local username=$1
    local password=$2

    sudo useradd "$username"

    echo "User '$username' has been created" >> "$logger"
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

#!/bin/bash


create_user() { 
    local username=$1
    local password=$2

    sudo useradd "$username"

    echo "User '$username' has been created"
}

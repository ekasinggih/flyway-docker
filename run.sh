#!/bin/bash

if [ "${SSH_KEY}" != "null" ]; then
    eval $(ssh-agent -s)
    echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null    
    # echo command | ssh -4 -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST -L $LOCAL_PORT:$REMOTE_IP:$REMOTE_PORT -N
    echo command | ssh -4 -o StrictHostKeyChecking=no gitlab@35.240.214.245 -L 3306:35.240.194.151:3306 -N
else
    echo "SSH_KEY not found"
    exit 1
fi
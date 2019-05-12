#!/bin/bash

if [ "${SSH_KEY}" != "null" ]; then
    eval $(ssh-agent -s)
    echo "$SSH_KEY" | tr -d '\r' | ssh-add - > /dev/null
    echo exec ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST -L $LOCAL_PORT:$REMOTE_IP:$REMOTE_PORT -N
    exec ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST -L $LOCAL_PORT:$REMOTE_IP:$REMOTE_PORT -N
else
    echo "SSH_KEY not found"
    exit 1
fi
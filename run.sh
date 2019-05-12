#!/bin/bash

if [ "${SSH_KEY}" != "null" ]; then
    ssh-add < echo ${SSH_KEY}

    exec ssh -o StrictHostKeyChecking=no $SSH_USER@$SSH_HOST -L $LOCAL_PORT:$REMOTE_IP:$REMOTE_PORT -N
else
    echo "SSH_KEY not found"
    exit 1
fi
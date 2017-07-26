#!/bin/bash

export ANSIBLE_PY=ansible_python_interpreter=/usr/bin/python3
export ANSIBLE_HOST_KEY_CHECKING=False
export ANSIBLE_ROLES_PATH=roles/external

ansible-playbook -b -i inventory \
    -e host_group=dbservers -e user_group=berries create-user-group.yml

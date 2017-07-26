#!/bin/bash

FILES="ansible-vm-private_key
vm1-private_key
vm2-private_key
vm3-private_key
vm4-private_key"

for f in $FILES
do
    echo "Processing $f"
    cp /vagrant/$f ~
    chmod 600 ~/$f
done

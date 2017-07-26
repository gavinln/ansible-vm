## Manage users

1. Start up the main virtual machine

    ```
    vagrant up ansible-vm
    ```

2. Start up the four slave machines

    ```
    vagrant up vm1
    vagrant up vm2
    vagrant up vm3
    vagrant up vm4
    ```

3. Display the private keys

    ```
    vagrant ssh-config
    ```

4. Copy all the private keys to files in the root directory named

    ```
    copy-private-keys.bat
    ```

3. Login to the main VM

    ```
    vagrant ssh ansible-vm
    ```

4. Change to project root

    ```
    cd /vagrant
    ```

5. Copy private keys to home directory and change access

    ```
    ./setup-private-keys.sh
    ```

4. Change to the playbooks directory

    ```
    cd /vagrant/playbooks
    ```

5. List all the hosts

    ```
    ansible all -i inventory --list-hosts
    ```

6. List groups of hosts

    ```
    ansible all -i inventory -l webservers --list-hosts
    ansible all -i inventory -l dbservers --list-hosts
    ansible all -i inventory -l databases --list-hosts
    ansible all -i inventory -l all-servers --list-hosts
    ```

6. Set up ssh-agent

    ```
    killall ssh-agent
    eval `ssh-agent`
    ssh-add ~/ansible-vm-private_key
    ssh-add ~/vm1-private_key
    ssh-add ~/vm2-private_key
    ssh-add ~/vm3-private_key
    ssh-add ~/vm4-private_key
    ```

7. Setup environment variables for ansible

    ```
    export ANSIBLE_PY=ansible_python_interpreter=/usr/bin/python3
    export ANSIBLE_HOST_KEY_CHECKING=False
    export ANSIBLE_ROLES_PATH=roles/external
    ```

7. Connect to all hosts

    ```
    ansible all -i inventory -m ping -e $ANSIBLE_PY
    ```

8. Update all the hosts (will display unreachable on last step)

    ```
    ansible-playbook -b -i inventory -e $ANSIBLE_PY test-ubuntu-update.yml
    ```

9. Install roles from Ansible Galaxy

    ```
    ansible-galaxy install -r requirements.yml -p roles/external
    ```

10. Setup ntp on all machines

    ```
    ansible-playbook -b -i inventory -e $ANSIBLE_PY test-ntp-setup.yml
    ```

11. Setup docker on all machines

    ```
    ansible-playbook -b -i inventory -e $ANSIBLE_PY test-docker-setup.yml
    ```

12. Save public key

    ```
    cp ~/.ssh/authorized_keys /vagrant/playbooks/files/awaters.pub
    ```

13. Display users for only one host

    ```
    ansible-playbook -b -i inventory -e $ANSIBLE_PY -l dbservers test-playbook.yml
    ```

14 List all users in alphabetical order from all files (find duplicates)

    ```
    grep -h -F username vars/users-* | sort
    ```

14. Manage users - need to do this after groups as users refer to groups

    ```
    ./manage-users.sh
    ```




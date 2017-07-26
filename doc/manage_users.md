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

4. Change to the playbooks directory

    ```
    cd /vagrant/playbooks
    ```

5. Copy private keys to home directory and change access

    ```
    ./setup-private-keys.sh
    ```

6. List all the hosts

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
    ansible-playbook -b -i inventory test-ubuntu-update.yml -e $ANSIBLE_PY
    ```

9. Install roles from Ansible Galaxy

    ```
    ansible-galaxy install -r requirements.yml -p roles/external
    ```

10. Setup ntp on all machines

    ```
    ansible-playbook -b -i inventory test-ntp-setup.yml -e $ANSIBLE_PY
    ```

11. Setup docker on all machines

    ```
    ansible-playbook -b -i inventory test-docker-setup.yml -e $ANSIBLE_PY
    ```

12. Create ssh keys for all users

    ```
    ./create-ssh-keys.sh
    ```

13. Run in dry-run (check) mode only for dbservers. Will print err message
    (Either user must exist or you must...)

    ```
    ansible-playbook -b -i inventory -C create-user-group.yml \
        -e host_group=dbservers -e user_group=berries -e $ANSIBLE_PY
    ```

14. Create selected groups of users on selected hosts

    ```
    ./manage-users.sh
    ```




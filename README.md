# ansible-docker-vm

* Source code - [Bitbucket]
* Author - Gavin Noronha - <gavinln@hotmail.com>

[10]: https://bitbucket.org/gavinln/ansible-vm

## About

This project provides a [Ubuntu (16.04)][20] [Vagrant][30] Virtual Machine
(VM) with [Docker][40] installed using [Ansible][50]. It has multiple examples
of using Ansible to setup machines and also setup ssh certificates for
authentication.

[20]: http://releases.ubuntu.com/14.04/
[30]: http://www.vagrantup.com/
[40]: https://www.docker.com/
[50]: https://www.ansible.com/

## Running the VM

Make sure the hostmanager plugin is installed on Vagrant
https://github.com/devopsgroup-io/vagrant-hostmanager

1. Change to the root of the project

    ```
    cd ansible-vm
    ```

2. To start the virtual machine(VM) type

    ```
    vagrant up
    ```

3. Connect to the VM

    ```
    vagrant ssh ansible-vm
    ```

## [Manage users](doc/manage_users.md)

## Requirements

The following software is needed to get the software from github and run
Vagrant to set up the Python development environment. The Git environment
also provides an [SSH  client][200] for Windows.

* [Oracle VM VirtualBox][210]
* [Vagrant][220]
* [Git][230]

[200]: http://en.wikipedia.org/wiki/Secure_Shell
[210]: https://www.virtualbox.org/
[220]: http://vagrantup.com/
[230]: http://git-scm.com/

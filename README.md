# ansible-docker-vm

* Source code - Github
* Author - Gavin Noronha - <gavinln@hotmail.com>

[10]: https://github.com/gavinln/ansible-docker-vm

## About

This project provides a [Ubuntu (16.04)][20] [Vagrant][30] Virtual Machine
(VM) with [Docker][40] installed using [Ansible][50].

[20]: http://releases.ubuntu.com/14.04/
[30]: http://www.vagrantup.com/
[40]: https://www.docker.com/
[50]: https://www.ansible.com/

## Running the VM

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

## Using Docker images

1. Display docker images

    ```
    sudo docker images
    ```

2. Run a Docker image

    ```
    sudo docker run -ti --rm busybox:1.26.2
    ```

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
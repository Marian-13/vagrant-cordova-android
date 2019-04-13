### Setup Guide

1. Install [Vagrant](https://www.vagrantup.com/downloads.html) if you haven't done it yet

2. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) if you haven't done it yet

3. Install git if you haven't done it yet
  ```
  $ sudo apt install git
  ```

4. Clone repository and navigate to it
  ```
  $ git clone https://github.com/marian-13/vagrant-cordova-android
  $ cd vagrant-cordova-android
  ```

5. Start VM managed by Vargant
  ```
  $ vargant up
  ```

6. Connect to VM
  ```
  $ vagrant ssh
  ```

7. Get excited by automation!

### FAQ

- [**How to check whether VM is running?**](https://www.vagrantup.com/docs/cli/status.html)
  ```
  $ vagrant status
  ```

- [**How to shutdown VM?**](https://www.vagrantup.com/docs/cli/halt.html)
  ```
  $ vagrant halt
  ```

- [**How to add additional provision?**](https://www.vagrantup.com/docs/cli/provision.html)

  1. If you are going to use shell commands, then open `Vagrantfile` and add them inside `SHELL` heredoc
  ```Ruby
  config.vm.provision "shell", inline: <<-SHELL
    Your shell commands here...
    SHELL
  ```
  To avoid executing long-running tasks every time when provision is changed - make sure your shell commands are [idempotent](https://github.com/metaist/idempotent-bash#what-does-idempotent-mean)

  2. Run the following command
  ```
  $ vagrant provision
  ```

- **How can I delete 'wrong' provision?**

  1. Remove it from `Vagrantfile`!!!
  2. Then you possibly can delete it from VM manually or
  ```
  $ vagrant destroy
  $ vagrant up
  ```
  **TODO:** Check if better options are available


- **How `vagrant-cordova-android` was set up**
  1. Vim
  ```
  $ sudo apt install vim
  ```

  2. Folder
  ```
  $ mkdir vagrant-cordova-android
  $ cd vagrant-cordova-android
  ```
  3. VagrantBox: [Official Ubuntu 18.04 LTS (Bionic Beaver)](https://app.vagrantup.com/ubuntu/boxes/bionic64)
  ```
  $ vagrant init ubuntu/bionic64
  ```

- **Is it possible to up VM managed by Vargant from another VM created by VirtualBox (Nesting of virtual machines)?**

  [Only in specific cases](https://stackoverflow.com/questions/24620599/error-vt-x-not-available-for-vagrant-machine-inside-virtualbox)

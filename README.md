### Setup Guide

0. Connect to Internet

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

### Important!!!
- Vagrant runs provision scripts as `/root` by default. Specify `privileged: false` to run them as `/home/vagrant`.
- If you need to set a permanent variable - set it in `~/.profile`. (`~/.bashrc` variables are not visible during running of provision scripts **TODO:** why?)

### Best Practices
- Writing provision shell scripts try to inline their dependencies
- It is sometimes better to read command docs right in the command line before googling (e.g. `sdkmanager`)

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
  To avoid executing long-running tasks every time when provision is changed - make sure your shell commands are [idempotent](https://github.com/metaist/idempotent-bash#what-does-idempotent-mean)[(Another definition)](https://stackoverflow.com/questions/1077412/what-is-an-idempotent-operation)

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


- **How to change current user to `root`?**
  ```
  $ sudo -i
  ```

- **How to check if variable defined in file?**
  ```
  cat .bashrc | grep ANDROID_SDK_ROOT
  ```

- **How to check if folder included in `$PATH`?**
  ```
  echo $PATH | grep "/home/vagrant/android/platform-tools[:|$]"
  echo $PATH | grep "${ANDROID_HOME}/tools[:|$]"
  ```

- **How `vagrant-cordova-android` was configured?**
  1. Folder
  ```
  $ mkdir vagrant-cordova-android
  $ cd vagrant-cordova-android
  ```
  2. Vagrant Box: [Official Ubuntu 18.04 LTS (Bionic Beaver)](https://app.vagrantup.com/ubuntu/boxes/bionic64)
  ```
  $ vagrant init ubuntu/bionic64
  ```

  3. Example of adding [nvm](https://github.com/creationix/nvm) and [node](https://nodejs.org/en/) v10.15.3
    ```Ruby
    config.vm.provision 'shell', path: './provision/nvm.sh', args: '10.15.3', privileged: false
    ```
    ```
    $ touch provision/nvm.sh
    ```
    If `privileged: false` was not specified here, then `nvm` would have been installed for `root` user.

    Value of `agrs` is accessable in `provision/nvm.sh` as `$1`.

- **[How to pass multiple arguments to script?](https://stackoverflow.com/questions/15461898/passing-variable-to-a-shell-script-provisioner-in-vagrant#)**

- **Is it possible to up VM managed by Vargant from another VM created by VirtualBox (Nesting of virtual machines)?**

  [Only in specific cases](https://stackoverflow.com/questions/24620599/error-vt-x-not-available-for-vagrant-machine-inside-virtualbox)

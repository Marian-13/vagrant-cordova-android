### Prerequisites

1. Install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
3. Install git
```
$ sudo apt install git
```

### First time usage
```
$ git clone https://github.com/marian-13/vagrant-cordova-android
```

### Usage


### How `vagrant-cordova-android` was set up
0. Vim
```
$ sudo apt install vim
```

1. Folder
```
$ mkdir vagrant-cordova-android
$ cd vagrant-cordova-android
```
2. VagrantBox: [Official Ubuntu 18.04 LTS (Bionic Beaver)](https://app.vagrantup.com/ubuntu/boxes/bionic64)
```
$ vagrant init ubuntu/bionic64
```

### FAQ

1. Is it possible to up vagrant box from VM using VirtualBox?

[Quick asnwer: Only in specific cases](https://stackoverflow.com/questions/24620599/error-vt-x-not-available-for-vagrant-machine-inside-virtualbox)

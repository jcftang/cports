## Installation (of VirtualBox VM)

Prerequisites:

  - Oracle VirtualBox
  - Ruby
  - bundler gem

1. Clone the git repository

1. Go to the `deploy` directory

```bash
$ cd ./deploy
```

1. Use bundler to install the deployment Gemfile

```bash
$ bundle install
```

1. Create a basebox and add it to vagrant

```bash
$ vagrant basebox build 'scientificlinux-6.2-x86_64-netboot'
$ vagrant basebox export 'scientificlinux-6.2-x86_64-netboot'
$ vagrant box add 'sl62-x86_64' scientificlinux-6.2-x86_64-netboot.box
```

If you already have a basebox created you can skip the build and export
steps.

1. Start and provision the virtual machine

```bash
$ vagrant up
```

1. Get the ssh-config from vagrant (this should hopefully not change)

```bash
$ vagrant ssh-config
Host cports_test
  HostName 127.0.0.1
  User vagrant
  Port 2200
  UserKnownHostsFile /dev/null
  StrictHostKeyChecking no
  PasswordAuthentication no
  IdentityFile /Users/jtang/.vagrant.d/insecure_private_key
  IdentitiesOnly yes
```

1. Login to the virtual machine

```bash
$ vagrant ssh
```

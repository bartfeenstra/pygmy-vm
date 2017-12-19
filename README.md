# Pygmy VM

[![Build Status](https://travis-ci.org/bartfeenstra/pygmy-vm.svg?branch=master)](https://travis-ci.org/bartfeenstra/pygmy-vm)

This project provides a Virtual Machine for Amazee.io's
[Pygmy](https://docs.amazee.io/local_docker_development/pygmy.html). Specifically:
- Pygmy will not interfere with DNS resolvers on your host machine, but with those in the VM instead.
- Pygmy and Docker come pre-installed.

## Requirements
- [Vagrant](https://www.vagrantup.com/) >= 2.0.0
- [VirtualBox](https://www.virtualbox.org/) (other Vagrant providers are untested)

## Usage
Start the VM with `vagrant up --provider=virtualbox`.

After rebooting the VM, Pygmy must be started manually using `pygmy start`.

### SSH key
To configure the Pygmy SSH key, copy it to `/home/vagrant/.ssh/id_rsa` inside the VM.
 
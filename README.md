# Pygmy VM

[![Build Status](https://travis-ci.org/bartfeenstra/pygmy-vm.svg?branch=master)](https://travis-ci.org/bartfeenstra/pygmy-vm)

This project provides a Virtual Machine for Amazee.io's
[Pygmy](https://docs.amazee.io/local_docker_development/pygmy.html). Specifically:
- Ubuntu 16.04
- Pygmy, [Docker](https://www.docker.com/), and [Docker Compose](https://docs.docker.com/compose/) come pre-installed.
- On Linux, Pygmy tries to replace the host's DNS resolver. This is specific to dnsmasq, which was replaced with
  systemd-resolved in Ubuntu 16.10, making 16.04 LTS the latest release supported by Pygmy. Wrapping Pygmy inside a VM
  ensures compatibility on newer Ubuntu hosts, and prevents interference with the host's own DNS resolver.

## Requirements
- [Vagrant](https://www.vagrantup.com/) >= 2.0.0
- [VirtualBox](https://www.virtualbox.org/) (other Vagrant providers are untested)

## Usage
Start the VM with `vagrant up --provider=virtualbox`.

After booting the VM, Pygmy must be started manually using `pygmy up`.

### SSH key
To configure the Pygmy SSH key, copy it to `/home/vagrant/.ssh/id_rsa` inside the VM.
 
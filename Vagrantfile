Vagrant.require_version ">= 2.0.0"

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.box = "geerlingguy/ubuntu1604"
  config.vm.hostname = "pygmy-vm"
  config.vm.network :private_network,
    ip: "192.168.152.7"
  config.vm.synced_folder "./projects", "/pygmy-vm/projects",
    id: "default", :nfs => true, :mount_options => ["nolock,vers=3,udp"]

  config.vm.provision "shell",
    path: "./provision.sh",
    privileged: false,
    env: {
        "PYGMY_VM_USER" => "vagrant"
    }

  # Virtual Box-specific configuration.
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.memory = 2048
    vb.cpus = 2
  end
end

terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.0"
    }
  }
  required_version = ">= 0.14"
}

provider "proxmox" {
  pm_api_url = var.proxmox_host["pm_api_url"]
  pm_user = var.proxmox_host["pm_user"]
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "prox-vm" {
  count = length(var.hostnames)
  name = var.hostnames[count.index]
  target_node = var.proxmox_host["target_node"]
  vmid = var.vmid + count.index
  full_clone = true
  clone = "ubuntu-template"

  cores = 1
  sockets = 1
  vcpus = 1
  memory = 2048
  balloon = 2048
  boot =  "c"
  bootdisk = "virtio0"

  scsihw = "virtio-scsi-pci"

  onboot = false
  agent =  0
  cpu = "host"
  numa = true
  hotplug = "network,disk,cpu,memory"
  
  network {
    bridge = "vmbr0"
    model = "virtio"
  }
  
  ipconfig0 = "ip=${var.ips[count.index]}/24,gw=${cidrhost(format("%s/24", var.ips[count.index]), 1)}"


  disk {
    #id = 0
    type = "virtio"
    storage = "local-lvm"
    size = "5G"
  }


os_type = "cloud-init"

  connection {
    host = var.ips[count.index]
    user = var.user
    private_key = file(var.ssh_keys["priv"])
    agent = false
    timeout = "3m"
  }
}

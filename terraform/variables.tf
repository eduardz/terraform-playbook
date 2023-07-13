variable "proxmox_host" {
	type = map
    default = {
      pm_api_url = "https://192.168.1.200:8006/api2/json"
      pm_user = "root@pam"
      target_node = "brix"
    }
}

variable "vmid" {
	default     = 501
        description = "proxmox ID's"
}


variable "hostnames" {
  description = "proxmox VMs"
  type        = list(string)
  default     = ["kube-node01", "kube-node02", "kube-node01"]
}

variable "rootfs_size" {
	default = "2G"
}

variable "ips" {
  description = "VM's set IP Addreses"
  type        = list(string)
	default     = ["192.168.1.210", "192.168.1.211", "192.168.1.212"]
}

variable "ssh_keys" {
	type = map
    default = {
      pub  = "~/.ssh/id_rsa.pub"
      priv = "~/.ssh/id_rsa"
    }
}

variable "user" {
	default     = "ansible"
	description = "create user for OS"
}


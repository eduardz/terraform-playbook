# Setup template on Proxmox host 

wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
VM_ID="9000"
qm create 9000 --memory 2048 --net0 virtio,bridge=vmbr0 --sockets 1 --cores 2 --vcpu 2  -hotplug network,disk,cpu,memory --agent 1 --name ubuntu-template --ostype l26
qm importdisk $VM_ID jammy-server-cloudimg-amd64.img local-lvm
qm set $VM_ID --scsihw virtio-scsi-pci --virtio0 local-lvm:vm-$VM_ID-disk-0
qm set $VM_ID --ide2 local-lvm:cloudinit
qm set $VM_ID --boot c --bootdisk virtio0
qm set $VM_ID --serial0 socket
qm template $VM_ID
rm focal-server-cloudimg-amd64.img

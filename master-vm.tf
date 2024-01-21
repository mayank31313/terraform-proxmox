resource "proxmox_vm_qemu" "proxmox_vm_master" {
    name        = "kubemaster2"
    # target_node = "worker1"
    clone       = "packedtemplate"

    # clone = "provisionertemplate"
    target_node = var.target_node

    boot = "order=scsi0;net0"
    agent = 1

    bios = "seabios"
    # bios = "ovmf"
    
    # scsihw = "virtio-scsi-pci"
    scsihw = "virtio-scsi-single"

    cores = "4"
    memory = 4096
    full_clone = true

    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    os_type = "ubuntu"
    ciuser = "kubemaster"
    cipassword = "kubemaster"
    ipconfig0 = "ip=dhcp"
    nameserver = "192.168.46.200"
    sshkeys = file("/home/mayank31313/.ssh/id_proxmox_vm.pub")
}
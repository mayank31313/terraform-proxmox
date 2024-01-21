resource "proxmox_vm_qemu" "proxmox_vm_worker" {
    for_each = toset([
        "kubeworker1",
        # "kubeworker2"
    ])
    
    name        = each.key
    target_node = "worker1"
    clone       = "packedtemplate"

    boot = "order=scsi0;net0"
    agent = 1
    bios = "seabios"
    cores = "4"
    memory = 4096
    full_clone = true
    scsihw = "virtio-scsi-single"
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
    os_type = "ubuntu"
    ciuser = "kubeworker"
    cipassword = "kubeworker"
    ipconfig0 = "ip=dhcp"
    nameserver = "192.168.46.200"
    sshkeys = file("/home/mayank31313/.ssh/id_proxmox_vm.pub")
}
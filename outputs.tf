output "instance_ip_addr_master" {
    description = "Master IP: "
    value = proxmox_vm_qemu.proxmox_vm_master.*.default_ipv4_address
}

output "instance_ip_addr_worker" {
    description = "Worker IP: "
    value = [
        for k in proxmox_vm_qemu.proxmox_vm_worker: k.*.default_ipv4_address
    ]
}
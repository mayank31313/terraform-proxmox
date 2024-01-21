# Terrform

### To Do
Create credentials.auto.tfvars and add below variables to it

    proxmox_api_url = ""  # Your Proxmox IP Address
    proxmox_api_token_id = ""  # API Token ID
    proxmox_api_token_secret = "" # Token Secret

    target_node = ""

# Ansible - Installation of K3S

Variables for Ansible Playbook

    [k3scluster:vars]
    k3s_path=/etc/rancher/k3s
    k3s_token="" # K3S Token

    [k3scluster:vars]
    registry_username="" # Docker Registry Username
    registry_password="" # Docker Registry Password

    [kubemaster:vars]
    ansible_ssh_private_key_file="" # Private Key Path
    ansible_become=true
    ansible_become_password=kubemaster


    [kubeworker:vars]
    ansible_ssh_private_key_file="" # Private Key Path
    ansible_become=true 
    ansible_become_password=kubeworker
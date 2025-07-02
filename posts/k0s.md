---
title: "k0s"
date: 2022-08-23T13:47:43Z
title: k0s
---
Install k0s on premise between Ansible   
---

![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSptfiRacpBB1Bjlz8sYKT4I0XeSW7mHAAtywLF7-K35jtbI4-i9z82c9Cy60NDVanjkfI)

Hello everyone. I think about kubernetes and is more usefull K0S for on-prem, and I began my small installations in PROXMOX 

1.) Create a CT or VM. In my case CT , with "debian-10-turnkey-ansible_16.1-1_amd64.tar.gz"
2.) We will clone  https://github.com/movd/k0s-ansible.git from github

```shell
git clone https://github.com/movd/k0s-ansible.git
```
3.) Go to inventory 

```shell 
cd k0s-ansible/inventory
```
4.)  create directory Multipass

```shell
mkdir Multipass
```
5.) Create inventory.yml, where you define  masters workers in k0s

```shell
--
all:
  children:
    initial_controller:
      hosts:
        k0s-1:
    controller:
      hosts:
        k0s-2:
        k0s-3:
    worker:
      hosts:
        k0s-1:
        k0s-2:
        k0s-3:
  hosts:
    k0s-1:
      ansible_host: 192.168.100.155
    k0s-2:
      ansible_host: 192.168.100.156
    k0s-3:
      ansible_host: 192.168.100.157
  vars:
    ansible_user: k0s
```
6.) Modify groups_vars, define root or k0s user 

In /k0s-ansible/inventory/multipass/group_vars 

```shell
---
# Use this to overwrite the role defaults
 k0s_version: v1.22.4+k0s.1
 ansible_user: root
 artifacts_dir: "{{ inventory_dir }}/artifacts"
 systemd_dest: /etc/systemd/system
 k0s_binary_dest: /usr/local/bin/k0s
 k0s_config_dir: /etc/k0s
 k0s_data_dir: /var/lib/k0s
 k0s_libexec_dir: /usr/libexec/k0s/
 k0s_use_custom_config: false
```

7.) Run command 
```shell
ansible-playbook site.yml -i inventory/multipass/inventory.yml
```
8.) Enjoy.... :grinning:





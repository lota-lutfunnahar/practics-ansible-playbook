## Practics Ansible Playbook
### Test Run     
   
```
ansible-playbook -i vyos.example.net, -u ansible -k -e ansible_network_os=vyos.vyos.vyos first_playbook_ext.yml

```

 
### Config Setting File  
/etc/ansible/hosts
```
[ansible_clients]
#192.168.52.121 ansible_ssh_pass=redhat ansible_ssh_user=root
192.168.10.238 ansible_ssh_pass=arafat ansible_ssh_user=root
#202.181.14.35 ansible_ssh_pass=ansible ansible_ssh_user=ansible
```

### Ansible.cfg Location

ansible.cfg location is /etc/ansible/ansible.cfg

```
202.181.14.35
[all:vars]
ansilble_ssh_pass=ansible
ansible_become_pass=ansible
```

```
[defaults]
inventory = hosts
stdout_callback = debug
#ansible_python_interpreter="/bin/python3.8"
ansible_python_interpreter: /usr/bin/python3.8
```

# practics-ansible-playbook
### test run

`ansible-playbook -i vyos.example.net, -u ansible -k -e ansible_network_os=vyos.vyos.vyos first_playbook_ext.yml`

### config setting file 
`/etc/ansible/hosts`

`[ansible_clients]
#192.168.52.121 ansible_ssh_pass=redhat ansible_ssh_user=root
192.168.10.238 ansible_ssh_pass=arafat ansible_ssh_user=root
#202.181.14.35 ansible_ssh_pass=ansible ansible_ssh_user=ansible`

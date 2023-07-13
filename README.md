Role Name
=========

Ansible call terraform scripts  \

Requirements
------------

Ansible 2.10+ \
Terraform 1.2+ \

Needed modules to download from internet: \
ansible-galaxy collection install community.general \
ansible-galaxy collection install cloud.terraform \
(The community.general.terraform module)
https://docs.ansible.com/ansible/latest/collections/community/general/terraform_module.html


Example Playbook
----------------

├── ansible.cfg
├── apply.yml
├── destroy.yml
├── inventory
├── proxmox.template.sh
├── README.md
├── roles
│   └── terraform-role
│       └── tasks
│           └── main.yml
└── terraform
    ├── \
    ├── main.tf
    └── variables.tf


export PM_PASS='proxmox-PVE-pass'


Initiate ansible role for terraform: \
`ansible-playbook -i inventory apply.yml  -vvvv`

Remove Terraform deployment \
`ansible-playbook -i inventory destroy.yml  -vvvv`

License
-------

BSD


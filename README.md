# security-patching
Website:
Application Name: Secure and Centralized Ubuntu Patching with Ansible

Project Layout
```text
Project Layout
security-patching/
├── ansible.cfg
├── hosts.ini
├── playbooks/
│   └── security-updates.yml
├── roles/
│   └── patching/
│       └── tasks/
│           ├── check_security.yml
│           ├── check_full.yml
│           ├── upgrade_security.yml
│           ├── upgrade_full.yml
│           ├── check_reboot.yml
│           └── reboot_if_needed.yml
├── host_vars/
│   └── <hostname>/
│       └── vault.yml
├── .vault_pass.txt
├── generate_vault.sh
└── generate_vault.txt
```


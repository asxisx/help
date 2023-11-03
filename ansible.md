# Ansible


## Modules

### 1. yum [(javatpoint)](https://www.javatpoint.com/ansible-yum) [(Ansible)](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/yum_module.html)

#### Important Commands

---

##### yum update -y

```bash
yum:
  name: "*"
  state: latest

# To exclude a specific package
name: "*"
  state: latest
  exclude: git*
```
---
#### yum install git

```bash
yum:
  name: git
  state: present/installed  # both are same


# For specific version
yum:
  name: git-1.8.3.1-6.el7
  state: present

```

---

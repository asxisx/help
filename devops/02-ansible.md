# Ansible

## In a Nutshell
Ansible is IaC platform allow user to provision and manage resources. It doesn't really need any tool to be installed on the machine because all execution is done using ssh.

- We can execute single commands using `ansible all --key-file ~/.ssh/ansible -i inventory -m ping`
- We can execute single commands with elevated access using `ansible all -m apt -a update_cache=true --become --become-user <username> --ask-become-pass`

### We need `inventory` file to store all the machine ips where we want to execute the command.
### We need `ansible.cfg` for storing configurations like _ssh private key location_, _inventory_.
### A single command executed is usually called a ***play***.
### When multiple commands are executed together to achieve something or to complete a task os called ***playbook***.
Because playbook will contain multiple commands, we need a file which is usually a `.yml` file.
### Variables are defined like `"{{ variable_name }}"` this.
    Variables can be defined in inventory like this:
```bash
10.0.1.20 variable_name=tom
```
### ***Roles*** helps cleaning up the playbooks
- Create a directory named `roles` (We will create all the roles inside this folder)
- Create a role `mkdir roles/db`
- We can make a `task` inside every role like `mkdir roles/db/tasks`
  - Now these are called _taskbooks_
 
### Host Variables are used to store multiple variables
- Create a directory `host_vars` and then create `host-ip.yml` and then store all the variables.
    


---

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

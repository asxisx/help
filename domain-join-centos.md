# How to Join Domain in CentOS

```bash
yum install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python -y
realm join --user="username" "machinename.domainname.com"
cat etc/hosts #this file should update the entry in itself.
realm list
cat /etc/sssd/sssd.conf > /etc/sssd/sssd.conf.backup
vim /etc/sssd/sssd.conf
# use_fully_qualified_names    =    FALSE
# fallback_homedir            =    /home/%u
```

## To give access to users and groups

- this file contains how and who can access what resources.
`vim /etc/sudoers`

    
- to add a group from ad, so that members of those group can access it. Go to
```bash
## Allow people in group wheel to run all commands
%wheel All=(ALL)    ALL
%Admins_P1 ALL=(ALL)    ALL
```



## To leave the domain
`realm leave`


## Bash Script to add machine to a AD

```bash
# Install Packages
sudo yum install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python -y

# Add the machine to domain
sudo echo $password | sudo realm join --user=<username> AD01.example.com # Replace $password with actual password and replace AD01.example.com as the machine FQDN

# Add the details to hosts file
sudo bash -c 'echo "<ad-server-ip>    AD01.example.com   AD01" >> /etc/hosts' #This will run the whole command as a superuser

# Change sssd config for users
sudo cp /etc/sssd/sssd.conf /etc/sssd/sssd.conf.backup
sudo sed -i 's/^use_fully_qualified_.*/use_fully_qualified_names = False/' /etc/sssd/sssd.conf
sudo sed -i 's/^fallback_homedir = \/home\/%u@%d/fallback_homedir = \/home\/%u@' /etc/sssd/sssd.conf # Only if required
cat etc/hosts
realm list

# Add Users or Groups to sudoers

sudo touch /etc/sudoers.d/ashish-j189
sudo bash -c 'echo "jason ALL=(ALL)   ALL" >> /etc/sudoers.d/access' # User will be added
sudo bash -c 'echo "%L2-Admins ALL=(ALL)   ALL" >> /etc/sudoers.d/access' # Group will be added

# Restart sssd to apply the changes
sudo systemctl restart sssd


```

---
## Other Meaningful Information
`id <username>` - to check user
`systemctl status sssd`- this service restart can solve issues sometimes.

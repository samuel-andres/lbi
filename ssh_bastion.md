# Set up ssh bastion host

**Pre-requisites**:
- ssh-agent running

To run ssh-agent add `eval "$(ssh-agent -s)" &> /dev/null` to your shell script. (e.g.: ~/.zshrc)

`~/.ssh/config`:

```
# Bastion host
Host bastion
 Hostname XX.XXX.XX.XXX
 IdentityFile ~/.ssh/<keypair-file>
 User user
 ForwardAgent yes
 AddKeysToAgent yes

# Instance on private subnet
Host instance
 Hostname XX.XXX.XX.XXX
 User user
 ProxyJump bastion
```

Example of usage: `ssh instance`
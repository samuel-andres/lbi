# Set up ssh for multiple bitbucket accounts

`~/.ssh/config`:

```
# Bitbucket for acc1
Host bb.acc1
 HostName bitbucket.org
 IdentityFile ~/.ssh/<acc1_keypair>

# Bitbucket for acc2
Host bb.acc2
 HostName bitbucket.org
 IdentityFile ~/.ssh/<acc2_keypair>
```

Example of usage: `git clone git@bb.acc1:repo.git` or `git clone git@bb.acc2:repo.git`
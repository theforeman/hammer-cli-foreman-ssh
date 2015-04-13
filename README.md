Hammer CLI - Foreman SSH
========================

SSH plugin for hammer

Install
-------

```bash
$ git clone git@github.com:theforeman/hammer-cli-foreman-ssh.git
$ cd hammer-cli-foreman-ssh
$ rake install
$ cd ..
```

register the plugin in the hammer configuration directory

```
cat > ~/.hammer/cli.modules.d/foreman_ssh.yml <<EOF
:foreman_ssh:
    :enable_module: true
    :require: 'foreman'
EOF
```

and enjoy

```
$ hammer host ssh --command 'yum upgrade -q -y bash' --user root --search='facts.bashpocalypse = not_vulnerable' --no-prompt
About to execute: yum upgrade -y bash as user root
on the following 3 hosts: host1, host2, host3
[host1]  No Packages marked for Update
[host2]  No Packages marked for Update
[host3]  No Packages marked for Update
```

Usage Options
-------------


```
$ hammer host ssh --help
  Usage:
    hammer host ssh [OPTIONS]

Options:
 --[no-]dns                    Use DNS to resolve IP addresses
 --[no-]prompt                 Prompt for users approval
 -c, --command COMMAND         Command to execute
 -h, --help                    print help
 -i, --identity_file FILE      Selects a file from which the identity (private key) for public key authentication is read
 -s, --search FILTER           Filter hosts based on a filter
 -u, --user USER               Execute as user
                               Default: "ohad"
```

License
-------
This project is licensed under the GPLv3+.

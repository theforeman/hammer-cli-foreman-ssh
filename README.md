Hammer time
===========

the plugin for hammer

Install
-------

Either use ```specific_install``` (doesn't work on ruby 1.8)

```bash
$ gem instal specific_install
$ gem specific_install -l 'mbacovsky/hammer-cli-time'
```

or do it the traditional way

```bash
$ git clone git@github.com:theforeman/hammer-cli-foreman-ssh.git
$ cd hammer-cli-foreman-ssh
$ rake install
$ cd ..
```

register the plugin in the hammer config

```yaml
:modules:
    - hammer_cli_foreman_ssh
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
$ hammer host host --help
  Usage:
    hammer host ssh [OPTIONS]

Options:
 --[no-]dns                    Use DNS to resolve IP addresses
 --[no-]prompt                 Prompt for users approval
 -c, --command COMMAND         Command to execute
 -h, --help                    print help
 -s, --search FILTER           Filter hosts based on a filter
 -u, --user USER               Execute as user
                               Default: "ohad"
```

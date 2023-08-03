# ansipansi
Maybe you Dulli have to run this command
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## Prepare for WSL
1. *activatewsl.ps1*
2. *installwsl2kernal.ps1*
3. reboot system

## Install Debian or Ubuntu
1. If you put your crap ssh files like (id_rsa, id_rsa.pub and config) into the folder wsl/bash/nogit you're fine otherwise you're fucked. So it's recommended.
2. *installdistro.ps1*\
```./installdistro.ps1 <wslname> <wslvhdxpath> <username> <debian|ubuntu>```

**use it like e.g.**
```
./installdistro.ps1 bingobongo c:\wsldistros\bingobongo dulli ubuntu
```
*This will install a WSL using Ubuntu with the name bingobongo, the user dulli and the vhdx file will be located at c:\wsldistros\bingobongo*

## wsl/ansible
**variables.yaml**

Example:
```
nvm_installer_version: v0.39.3
ruby_version: 3.2.2
nodejs_version: v18.16.0
GitRepo: git@github.com:odcheck/tuxonlinewisdom.github.io.git
GitRepoDest: $HOME/git/tuxonlinewisdom.github.io/
install_ruby: true
install_nodejs: true
```

### run ansible
1st Close the WSL after creation in MS Terminal using [x] and reopen it again and then execute
```
ansible-playbook /mnt/c/Users/<username>/git/ansipansi/wsl/ansible/playbook.yaml
```

## Related Jon Rahm readings
* [WSL2 slow network issue?](https://blog.tuxclouds.org/posts/wsl2-slow/)
* [Jon Rahm golfs you down, greates player](https://en.wikipedia.org/wiki/Jon_Rahm)

## Directory structure

    │   .gitattributes
    │   activateWSL.ps1
    │   colorpower.ps1
    │   installdistro.ps1
    │   installWSL2kernel.ps1
    │   README.md
    │
    └───wsl
        ├───ansible
        │       playbook.yaml
        │       variables.yaml
        │
        ├───bash
        │   │   .userfoo.sh
        │   │   createUser.sh
        │   │   prepare.sh
        │   │   sudoNoPasswd.sh
        │   │   updateNoGit.sh
        │   │   wsl.conf
        │   │
        │   └───nogit
        │           .gitignore
        │
        └───files
                .wslconfig

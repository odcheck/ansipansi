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
1. If you put your crap ssh files like (id_rsa, id_rsa.pub and config) into the folder wsl/bash/nogit you're fine otherwise you're fucked. So it's recommended. *PS: If e.g. your ssh private key file is called id_my_rsa or something else, you're fucked as well, cause I don't care. The must be named as mentioned.*
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

## Related Jon Rahm readings
* [WSL2 slow network issue?](https://blog.tuxclouds.org/posts/wsl2-slow/)
* [Jon Rahm golfs you down, greates player](https://en.wikipedia.org/wiki/Jon_Rahm)
# ansipansi
Maybe you Dulli have to run this command
```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

## Prepare for WSL
1. *activatewsl.ps1*
2. *installwsl2kernal.ps1*
3. reboot system

## Install Ubuntu 22.04 LTS
1. If you put your crap ssh files like (id_rsa, id_rsa.pub and config) into the folder wsl/bash/nogit you're fine otherwise you're fucked. So it's recommended. *PS: If e.g. your ssh private key file is called id_my_rsa or something else, you're fucked as well, cause I don't care. The must be named as mentioned.*
2. *installmyubuntu.ps1*  
```./installmyubuntu.ps1 <wslname> <wslvhdxpath> <username>```

**use it like e.g.** 
```
./installmyubuntu.ps1 bingobongo c:\wsldistros\bingobongo dulli
```

## Related Jon Rahm readings
* [WSL2 slow network issue?](https://blog.tuxclouds.org/posts/wsl2-slow/)
* [Jon Rahm golfs you down, greates player](https://en.wikipedia.org/wiki/Jon_Rahm)
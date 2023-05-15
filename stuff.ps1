Param (
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$wslname,
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$wslvhdxpath,
[Parameter(Mandatory=$True)][ValidateNotNull()][string]$username
)

if (-not(Test-Path -Path $Env:windir\temp\wslprep\Ubuntu.appx -PathType Leaf)) { 
    Write-Output "Downloading the Ubuntu 22.04 LTS appx installer, this could take a while..."
    Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile $Env:windir\temp\wslprep\Ubuntu.appx -UseBasicParsing    
    }
Copy-Item $Env:windir\temp\wslprep\Ubuntu.appx $Env:windir\temp\wslprep\$wslname.zip
Expand-Archive $Env:windir\temp\wslprep\$wslname.zip $Env:windir\temp\wslprep\x64
Move-Item -Path $Env:windir\temp\wslprep\x64\*_x64.appx -Destination $Env:windir\temp\wslprep\x64\$wslname.zip
Expand-Archive $Env:windir\temp\wslprep\x64\$wslname.zip $Env:windir\temp\wslprep\x64\$wslname

if (-Not (Test-Path -Path $wslvhdxpath)) {
    mkdir $wslvhdxpath
}
Write-Output "Install Ubuntu 22.04 LTS with VHDX path $wslvhdxpath and WSL installation name $wslname"
wsl --import $wslname $wslvhdxpath $Env:windir\temp\wslprep\x64\$wslname\install.tar.gz

Remove-Item -r $Env:windir\temp\wslprep\x64\

# Update the system
wsl -d $wslname -u root bash -ic "apt update && apt upgrade -y && apt autoremove -y"

# create your user and add it to sudoers
wsl -d $wslname -u root bash -ic "./bash/createUser.sh $username ubuntu"

# ensure WSL Distro is restarted when first used with user account
wsl -t $wslName

if ($installAllSoftware -ieq $true) {
    wsl -d $wslname -u root bash -ic "./scripts/config/system/sudoNoPasswd.sh $username"
    wsl -d $wslname -u root bash -ic ./scripts/install/installBasePackages.sh
    wsl -d $wslname -u $username bash -ic ./scripts/install/installAllSoftware.sh
    wsl -d $wslname -u root bash -ic "./scripts/config/system/sudoWithPasswd.sh $username"
}


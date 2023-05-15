# create wslprep directory if it does not exists
if (-Not (Test-Path -Path $Env:windir\temp\wslprep)) { $dir = mkdir $Env:windir\temp\wslprep }

curl.exe -L --output $Env:windir\temp\wslprep\wsl_update_x64.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

.$Env:windir\temp\wslprep\wsl_update_x64.msi /quiet
wsl --set-default-version 2

Remove-Item $Env:windir\temp\wslprep\wsl_update_x64.msi
# ansipansi

## WSL2 very slow on download speed on my private desktop using Windows 11 Pro
First of all, I am using a USB 3 attached WLAN Adapter, it works fine outside of the WSL.  
I figured out, that I should disable large packages using the control panel.  
But I could not see the vEthernet (WSL) adapter in my windows control panel.  
I've checked if it is there using ```ipconfig.exe /all```

### Solution

```
Disable-NetAdapterBinding -Name "vEthernet (WSL)" -ComponentID ms_tcpip6 -IncludeHidden # disable ipv6
Disable-NetAdapterLso -Name "vEthernet (WSL)" -IncludeHidden # Seems to disable the large packet. Didn't tested it since mine was already disabled

Get-NetAdapterBinding -IncludeHidden -Name "vEthernet (WSL)" # Check if ipv6 was disabled
Get-NetAdapterAdvancedProperty -IncludeHidden -Name "vEthernet (WSL)" # Check if large packet was disabled
```

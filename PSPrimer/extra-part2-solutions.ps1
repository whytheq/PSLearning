#requires -version 5.1
Return 'This is a reference script file, not something you run.'

#Question 1
HKLM and HCKU


#Question 2
dir Cert:\LocalMachine\root | Measure-Object


#Question 3
Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name registeredowner, registeredorganization



#Question 4
dir function: | measure


#Question 5
dir HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | select PSChildName


#Question 6
$ro = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name RegisteredOrganization
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name RegisteredOrganization -Value PSPrimer -PassThru
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -Name RegisteredOrganization -Value $ro -PassThru


#Question 7
Registry


#Question 8
dir Cert:\CurrentUser -Recurse -CodeSigningCert


#Question 9
$env:path -split ";"


#Question 10
New-Item -Path HKCU: -Name 'PowerShell Training'
Set-ItemProperty -Path 'HKCU:\PowerShell Training' -Name Name -Value $env:USERNAME
Set-ItemProperty -Path 'HKCU:\PowerShell Training' -Name Computername -Value $env:COMPUTERNAME
Set-ItemProperty -Path 'HKCU:\PowerShell Training' -Name Date -Value (Get-Date).ToShortDateString()
Get-Item 'HKCU:\PowerShell Training'


#Question 11
Remove-Item 'HKCU:\PowerShell Training'


#Question 12
New-PSDrive -Name Download -PSProvider FileSystem -Root $env:userprofile\downloads


#Question 13
dir function: | where { -not $_.CmdletBinding }


#Question 14
dir WSMan:\localhost\Service\DefaultPorts | select Name, Value


#Question 15
Set-Item -Path WSMan:\localhost\Client\Auth\Digest -Value $false

#An alternative to modifying settings using the WSMan: PSDrive is to use one of the WSManInstance cmdlets:

Set-WSManInstance -ResourceURI winrm/config/client/auth -ValueSet @{Digest=$False}


#Question 16
New-Item -Path env: -Name Pictures -Value $env:userprofile\pictures


#Question 17
New-ItemProperty -Path HKCU:\Environment -Name Pictures -Value $env:userprofile\pictures


#Question 18
Copy-Item HKCU:\Environment -Destination HKCU:\EnvBackup -PassThru


#Question 19
Remove-ItemProperty -Path HKCU:\Environment -Name Pictures
New-ItemProperty -Path HKCU:\Environment -Name Pictures -Value '%USERPROFILE%\Pictures' -PropertyType ExpandString


#Question 20
Get-ItemProperty -Path HKCU:\Environment | select * -exclude PS* | Export-Csv -Path c:\MyEnv.csv -NoTypeInformation


#Question 21
dir Cert:\ -Recurse -ExpiringInDays 0 | Select-Object -Property FriendlyName, NotAfter, Issuer, Subject, @{Name = "Path"; Expression = { Join-Path -Path CERT: -ChildPath (Convert-Path $_.pspath) } }


#Question 22
$h = Get-PSDrive | Group-Object { $_.provider.name } -AsHashTable -AsString
$h.FileSystem


#Question 23
New-Item -Path "$env:temp\a\b\c\d\e\f" -ItemType Directory


#Question 24
New-Item -Path $env:temp\foo\bar\xyz -ItemType Directory
New-Item -Path $env:temp\foo\bar\xyz\data.txt -ItemType File



#Question 25
Start-Transaction
New-Item -Path HKLM:\SOFTWARE -Name 'PSPrimer' -UseTransaction
New-Item -Path HKLM:\SOFTWARE\PSPrimer -Name 'Data' -UseTransaction
New-ItemProperty -Path HKLM:\SOFTWARE\PSPrimer\Data -Name version -Value 1 -PropertyType String -UseTransaction
New-ItemProperty -Path HKLM:\SOFTWARE\PSPrimer\Data -Name random -Value (Get-Random -Minimum 10 -Maximum 99) -PropertyType dword -UseTransaction
New-ItemProperty -Path HKLM:\SOFTWARE\PSPrimer\Data -Name free -Value (Get-PSDrive C).Free -UseTransaction
Complete-Transaction



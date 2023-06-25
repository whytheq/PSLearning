#requires -version 5.1
Return 'This is a reference script file, not something you run.'

#Question 1
Get-Command -CommandType function | Measure-Object


#Question 2
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $env:computername | Select-Object *


#Question 3
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $env:computername | Select-Object PSComputername, LastBootUpTime, @{Name = "Uptime"; Expression = { (Get-Date) - $_.LastBootUpTime } }


#Question 4
New-PSDrive -Name Docs -PSProvider FileSystem -Root $env:USERPROFILE\documents


#Question 5
$s = "powershell"
$arr = $s.ToCharArray()
$arr[-1.. - $arr.count] -join ""



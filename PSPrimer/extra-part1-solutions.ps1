#requires -version 5.1
Return 'This is a reference script file, not something you run.'

#Question 1
Get-Service -DisplayName Windows*


#Question 2
Get-Eventlog -List


#Question 3
Get-Command -Verb Remove


#Question 4
Restart-Computer


#Question 5
Get-Module -ListAvailable


#Question 6
Restart-Service bits -PassThru


#Question 7
Get-ChildItem -Path $env:temp -File -Recurse


#Question 8
Get-Acl -Path C:\windows\notepad.exe | Format-List

# As an alternative, you could use the pipeline and Select-Object

Get-Acl -path C:\Windows\notepad.exe | Select-Object -expandproperty access


# Or get the string version:

Get-Acl C:\windows\notepad.exe | Select-Object -expandproperty accesstostring



#Question 9
help about_regular_expressions


#Question 10
Get-EventLog -LogName System -Newest 10 -EntryType Error


#Question 11
Get-Command -Module PSReadline -Verb get


#Question 12
$PSVersionTable


#Question 13
powershell -noprofile


#Question 14
Get-Alias | Measure-Object

# you could get more granular with a command like:

Get-Alias | Measure-Object | Select-Object -ExpandProperty count

#Question 15
Get-Process | Where-Object { $_.WorkingSet -ge 50MB } | Sort-Object -Property workingset -Descending


#Question 16
$cut = (Get-Date).AddHours(-24)
Get-ChildItem -Path $env:TEMP -File -Recurse | Where-Object { $_.LastWriteTime -ge $cut } |
Select-Object -Property Fullname, Length, LastWriteTime



#Question 17
$cut = (Get-Date).AddDays(-90)
$files = Get-ChildItem -Path C:\users\jeff\Documents -File -Recurse | Where-Object { $_.length -ge 1MB -AND $_.LastWriteTime -le $cut }
$files | Select-Object Fullname, Length, CreationTime, LastWriteTime | Export-Csv myfiles.csv



#Question 18
Get-ChildItem -Path $env:temp -File -Recurse | Group-Object -Property Extension -NoElement | Sort-Object -Property Count -Descending


#Question 19
Get-Process -IncludeUserName | Where-Object { $_.Username -eq "$($env:USERDOMAIN)\$($env:USERNAME)" } | Export-Clixml myprocs.xml

# ou could also have invoked the native `whoami` command and used the result:

Get-Process -IncludeUserName | Where-Object {$_.Username -eq (whoami)} | Export-Clixml -Path myprocs.xml


#Question 20
Import-Clixml .\myprocs.xml | Sort-Object -Property Company | Format-Table -GroupBy company


#Question 21
for ($i = 1; $i -le 10; $i++) {
  $x = Get-Random -Maximum 50 -Minimum 1
  $x * $x
}

# you could also use the range operator to get the numbers 1 to 10 and do something for each number.

1..10 | foreach {
 $x = Get-Random -Maximum 50 -Minimum 1
 $x * $x
 }



#Question 22
Get-EventLog -list |
Select-Object -Property MaximumKilobytes, MinimumRetentionDays, @{Name = "Count"; Expression = { $_.entries.count } }, LogDisplayname |
ConvertTo-Html -PreContent "<H1>$($env:computername)</H1>" | Out-File -FilePath Eventlog.html

#In PowerShell 7, you would need to use Get-WinEvent, which has different property names. You might use an expression like this:

Get-WinEvent -listlog * |
Select-Object -Property LogName,LogMode,RecordCount,
@{Name="MaxSizeMB";Expression={$_.MaximumSizeInBytes/1mb -as [int]}} |
ConvertTo-Html -PreContent "<H1>$($env:computername)</H1>" -title "Event Log Report" | 
Out-File -FilePath Eventlog.html


#Question 23
Find-Module -Tag teaching -Repository PSGallery


#Question 24
Get-Service | Where-Object status -EQ 'running' | Select-Object -Property * -ExcludeProperty *Services* | ConvertTo-Json | Set-Content running.json
Get-Content services.json | ConvertFrom-Json


#Question 25
Test-NetConnection -ComputerName localhost -CommonTCPPort HTTP



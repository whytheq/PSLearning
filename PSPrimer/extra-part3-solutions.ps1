#requires -version 5.1
Return 'This is a reference script file, not something you run.'

#Question 1
$arr = 1..15
$arr[4]



#Question 2
$arr = @()
1..10 | ForEach-Object { $arr += (Get-Random -Minimum 10 -Maximum 100) }
$arr | Measure-Object -Sum


#Question 3
$h = @{
  Computername = $env:computername
  PSVersion    = $PSVersionTable.PSVersion
  Date         = (Get-Date).ToShortDateString()
}

$h


#Question 4
$h.add("Name", @("Bits", "WinRM"))
$h.Remove("date")
$h.remove("psversion")
Get-Service @h


#Question 5
$h = [ordered]@{
  Computername = $env:computername
  Services     = (Get-Service | Where-Object { $_.status -eq 'running' })
  Processes    = (Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5)
  TempSize     = (Get-ChildItem -Path $env:temp -File -Recurse | Measure-Object -Property length -Sum).sum
}

New-Object -TypeName PSObject -Property $h


#Question 6
[pscustomobject]@{
  Computername = $env:computername
  Services     = (Get-Service | Where-Object { $_.status -eq 'running' })
  Processes    = (Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5)
  TempSize     = (Get-ChildItem -Path $env:temp -File -Recurse | Measure-Object -Property length -Sum).sum
}



#Question 7
Get-Eventlog -list -computername $env:computername |
Where-Object { $_.entries.count -gt 0 } |
Select-Object -Property Log, MaximumKilobytes,
@{Name = "Entries"; Expression = { $_.entries.count } },
@{Name = "Computername"; Expression = { $_.machinename } }

# In PowerShell 7.x, since Get-EventLog is deprecated, you might have come up with an answer like this using Get-WinEvent.

Get-Winevent -ListLog * |
Where-Object {$_.recordcount -gt 0} |
Select-Object -Property LogName,Maximum*,RecordCount,
@{Name="Computername";Expression={$env:COMPUTERNAME}}


#Question 8
Get-ChildItem $env:temp -File -Recurse |
Group-Object -Property extension |
Select-Object Name, Count,
@{Name = "Size"; Expression = { ($_.group | Measure-Object -Property length -Sum).sum } }


#Question 9
$arr = "a", "b", "c", "d", "e"
$x = $arr | Get-Random -Count 1
Switch ($x) {

  "a" { "alpha" }
  "b" { "bravo" }
  "c" { "charlie" }
  "d" { "delta" }
  "e" { "echo" }
}


#Question 10
$text = "PowerShell Forever"
$arr = $text.ToCharArray()
$arr[$($text.length)..0] -join ""

# An alternative would be to use the -Split operator and turn the string into an alphanumeric array.

$text = "PowerShell Forever"
$sort = $text -split "" | Sort-Object
$sort -join ""


#Question 11
$h = Get-Service | Group-Object starttype -AsHashTable -AsString
$h


#Question 12
$h.Disabled[-1].DisplayName


#Question 13
1..50 | where { $_ % 2 -eq 0 }


#Question 14
1..5 | ForEach-Object -Begin { $i = 0 } -Process { $i += 5 } -End { $i }


#Question 15

Get-Process | Where-Object { $_.Starttime } | sort starttime |
Select-Object -First 25 -Property ID, Name, StartTime,
@{Name = "Runtime"; Expression = { (Get-Date) - $_.starttime } },
Path


#Question 16
10..100 | Get-Random -Count 25 | foreach { $_ * 3 } |
Measure-Object -Sum -Average -Maximum -Minimum


#Question 17
New-Alias np notepad.exe -Description "user-defined"
New-Alias tz tzutil.exe -Description "user-defined"
New-Alias ct control.exe -Description "user-defined"

Get-Alias np, tz, ct | select Name,
@{Name = "Value"; Expression = { $_.ResolvedCommandName } }, description |
ConvertTo-Json | Out-File c:\work\myaliases.json

dir alias:\ -Include np, tz, ct -Recurse | Remove-Item

$in = Get-Content C:\work\myaliases.json | ConvertFrom-Json
$in | New-Alias -Description "user-defined" -PassThru


#Question 18
dir $env:temp -Recurse -file | where { ($_.length -lt 100) -OR ($_.length -gt 1MB) }


#Question 19
$filename = "$(Get-Date -Format filedate)_$($env:computername).xml"
$file = Join-Path -Path $env:temp -ChildPath $filename

dir $env:temp -Recurse -file |
where { $_.length -lt 100 -OR $_.length -gt 1MB } |
ConvertTo-Xml -As Stream |
Out-File -FilePath $file -Encoding utf8


#Question 20

Invoke-RestMethod -Uri https://jdhitsolutions.com/blog/feed |
select Title, Link,
@{Name = "Published"; Expression = { $_.pubdate -as [datetime] } },
@{Name = "Categories"; Expression = { $_.category.'#cdata-section' -join "," } } |
Out-GridView


#Question 21

Invoke-RestMethod -Uri https://jdhitsolutions.com/blog/feed |
select Title, Link,
@{Name = "Published"; Expression = { [datetime]$_.pubdate } },
@{Name = "Categories"; Expression = { $_.category.'#cdata-section' -join "," } } |
Out-GridView -Title "Select a post to read" -OutputMode Single |
ForEach-Object { Start-Process $_.link }


#Question 22
(Get-History).CommandLine.ToLower() |
Where-Object {$_ -notmatch "help"} |
Sort-Object | Get-Unique

# Or even this, using the Where() method.

powershell
(Get-History).where({$_.commandline -notmatch "help"}).Commandline.toLower() |
Sort-Object | Get-Unique


#Question 23
Get-DnsClientCache -CimSession $env:computername -Type A, CNAME, PTR |
Select-Object Entry, Name, Type, TimeToLive, Data, PSComputername |
Export-Csv -Path c:\work\cache.csv -Delimiter ";"

Import-Csv c:\work\cache.csv -Delimiter ";"


#Question 24

$bday = Get-Date "12/25/1970 1:23AM"
$age = (Get-Date) - $bday

[pscustomobject]@{
  Birthday = $bday
  Years    = $age.totaldays / 365 -as [int]
  Timespan = $age
  WeekDay  = $bday.DayOfWeek
  Retire   = $bday.AddYears(65).ToShortDateString()
}



#Question 25
Get-Process | where { $_.company -notmatch "microsoft" -AND $_.company } |
Sort-Object -Property company | Format-Table -GroupBy Company |
Out-String | Set-Clipboard



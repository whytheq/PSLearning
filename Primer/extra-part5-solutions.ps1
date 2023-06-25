#requires -version 7.1
Return 'This is a reference script file, not something you run.'

#Question 1
(Get-Date).DayofWeek -match 'Mon|Wed|Fri' ? (Get-Service) : (Get-Process)


#Question 2
1..10 | foreach -Begin { $c = @() } -Process { $c += $env:computername }
$logs = $c | foreach -Parallel { Get-WinEvent -ComputerName $_ -LogName system -MaxEvents 1000 }


#Question 3
Get-Process notepad -ea silentlycontinue && Stop-Process -Name notepad && "$(Get-Date) killed Notepad" | Out-File d:\temp\log.txt


#Question 4
$helpgroup = Get-Help about_* |
Group-Object { $_.name.split("_", 2)[1][0].toString().toupper() } -AsHashTable -AsString |
Sort-Object Name

$helpgroup.GetEnumerator() |
ForEach-Object { [ordered]@{$_.name = ($_.value | Select-Object Name, Synopsis) } } |
ConvertTo-Json -Depth 3 | Out-File c:\work\about.json

$about = Get-Content C:\work\about.json | ConvertFrom-Json

$about.P


#Question 5
Get-ExperimentalFeature |
Format-Table -GroupBy Name -Property Enabled, Description -Wrap


#Question 6
Get-ExperimentalFeature |
Format-Table -GroupBy @{ Name = "Feature"; Expression= { "`e[7;38;5;251m$($_.Name)`e[0m" }} -Property @{Name = 'Enabled'; Expression = {
    if ($_.enabled) {
        "`e[92m$($_.enabled)`e[0m"
    }
    else {
        $_.Enabled
    }
}}, Description -Wrap


#Question 7
$p = @{
    IncludeTypeInformation = $true
    QuoteFields            = "Description"
    Path                   = "c:\work\localusers.csv"
    NoClobber              = $True
}
Get-LocalUser | Export-Csv @p
Import-Csv $p.path


#Question 8
$location = "Syracuse"
$j = Invoke-RestMethod -Uri "https://wttr.in/$($location)?format=j1"

$Properties = @{Name = "TempF"; Expression = { $_.current_condition.temp_F } },
@{Name = "FeelF"; Expression = { $_.current_condition.FeelsLikeF } },
@{Name = "Humidity"; Expression = { $_.current_condition.humidity } },
@{Name = "Description"; Expression = { $_.current_condition.weatherdesc.value } },
@{Name = "WindMph"; Expression = { $_.current_condition.WindSpeedMiles }; Align = "right" }

$ft = @{
    GroupBy  = @{Name = "$location";
        Expression   = { $_.current_condition.localObsDateTime -as [datetime] }
    }
    Property = $Properties
}

$j | Format-Table @ft


#Question 9
$mdfiles = $env:PSModulePath -split ";" | ForEach-Object -Parallel {
    Get-ChildItem -Path $_ -Filter *.md -Recurse
}
$mdfiles | Get-Random | Show-Markdown


#Question 10
$mdfiles = $env:PSModulePath -split ";" | ForEach-Object -Parallel {
    Get-ChildItem -Path $_ -Filter *.md -Recurse
}
$mdfiles | Where-Object { $_.fullname -notmatch "DSC" } |
Select-Object fullname |
Out-ConsoleGridView -Title "Select files to view" -OutputMode Multiple |
ForEach-Object {
    Get-Content -Path $_.fullname | Out-String | Show-Markdown -UseBrowser
}



#requires -version 5.1
Return 'This is a reference script file, not something you run.'

#Question 1
Get-CimClass -Namespace root\cimv2 -ClassName win32_*


#Question 2
$class = Get-CimClass -ClassName win32_logicaldisk
$class.CimClassMethods

# In Windows PowerShell, you could have queried for instances of this class with Get-WmiObject retrieved methods with Get-Member.

Get-WmiObject win32_logicaldisk | Get-Member -MemberType methods


#Question 3
Get-CimInstance -ClassName win32_operatingsystem | Select-Object *

# If you just wanted the property names, you could use Get-CimClass:

Get-Cimclass -ClassName win32_operatingsystem |
Select-Object -ExpandProperty CimClassProperties



#Question 4
Get-CimInstance -ClassName win32_service -Filter "startmode='auto' AND state <>'running'" |
Select-Object Displayname

# Once you understand the PowerShell's object nature, or if you only want the values  not an object with a single property of Displayname, you could do this:


(Get-CimInstance -ClassName win32_service -filter "startmode='auto' AND state <>'running'").Displayname

# Finally, you can improve performance with Get-CimInstance by requesting only the properties you intend to use.

(Get-CimInstance -ClassName win32_service -filter "startmode='auto' AND state <>'running'" -property displayname).Displayname



#Question 5
Get-CimInstance -ClassName win32_operatingsystem -ComputerName $env:computername |
select @{Name = "Computername"; Expression = { $_.CSName } }, LastBootUpTime,
@{Name = "Uptime"; Expression = { (Get-Date) - $_.lastbootuptime } }



#Question 6
Get-CimInstance win32_operatingsystem -ComputerName $env:computername |
Select-Object -Property @{Name = "Computername"; Expression = { $_.CSName } }, TotalVisibleMemorySize,
FreePhysicalMemory, TotalVirtualMemorySize, FreeVirtualMemory

# You could also have simplified by using wildcards for the property names:

Get-CimInstance win32_operatingsystem -computername $env:computername |
Select-Object -property @{Name="Computername";Expression={$_.CSName}},TotalV*,Free*Memory


#Question 7
Get-CimInstance win32_operatingsystem -ComputerName $env:computername |
select @{Name = "Computername"; Expression = { $_.CSName } },
@{Name = "MemoryGB"; Expression = { $_.TotalVisibleMemorySize / 1mb -as [int] } },
@{Name = "FreeMemoryGB"; Expression = { $_.FreePhysicalMemory / 1mb } },
@{Name = "PctFree"; Expression = { ($_.freephysicalmemory / $_.totalvisiblememorysize) * 100 } },
@{Name = "TotalVMSizeGB"; Expression = { $_.TotalVirtualMemorySize / 1mb -as [int] } },
@{Name = "FreeVMMB"; Expression = { $_.FreeVirtualMemory / 1mb } },
@{Name = "PctFreeVM"; Expression = { ($_.freeVirtualMemory / $_.totalvirtualmemorysize ) * 100 } }

# Once you learn about the [math] class and its static members, you can refine it into something like this:


Get-CimInstance win32_operatingsystem -computername $env:computername |
Select-Object -property @{Name="Computername";Expression={$_.CSName}},
@{Name="MemoryGB";Expression = {$_.TotalVisibleMemorySize/1mb -as [int]}},
@{Name="FreeMemoryGB";Expression = {[math]::Round($_.FreePhysicalMemory/1mb,2)}},
@{Name="PctFree";Expression = {[math]::round(($_.freephysicalmemory/$_.totalvisiblememorysize)*100,4)}},
@{Name="TotalVMSizeGB";Expression = {$_.TotalVirtualMemorySize/1mb -as [int]}},
@{Name="FreeVMMB";Expression ={[math]::Round($_.FreeVirtualMemory/1mb,2)}},
@{Name="PctFreeVM";Expression = {[math]::Round(($_.freeVirtualMemory/$_.totalvirtualmemorysize )*100,4)}}

# Since this solution is writing a custom object to the pipeline, here is an alternative that creates the same result but might be easier to read.

Get-CimInstance win32_operatingsystem -computername $env:computername |
ForEach-Object {
   [pscustomobject]@{
      Computername = $_.CSName
      MemoryGB = $_.TotalVisibleMemorySize/1mb -as [int]
      FreeMemoryGB = [math]::Round($_.FreePhysicalMemory/1mb,2)
      PctFree =[math]::round(($_.freephysicalmemory/$_.totalvisiblememorysize)*100,4)
      TotalVMSizeGB =$_.TotalVirtualMemorySize/1mb -as [int]
      FreeVMMB = [math]::Round($_.FreeVirtualMemory/1mb,2)
      PctFreeVM = [math]::Round(($_.freeVirtualMemory/$_.totalvirtualmemorysize)*100,4)
    }
}


#Question 8
Get-CimInstance -ClassName win32_service -Filter "state='running'" |
Sort-Object startname, Displayname |
Format-Table -GroupBy Startname -Property Name, Displayname, StartMode


#Question 9
Get-Volume -DriveLetter C | Select-Object -Property DriveLetter,
FileSystemLabel, @{Name = "SizeGB"; Expression = { $_.size / 1gb -as [int] } },
@{Name = "FreeGB"; Expression = { $_.SizeRemaining / 1gb } }



#Question 10
Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct


#Question 11
Get-CimInstance win32_nteventlogfile | Select-Object -Property LogFileName,
Name, NumberOfRecords, FileSize, MaxFileSize,
@{Name = "PctUsed"; Expression = { ($_.filesize / $_.maxfilesize) * 100 } }



#Question 12
Get-CimInstance win32_group -Filter "name = 'administrators' AND LocalAccount = 'true'" |
Get-CimAssociatedInstance -ResultClassName win32_useraccount

# Another approach would be to use the `Get-LocalGroupMember` command.

Get-LocalGroupMember administrators



#Question 13
Get-CimInstance win32_group -Filter "name = 'administrators' AND LocalAccount = 'true'" |
Get-CimAssociatedInstance | Where-Object { $_.CimClass -match "User|Group" } |
select Name, Domain, Caption, SID, CimClass


#Question 14
Get-Command -CommandType Cmdlet, function -ParameterName Cimsession


#Question 15
Get-Partition -DriveLetter C | Select-Object -Property Driveletter,
PartitionNumber, Type,
@{Name = "SizeGB"; Expression = { $_.Size / 1GB -as [int] } }



#Question 16
New-CimSession -ComputerName $env:computername, $(hostname), localhost
Get-CimSession | Get-CimInstance Win32_Processor


#Question 17
Get-CimSession | Get-CimInstance -ClassName Win32_LogicalDisk -Filter "drivetype=3" |
select @{Name = "Computername"; Expression = { $_.Systemname } }, DeviceID, VolumeName,
@{Name = "SizeGB"; Expression = { $_.Size / 1gb -as [int] } },
@{Name = "FreeGB"; Expression = { $_.Freespace / 1gb -as [int] } },
@{Name = "PctFree"; Expression = { ($_.Freespace / $_.size) * 100 } }



#Question 18
Get-CimSession | Get-CimInstance -ClassName Win32_LogicalDisk -Filter "drivetype=3" |
select @{Name = "Computername"; Expression = { $_.Systemname } }, DeviceID, VolumeName,
@{Name = "SizeGB"; Expression = { $_.Size / 1gb -as [int] } },
@{Name = "FreeGB"; Expression = { $_.Freespace / 1gb -as [int] } },
@{Name = "PctFree"; Expression = { ($_.Freespace / $_.size) * 100 } } |
ConvertTo-Html -Title "Drive Report" -PreContent "<h1>Company Drive Report</h1>" |
Out-File c:\work\drivereport.htm

Invoke-Item C:\work\drivereport.htm



#Question 19

Get-CimInstance win32_process -Filter "name <> 'system' AND name <> 'system idle process'" |
Select-Object -Property ProcessID, Name, Commandline, ExecutablePath, WorkingSetSize, creationdate,
@{Name = "Owner"; Expression = {
        $o = $_ | Invoke-CimMethod -MethodName GetOwner
        "$($o.domain)\$($o.user)"
    }
}


#Question 20

Get-NetAdapter | where { $_.status -EQ 'up' } |
Select-Object -Property Name, InterfaceDescription, LinkSpeed, MACAddress,
@{Name = "IPAddress"; Expression = { $_ | Get-NetIPAddress -AddressFamily IPv4 } }

# You could also have queried the legacy win32_networkadapter or win32_networkadapterconfiguration classes.


Get-CimInstance win32_networkadapter -filter "netenabled='true'" |
Select-Object -property NetConnectionID,description,Speed,MacAddress,
@{Name="IPAddress";Expression = { ($_ | Get-CimAssociatedInstance -ResultClassName Win32_NetworkAdapterConfiguration).IPAddress}}

#Question 21
Get-CimInstance win32_product -Filter "name like '%'" |
Select-Object -Property Name, Vendor, Version, Description, InstallDate

# Here's one approach that should also respect culture-specific date formatting.


Get-CimInstance win32_product -filter "name like '%'" |
Select-Object  Name,Vendor,Version,Description,
@{Name="Installed" ;Expression = {$_.InstallDate.Insert(4,"/").insert(7,"/") -as [datetime]}}

#Question 22
New-CimInstance -ClassName win32_environment -Property @{Name = "PSPrimer"; VariableValue = "1.0"; username = "$env:userdomain\$env:username"}

Get-CimInstance win32_environment -Filter "name='psprimer'"

Get-CimInstance win32_environment -Filter "name='psprimer'" |
Set-CimInstance -Property @{VariableValue = "2.0" } -PassThru

Get-CimInstance win32_environment -Filter "name='psprimer'" |
Remove-CimInstance


#Question 23
$frag = Get-CimInstance win32_environment -ComputerName $env:computername |
Group-Object -Property Username | ForEach-Object {
    #strip off the anglebrackets
    $name = $_.name.replace(">", "").replace("<", "")
    $_.group | Select-Object Name, VariableValue |
    ConvertTo-Html -PreContent "<h2>$name</h2>" -Fragment
}

ConvertTo-Html -PostContent $frag -Title "Environment" -PreContent "<h1>$env:computername</h1>" | Out-File c:\work\env.html


#Question 24
Get-CimInstance Win32_PerfFormattedData_PerfOS_System |
Select-Object -Property File*, ProcessorQueueLength, Uptime

#  You can convert the uptime value into a timespan.

Get-CimInstance Win32_PerfFormattedData_PerfOS_System |
Select-Object -property File*,ProcessorQueueLength,
@{Name="Uptime";Expression={New-TimeSpan -Seconds $_.systemuptime}}


# And a splatted solution for multiple computers might look like this:

$get = @{
 Class = 'Win32_PerfFormattedData_PerfOS_System'
 Computername = $env:computername,'localhost',$(hostname)
 Property = (Get-Cimclass Win32_PerfFormattedData_PerfOS_System).cimclassproperties.name | where {$_ -match "file|uptime|queue"}
 Erroraction = "Stop"
}

$select = 'File*','*queue*',
@{Name="Uptime";Expression={New-TimeSpan -Seconds $_.systemuptime}},
@{Name="Computername";Expression={$_.PSComputername.toUpper()}}

Get-CimInstance @get  | Select-Object -property $select


#Question 25
Get-CimClass win32_PerfFormattedData_TCPIP_* -ComputerName $env:computername |
Select-Object -Property @{Name = "Classname"; Expression = { $_.CimClassName } },
@{Name = "computername"; Expression = { $_.cimsystemproperties.servername } } |
Get-CimInstance -ov z | sort { $_.CimClass.CimClassName } |
Format-List -GroupBy @{Name = "Class"; Expression = { $_.CimClass.CimClassName } }

# You could use Add-Member to add a custom property.

Get-CimClass win32_PerfformattedData_TCPIP_* -ComputerName $env:computername |
Select-Object -property @{Name="Classname";Expression = {$_.CimClassName}},
@{Name="computername";Expression={$_.cimsystemproperties.servername}} |
Get-Ciminstance | Add-Member -MemberType ScriptProperty -Name CounterClass -Value {$this.cimclass.CimClassName} -PassThru


# Or you could create a custom object with nested properties.

Get-CimClass win32_PerfFormattedData_TCPIP_* -ComputerName $env:computername |
Select-Object -property @{Name="Classname";Expression = {$_.CimClassName}},
@{Name="computername";Expression={$_.cimsystemproperties.servername}} |
ForEach-Object {

 [pscustomobject]@{
    CounterClass = $_.classname
    Counters = ($_ | Get-Ciminstance | Select-Object * -ExcludeProperty PSComputername,CIM*)
    Computername = $_.Computername
    Date = (Get-Date)
  }
}


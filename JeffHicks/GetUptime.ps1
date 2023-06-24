
function Get-Uptime { 
    <#
.SYNOPSIS
    Returns the uptime of the computer.
.DESCRIPTION    
    Returns the uptime of the computer.
.EXAMPLE
    Get-Uptime
    Returns the uptime of the computer.
.EXAMPLE
    Get-Uptime -FirstLetter 'p'
    Returns the uptime of the computer for processes starting with 'p'.
#>
    param( $FirstLetter )
    if ( $null -eq $FirstLetter ) { $FirstLetter = 'p' }
    if ( $FirstLetter.Length -gt 1 ) { $FirstLetter = $FirstLetter[0] }
    $pp = GET-PROCESS $FirstLetter* | select-object -Property ProcessName, StartTime -Last 1
    if ( $null -ne $pp ) { 
        [pscustomobject]@{
            ProcessName = $pp.ProcessName
            StartTime   = $pp.StartTime
            Uptime      = New-TimeSpan -Start $pp.StartTime -End (Get-Date) 
        }
    }   
}

Function Get-RuntimeInformation {
    <#
.SYNOPSIS
    Returns the runtime information of the computer.
.DESCRIPTION
    Returns the runtime information of the computer.
.EXAMPLE
    Get-RuntimeInformation
    Returns the runtime information of the computer.
#>
    [cmdletbinding()] 
    Param() [PSCustomObject]@{ 
        PSVersion    = $PSVersionTable.PSVersion 
        Framework    = [System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription 
        OSVersion    = [System.Runtime.InteropServices.RuntimeInformation]::OSDescription 
        Architecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture 
        Computername = [Environment]::MachineName 
    } 
}
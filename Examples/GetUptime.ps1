
function Get-UptimeCustom { 
    <#
.SYNOPSIS
    Returns the uptime of the computer.
.DESCRIPTION    
    Returns the uptime of the computer.
.EXAMPLE
    Get-UptimeCustom
    Returns the uptime of the computer.
.EXAMPLE
    Get-UptimeCustom -FirstLetter 'p'
    Returns the uptime of the computer for processes starting with 'p'.
#>
    [cmdletbinding()]
    param( $FirstLetter = 'p')

    Write-Verbose "[$((Get-Date).TimeOfDay)] Starting $($MyInvocation.MyCommand)" 
    Write-Verbose "[$((Get-Date).TimeOfDay)] Running under PowerShell v$($PSVersionTable.PSVersion)" 

    Write-Verbose "FirstLetter was $($FirstLetter.Length) long. $(if($FirstLetter.Length -gt 1){"It was longer than 1 so has been truncated to the first letter $($FirstLetter[0])"})" 
    if ( $FirstLetter.Length -gt 1 ) { $FirstLetter = $FirstLetter[0] }
    $pp = GET-PROCESS $FirstLetter* | select-object -Property ProcessName, StartTime -Last 1
    if ( $null -ne $pp ) { 
        [pscustomobject]@{
            ProcessName = $pp.ProcessName
            StartTime   = $pp.StartTime
            Uptime      = New-TimeSpan -Start $pp.StartTime -End (Get-Date) 
        }
    }   

    Write-Verbose "[$((Get-Date).TimeOfDay)] Ending $($MyInvocation.MyCommand)"
} #close get-uptimecustom function











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
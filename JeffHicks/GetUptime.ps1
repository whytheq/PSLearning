
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

# create Pester tests for the above function Get-RuntimeInformation
Describe 'Get-RuntimeInformation' {
    It 'should return the runtime information of the computer' {
        $result = Get-RuntimeInformation
        $result.PSVersion.Major | Should -Be 5
        $result.PSVersion.Minor | Should -Be 1
        $result.PSVersion.Build | Should -Be 14393
        $result.PSVersion.Revision | Should -Be 693
        $result.Framework | Should -Be '.NET Framework 4.6.2'
        $result.OSVersion | Should -Be 'Microsoft Windows NT 10.0.14393.0'
        $result.Architecture | Should -Be 'X64'
        $result.Computername | Should -Be 'DESKTOP-1'
    }
}

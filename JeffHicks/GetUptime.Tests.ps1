
# Add a standard Pester 5 BeforeAll block for the GetUptime.ps1 script
BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}


# create Pester tests for the above function Get-RuntimeInformation
Describe 'Get-RuntimeInformation' {
    It 'should return the runtime information of the computer' {
        $result = Get-RuntimeInformation
        $result.PSVersion.Major | Should -Be 7
        $result.PSVersion.Minor | Should -Be 3
        $result.PSVersion.Patch | Should -Be 4
        $result.Framework | Should -Be '.NET 7.0.5'
        ($result.OSVersion -split ' ')[0]| Should -Be 'Linux'
        $result.Architecture | Should -Be 'X64'
        $result.Computername | Should -Be 'penguin'
    }
}

# create Pester tests for the function Get-UptimeCustom
Describe 'Get-UptimeCustom' {
    It 'should return the uptime of the computer' {
        $result = Get-UptimeCustom
        $result.ProcessName | Should -Be 'pwsh'
        $result.Uptime.TotalSeconds | Should -BeGreaterThan 0
    }
}

# create Pester tests for the function Get-UptimeCustom with a parameter
Describe 'Get-UptimeCustom' {
    It 'should return the uptime of the computer for processes starting with "p"' {
        $result = Get-UptimeCustom -FirstLetter 'p'
        $result.ProcessName | Should -Be 'pwsh'
        $result.Uptime.TotalSeconds | Should -BeGreaterThan 0
    }
}

# create Pester tests for the function Get-UptimeCustom checking it has inline help
Describe 'Get-UptimeCustom' {
    It 'should have inline help' {
        $result = Get-Help Get-UptimeCustom -Parameter FirstLetter
        $result | Should -Not -BeNullOrEmpty
    }
}


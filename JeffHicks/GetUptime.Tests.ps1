


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

Set-Location -Path /home/whytheq/PSLearning/JeffHicks/

$configuration = [PesterConfiguration]@{
    Output = @{
        Verbosity = 'Detailed'
    }
}

Invoke-Pester -Configuration $configuration
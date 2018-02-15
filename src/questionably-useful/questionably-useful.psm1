# if (Get-Module questionably-useful) {
#     Write-Output 'Already inited';
#     return
# }

.$PSScriptRoot\utils.ps1

$moduleExports = @{
    Function = @(
        'Search-Files',
        'Open-SearchResult',
        'Find-KillLocked'
    )
}

Export-ModuleMember @moduleExports
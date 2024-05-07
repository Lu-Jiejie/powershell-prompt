Import-Module "$PSScriptRoot\lib\Utils.psm1"
Import-Module "$PSScriptRoot\lib\Path.psm1"
Import-Module "$PSScriptRoot\lib\GitStatus.psm1"
Import-Module "$PSScriptRoot\lib\Package.psm1"
Import-Module "$PSScriptRoot\lib\Environment.psm1"

function Prompt() {
  $ansiReset = "`e[0m"
  $path = Get-Path
  $gitStatus = Get-GitStatus
  $packageInfo = Get-PackageInfo
  $envVersion = Get-EnvVersion
  return "$path" + `
    "$gitStatus" + `
    "$packageInfo" + `
    "$envVersion" + `
    "`n➜ $ansiReset"
}

Export-ModuleMember -Function Prompt

# Invoke-Expression (&starship init powershell)

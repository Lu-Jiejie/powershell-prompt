Import-Module "$PSScriptRoot\Utils.psm1"

function Format-PackageVersion([string]$PackageVersion){
  $packageIcon = "📦"
  $ansiOrange = "`e[38;5;208m"
  $ansiBold = "`e[1m"
  $ansiReset = "`e[0m"
  return " is $packageIcon $ansiBold$ansiOrange"+"v$PackageVersion$ansiReset"
}

function Get-PackageVersionNPM(){
  $packageJsonPath = Find-UpSearch 'package.json' 
  if (-not $packageJsonPath){
    return
  }
  $packageJson = Read-File $packageJsonPath | ConvertFrom-Json
  $packageVersion = $packageJson.version
  if (-not $packageVersion){
    return
  }
  return Format-PackageVersion $packageVersion
}

function Get-PackageVersionPython(){
  $pyprojectTomlPath = Find-UpSearch 'pyproject.toml'
  if (-not $pyprojectTomlPath){
    return
  }
  $pyprojectToml = Read-File $pyprojectTomlPath
  $packageVersion = $pyprojectToml | Select-String -Pattern 'version = "(.*)"' | ForEach-Object { $_.Matches.Groups[1].Value }
  if (-not $packageVersion){
    return
  }
  return Format-PackageVersion $packageVersion
}


function Get-PackageInfo(){
  # npm
  $packageVersionNPM = Get-PackageVersionNPM
  if ($packageVersionNPM){
    return $packageVersionNPM
  }
  # python
  $packageVersionPython = Get-PackageVersionPython
  if ($packageVersionPython){
    return $packageVersionPython
  }
}

Export-ModuleMember -Function *

function Get-Path() {
  $currentPath = $(Get-Location) -replace "\\", "/"
  $ansiCyan = "`e[1;36m"

  return "$ansiCyan$currentPath$ansiReset"
}

Export-ModuleMember -Function *

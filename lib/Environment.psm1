Import-Module "$PSScriptRoot\Utils.psm1"

function Get-EnvNode(){
  if (-not ((Find-UpSearch 'package.json','node_modules') || (Find-FileExists '\.js|\.cjs|\.mjs|\.ts'))){
    return
  }
  $icon = ""
  $ansiGreen = "`e[1;32m"
  $ansiReset = "`e[0m"
  if (Find-CommandExists 'fnm'){
    $version = & fnm current 2>$null
  } elseif (Find-CommandExists 'nvm'){
    $version = & nvm current 2>$null
  } elseif (Find-CommandExists 'nodenv'){
    $version = & nodenv version-name 2>$null
  } elseif (Find-CommandExists 'node'){
    $version = & node -v 2>$null
  } else {
    return
  }
  return "$ansiReset via $ansiGreen$icon $version$ansiReset"
}

function Get-EnvPython(){
  if (-not ((Find-UpSearch 'requirements.txt','pyproject.toml')||(Find-FileExists '\.py'))){
    return
  }
  $icon = "🐍"
  $ansiYellow = "`e[1;33m"
  $ansiReset = "`e[0m"

  $version = & python -V 2>$null | ForEach-Object { $_.Split(' ')[1] }
  return "$ansiReset via $ansiYellow$icon $version$ansiReset"
}

function Get-EnvVersion(){
  $envNode = Get-EnvNode
  $envPython = Get-EnvPython
  return "$envNode$envPython"
}

Export-ModuleMember -Function *

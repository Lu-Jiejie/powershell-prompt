function Find-CommandExists([string]$CommandName) {
  if (Get-Command -Name $CommandName -ErrorAction SilentlyContinue) {
    return $true
  }
  else {
    return $false
  }
}

function Find-FileExists([string[]]$Regexp){
  $files = Get-ChildItem -File | Where-Object { $_.Name -match $Regexp }
  if ($files){
    return $true
  }
  return $false
}

function Find-UpSearch([string[]]$Paths, [switch]$Silent) {
  $root = (Get-Location).Path
  while ($root) {
    foreach ($file in $Paths) {
      $findMatch = Get-ChildItem -Path $root -Filter $file -Depth 0 -ErrorAction SilentlyContinue | Select-Object -First 1 -ExpandProperty FullName
      $filename = Join-Path -Path $root -ChildPath $file
      if ($findMatch) {
        if (-not $Silent) {
          Write-Output $findMatch
        }
        return $fileMath
      }
      elseif (Test-Path $filename) {
        if (-not $Silent) {
          Write-Output $filename
        }
        return $fileName
      }
    }

    if ((Test-Path (Join-Path -Path $root -ChildPath '.git')) -or (Test-Path (Join-Path -Path $root -ChildPath '.hg'))) {
      return $false
    }

    $root = Split-Path -Path $root -Parent
  }

  return $false
}

function Read-File([string]$Path){
  $file = Get-Content -Path $Path -Encoding UTF8 -Raw
  return $file
}


Export-ModuleMember -Function *

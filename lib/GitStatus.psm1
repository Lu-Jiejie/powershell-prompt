function Get-GitStatus() {
  $ansiReset = "`e[0m"
  $ansiRed = "`e[1;31m"
  $ansiPurple = "`e[1;35m"
  $branchIcon = [char]0xe0a0
  # 获取 git 信息
  $gitBranch = & git rev-parse --abbrev-ref HEAD 2>$null
  
  # 如果在 git 仓库中
  if ($gitBranch) {
    $gitStatus = & git status --porcelain 2>$null
    $gitAhead = & git rev-list --left-right --count origin/$gitBranch...HEAD 2>$null
  
    $gitInfo = "$ansiReset on $ansiPurple$branchIcon $gitBranch"
    $statusInfo = ""
    if ($gitStatus -match "UU") {
      $statusInfo += "🗴"
    }
    if ($gitStatus -match "\?\?") {
      $statusInfo += "?"
    }
    if ($gitStatus -match "^.[MD]") {
      $statusInfo += "!"
    }
    if ($gitStatus -match "^[MADRCU]") {
      $statusInfo += "+"
    }
    if ($gitAhead) {
      $aheadBehind = $gitAhead -split '\s+'
      if ($aheadBehind[1] -gt 0) {
        $statusInfo += "⇡"
      }
      if ($aheadBehind[0] -gt 0) {
        $statusInfo += "⇣"
      }
    }
    if ($statusInfo) {
      $gitInfo += " $ansiRed[$statusInfo]"
    }
  }
  else {
    $gitInfo = ""
  }
  $gitInfo = "$gitInfo$ansiReset"

  return $gitInfo
}

Export-ModuleMember -Function *

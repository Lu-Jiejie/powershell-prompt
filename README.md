# Powershell Prompt

English | [简体中文](./README.zh-CN.md)

Change your [Windows Powershell](https://github.com/PowerShell/PowerShell) prompt to [Starship](https://github.com/starship/starship) style using only several ps1 scripts!

![img1](./asset/img1.png)

## Installation

1. Clone this repository to your local machine.

2. Open your Powershell profile file. You can do this by running  the following command in your Powershell terminal.

```powershell
notepad $PROFILE
```

3. Add the following line to your profile file:

```powershell
Import-Module <path-to-repository>\Prompt.psm1
```

## Features

+ Show current Git branch and status of current project.
+ Show the package version of current project.
+ Show thr environment and it's version of current project. 

## Why?

+ No need to install any other software.
+ All code is written in ps1 scripts, easy to understand and modify.
+ No runtime other than Powershell is used.

## References

- [Starship](https://github.com/starship/starship)
- [Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)

# Powershell Prompt

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

+ Show current git branch and status of current project.
+ Show the package version of current project.
+ Show thr environment and it's version of current project. 

## Why?

I wanted to have a simple way to change my Powershell prompt to Starship style without having to install any additional software, although it said it is minimal. All the scripts are written in Powershell and are very simple to understand and modify, and make me feel like I'm in control of my prompt.

## References

- [Starship](https://github.com/starship/starship)
- [Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt)

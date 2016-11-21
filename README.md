# dot-sourced
PowerShell functions to be 'dot sourced' when the $profile is executed.

# Installation

## Manual
- Download latest release
- Uncompress archive
- Move folder to C:\Users\<>\Documents\WindowsPowerShell\Scripts (create directories as necessary)

## Git
~~~powershell
# change to PowerShell directory
PS> cd ~\Documents\WindowsPowerShell

# create Scripts directory (if necessary)
PS> mkdir Scripts

# change to Scripts directory
PS> cd Scripts

# clone the repository
PS> git clone git@github.com:craibuc/dot-sourced.git
~~~

# Usage

- Edit your PowerShell profile:

  `PS> notepad $profile`

- Add these lines:

~~~powershell
# load all scripts in 'Dot-Sourced' folder
Get-ChildItem ( "$(Split-Path $profile)\Scripts\Dot-Sourced" ) -Recurse | ` 
    Where { $_.Name -like '*.ps1' -and $_.Name -notlike '__*' -and $_.Name -notlike '*.Tests*' } | `
    ForEach { . $_.FullName }
~~~

# Related
- [Microsoft.PowerShell_profile.ps1](https://gist.github.com/craibuc/5ffec8491c825a75aee7)

# Personnel
Author: [Craig Buchanan](https://github.com/craibuc)

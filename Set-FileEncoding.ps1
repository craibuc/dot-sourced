Function Set-FileEncoding {

    Param(
        [string]$Path,

        [Microsoft.PowerShell.Commands.FileSystemCmdletProviderEncoding]$Encoding=[FileSystemCmdletProviderEncoding]::ASCII
    )

    Set-Content $path -Encoding $Encoding -Value (Get-Content $Path)
}

Set-Alias sfe Set-FileEncoding

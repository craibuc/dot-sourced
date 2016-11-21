Function New-Guid {

    $guid = [guid]::NewGuid()

    Write-Host "Copying GUID to clipboard..."
    Add-Type -AssemblyName System.Windows.Forms
    $tb = New-Object System.Windows.Forms.TextBox
    $tb.Multiline = $true
    $tb.Text = $guid
    $tb.SelectAll()
    $tb.Copy()

    $guid

}

Set-Alias guid New-Guid
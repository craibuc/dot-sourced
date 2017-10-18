
<#
.SYNOPSIS
Converts an array into other arrays of the specified size

.PARAMETER Item

.PARAMETER Size

.EXAMPLE
Convert an array of 10 elements to 4 arrays of 3 or fewer elements

PS> @(0,1,2,3,4,5,6,7,8,9) | Slice-Array -Size 3 | % { "IDs: $($_ -Join ",")" }
IDs: 0,1,2
IDs: 3,4,5
IDs: 6,7,8
IDs: 9

#>

function Slice-Array
{

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$True)]
        [String[]]$Item,
        [int]$Size = 10
    )
    BEGIN { $Items=@()}
    PROCESS {
        foreach ($i in $Item ) { $Items += $i }
    }
    END {
        0..[math]::Floor($Items.count/$Size) | % { 
            $x, $Items = $Items[0..($Size-1)], $Items[$Size..$Items.Length]; ,$x
        } 
    }
}


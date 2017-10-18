$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Slice-Array" {

    $ids = @(0,1,2,3,4,5,6,7,8,9)

	Context "Default" {

        $actual = $ids | Slice-Array -Size 3 

	    It "converts an array of 10 elements to 4 arrays of 3 or fewer elements" {
	        $actual.length | Should Be 4
	    }

	}

}

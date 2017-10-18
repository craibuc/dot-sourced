$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Get-ADUser" {

    $account = ''

	Context "Valid account is supplied" {

	    It "returns a PsCustomObject that contains a property matching the account" {
	        $actual = Get-ADUser $account

            $actual.GetType() | Should Be System.Management.Automation.PsCustomObject
            $actual.samaccountname | Should Be $account
	    }

	}

    Context "Invalid account is supplied" {

        It "returns a null" {
            $actual = Get-ADUser 'foobarbaz'
            $actual | Should BeNullOrEmpty
        }

    }

}

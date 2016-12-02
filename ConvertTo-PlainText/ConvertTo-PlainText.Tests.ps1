$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "ConvertTo-PlainText" {

	$expected = 'pa55w0rd'
	$securePassword = ConvertTo-SecureString -String $expected -AsPlainText -Force

    Context "Value supplied as a positional parameter" {
        It "Convert a secure string to a plain-text string" {
            $actual = ConvertTo-PlainText $securePassword -Verbose
            $actual | Should Be $expected
        }
    }

    Context "Value supplied via the pipeline" {
        It "Convert a secure string to a plain-text string" {
            $actual = $securePassword | ConvertTo-PlainText -Verbose
            $actual | Should Be $expected
        }
    }

}


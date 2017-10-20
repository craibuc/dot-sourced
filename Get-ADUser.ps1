<#
.SYNOPSIS
Query the Active Directory service by account, first name, or last name.

.PARAMETER Account

.PARAMETER FirstName

.PARAMETER LastName

.EXAMPLE
Query by account:

PS> Get-ADUser s0123456

Name            : Jane Doe
givenname       : Jane
sn              : Doe
SAMAccountName  : s0123456
mails           :
telephonenumber :
title           :
department      :
homedirectory   :

.EXAMPLE
Query by first name:

PS> Get-ADUser -FirstName Jane

Name            : Jane Doe
givenname       : Jane
sn              : Doe
SAMAccountName  : s0123456
mails           :
telephonenumber :
title           :
department      :
homedirectory   :

.EXAMPLE
Query by last name:

PS> Get-ADUser -LastName Doe

Name            : Jane Doe
givenname       : Jane
sn              : Doe
SAMAccountName  : s0123456
mails           :
telephonenumber :
title           :
department      :
homedirectory   :

#>
function Get-ADUser {

	param(
		[string]$Account,
		[string]$FirstName,
		[string]$LastName
	)

	$f=@()
	$f += if ( $Account ) { "(samaccountname=$Account)" }
	$f += if ( $FirstName ) { "(givenname=$FirstName)" }
	$f += if ( $LastName ) { "(sn=$LastName)" }

	$filter = "(&(objectCategory=person)(objectClass=user)$( $f -Join ''))"
	Write-Debug "Filter: $filter"

    ([ADSISearcher]$filter).FindAll() | % {

        if ($_.properties) {

            $properties=@{}

            # convert ResultPropertyCollection to PsCustomObject
            $_.Properties.GetEnumerator() | % { 
                $properties[$_.Name]= if ($_.Value.Count -gt 1) { $_.Value.ForEach({$_}) -Join ","} else { $_.Value.Item(0) }
            }

            [PsCustomObject]$properties

        }

    }

}

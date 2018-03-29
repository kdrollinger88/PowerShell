$creds = Get-Credential -Message "Enter Domain Admin Creds"
$UsernameToCopy = Read-Host -Prompt "Username of person to copy"
$Firstname = Read-Host -Prompt "First name"
$LastName = Read-Host -Prompt "Last name"
$Username = $firstname.SubString(0,1) + $LastName
$name = $Firstname + " " + $LastName
$EmailAddress = $Username + "@nffc.com"
$TargetAddress = "SMTP:" + $Username + "@nationalfrozenfoods.mail.onmicrosoft.com"
$ExchangeServer = "Exchange2010.nffc.local"

#password confirmation/set
$password = Read-Host -Prompt "Password" -AsSecureString
$passwordconfirm = Read-Host -Prompt "Confirm Password" -AsSecureString
$i = 0
$pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
$pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($passwordconfirm))
While ($i -eq 0) {
if ($pwd1_text -eq $pwd2_text) {$i = 1 }
else 
{
write-host "Passwords do not match, please try again" -BackgroundColor White -ForegroundColor Red
$password = Read-Host -Prompt "Password" -AsSecureString
$passwordconfirm = Read-Host -Prompt "Confirm Password" -AsSecureString
$pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
$pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($passwordconfirm))
}}
#end password stuff

#use username to copy to get information about them
$OldUsername = Get-ADUser -Identity $UsernameToCopy -Properties Memberof,l
#managedobjects missing
#add to "-Properties *" to get all properties available

#This grabs the parent by querying LDAP since the parent folder in AD isnt brought over as a property.
$DN = $OldUsername.distinguishedName
$OldUser = [ADSI]"LDAP://$DN"
$Parent = $OldUser.Parent


$UserSettings = @{
'SamAccountName'= $username;
'name'= $name;
'ChangePasswordAtLogon'= $true;
'Credential' = $Creds;
'AccountPassword'= $password;
'userPrincipalName'= $EmailAddress;
'EmailAddress'= $EmailAddress;
'Path'=$Parent.Substring(7);
'enabled'= $True;
'GivenName'= $Firstname;
'Surname'= $LastName;
}

New-ADUser @UserSettings -Instance $OldUsername -verbose

$OldUsername.MemberOf | Add-ADGroupMember -Members $Username -Credential $creds

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://exchange2010.nffc.local/PowerShell/ -Authentication Kerberos -Credential $creds
Invoke-Command -Session $Session -ScriptBlock {Enable-RemoteMailbox -identity $using:EmailAddress -RemoteRoutingAddress $using:TargetAddress -alias $using:Username}
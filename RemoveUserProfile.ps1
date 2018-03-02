$cred = Get-Credential -Message "Enter Desktop Admin Credentials or Server Admin Credentials"
$computer = Read-Host -Prompt "Computer Name"
$username = Read-Host -Prompt "Username"

Get-WMIObject -class Win32_UserProfile -ComputerName $computer -Credential $Cred | Where-Object {$_.localpath -like "*" + $username + "*"} | Remove-WmiObject
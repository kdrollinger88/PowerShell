#Removes user profiles that have not been logged in to for over 2 years (730days) according to WMI on $computer for LastUseTime. Ignores Special and the Administrator account.


Param(
  [string]$computer
  )

  if(-not($computer)) { Throw "You must supply a value for -computer" }

Get-WMIObject -class Win32_UserProfile -ComputerName $computer | Where-Object {(!$_.Special) -and ($_.ConvertToDateTime($_.LastUseTime) -lt (Get-Date).AddDays(-730)) -and ($_.SID -notmatch '-500$')} 

#| Remove-WmiObject
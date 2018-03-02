$cred = Get-Credential
Enter-PSSession adconnect -Credential $cred
Start-ADSyncSyncCycle -PolicyType Delta
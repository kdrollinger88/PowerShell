[xml]$a = (Get-Content -Path C:\Users\kdadminx\Desktop\O365IPAddresses.xml)
$wshell = New-Object -ComObject Wscript.Shell
$c,$d = 0
$Path = "C:\Users\kdadminx\Desktop\Script.txt"

#O365
Out-File -FilePath $Path
foreach ($i in $a.products.product[0].addresslist[2].address)
{ 
$c +=1 
$b = $a.products.product[0].addresslist[2].address[$c-1]

$string = "address-object fqdn O365fqdn-" + $c +"`r`ndomain " + $b + "`r`nzone WAN `r`nexit" | Add-Content $Path
}

#Identity
foreach ($i in $a.products.product[8].addresslist[0].address)
{ 
$d +=1 
$b = $a.products.product[8].addresslist[0].address[$d-1]
$string = "address-object fqdn O365id-" + $d +"`r`ndomain " + $b + "`r`nzone WAN `r`nexit" | Add-Content $Path
}

#CRLs
$c = 0
foreach ($i in $a.products.product[16].addresslist.address)
{ 
$c +=1 
$b = $a.products.product[16].addresslist.address[$c-1]

$string = "address-object fqdn O365CRL-" + $c +"`r`ndomain " + $b + "`r`nzone WAN `r`nexit" | Add-Content $Path
}

$c = 0
foreach ($i in $a.products.product[18].addresslist[0].address)
{ 
$c +=1 
$b = $a.products.product[18].addresslist[0].address[$c-1]
$bSplit = $b.split('/')
Switch( $bSplit[1])

{
32 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nhost " + $bSplit[0] + "`r`nzone WAN `r`nexit" | Add-Content $Path}
31 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.254" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
30 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.252" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
29 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.248" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
28 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.240" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
27 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.224" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
26 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.192" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
25 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.128" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
24 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
23 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.254.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
22 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.252.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
21 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.248.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
20 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.240.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
19 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.224.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
18 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.192.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
17 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.128.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
16 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.0.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
15 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.254.0.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}
14 {$string = "address-object ipv4 O365EOP-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.252.0.0" + "`r`nzone WAN `r`nexit" | Add-Content $Path}

default {$wshell.Popup("Script missing Subnet mask code, fix script and rerun. Check" + $bSplit,0)}
}
}



#Write-Output ($c + " ips for " + $a.products.product[0].ToString() + $d + " ips for " + $a.products.product[8].ToString() + "created. If this is not what you wanted check the XML file, Microsoft may have changed the order names" )
#$a.products.product[0].addresslist[1].address  |Out-File -FilePath C:\Users\kdadminx\Desktop\test1.txt -Append
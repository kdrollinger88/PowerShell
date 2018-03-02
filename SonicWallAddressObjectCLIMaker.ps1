[xml]$a = (Get-Content -Path C:\Users\kdadminx\Desktop\O365IPAddresses.xml)
$wshell = New-Object -ComObject Wscript.Shell
$c,$d = 0

Out-File -FilePath C:\Users\kdadminx\Desktop\test1.txt
foreach ($i in $a.products.product[0].addresslist[1].address)
{ 
$c +=1 
$b = $a.products.product[0].addresslist[1].address[$c-1]
$bSplit = $b.split('/')
Switch( $bSplit[1])

{
32 {$string = "address-object ipv4 O365ip-" + $c +"`r`nhost " + $bSplit[0] + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
31 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.254" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
30 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.252" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
29 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.248" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
28 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.240" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
27 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.224" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
26 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.192" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
25 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.128" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
24 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
23 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.254.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
22 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.252.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
21 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.248.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
20 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.240.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
19 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.224.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
18 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.192.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
17 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.128.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
16 {$string = "address-object ipv4 O365ip-" + $c +"`r`nnetwork " + $bSplit[0]+ " 255.255.0.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
default {$wshell.Popup("Script missing Subnet mask code, fix script and rerun.",0)}
}
}

foreach ($i in $a.products.product[8].addresslist[1].address)
{ 
$d +=1 
$b = $a.products.product[8].addresslist[1].address[$d-1]
$bSplit = $b.split('/')
Switch( $bSplit[1])

{
32 {$string = "address-object ipv4 O365ID-" + $d +"`r`nhost " + $bSplit[0] + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
31 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.254" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
30 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.252" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
29 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.248" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
28 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.240" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
27 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.224" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
26 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.192" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
25 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.128" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
24 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.255.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
23 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.254.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
22 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.252.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
21 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.248.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
20 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.240.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
19 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.224.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
18 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.192.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
17 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.128.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
16 {$string = "address-object ipv4 O365ID-" + $d +"`r`nnetwork " + $bSplit[0]+ " 255.255.0.0" + "`r`nzone WAN `r`nexit" | Add-Content C:\Users\kdadminx\Desktop\test1.txt}
default {$wshell.Popup("Script missing Subnet mask code, fix script and rerun. Check " + $bSplit[0],0)}
}
}

Write-Output $c " ips for " $a.products.product[0].ToString() $d " ips for " $a.products.product[8].ToString() "created. If this is not what you wanted check the XML file, Microsoft may have changed the order of the items" 
#$a.products.product[0].addresslist[1].address  |Out-File -FilePath C:\Users\kdadminx\Desktop\test1.txt -Append
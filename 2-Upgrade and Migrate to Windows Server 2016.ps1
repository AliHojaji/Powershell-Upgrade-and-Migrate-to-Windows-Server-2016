#--- Author : Ali Hojaji ---#

#--*-----------------------*--#
#---> Upgrade & Migrate 2 <---#
#--*-----------------------*--#

#--> install the .NET 3.5 framework from the sxs store on the installation media
Get-WindowsFeature net-framework-Core
Install-WindowsFeature net-framework-Core -Source D:\sources\sxs

#--> register the smt tools
.\SMT_WS12R2_amd64\SmigDeploy.exe

#--> import smig cmdlets into session
Add-PSSnapin Microsoft.windows.ServerManager.Migration

#--> stop the DHCP server service
Stop-Service -Name DHCPServer

#--> view roles and features eligible for migration
Get-SmigServerFeature

#--> create the migration store
Export-SmigServerSetting -FeatureID DHCP -Path c:\Test\migration -Verbose

#--> copy migration store to destination server
copy_Item -Path c:\Test\migration -Destination \\srv2016-nug\c$\Test -Recurse
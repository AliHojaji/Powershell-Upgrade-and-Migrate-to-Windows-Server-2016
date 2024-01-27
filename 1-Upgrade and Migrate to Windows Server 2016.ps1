#--- Author : Ali Hojaji ---#

#--*---------------------*--#
#---> Upgrade & Migrate <---#
#--*---------------------*--#

#--> view server migration tools feature
Get-WindowsFeature -Name migration

#--> install windows server migration tools
Install-WindowsFeature -Name migration

#--> navigate to smt directory
cd C:\Windows\System32\servermigrationtools

#--> generate package for source machine
.\smigdeploy.exe /package /architecture amd64 /os WS12R2 /path c:\Test

#--> copy package over to source machine
Copy-Item -Path c:\Test\SMT_ws12R2_amd64 -Destination \\srv2012-nug\c$\Test


#--> complete steps on SRV2012-Test (source machine) before going further <--#
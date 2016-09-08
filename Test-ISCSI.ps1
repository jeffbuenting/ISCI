#------------------------------------------------------------------------------------------
# ISCSI Module
# 
# Cmdlets for ISCSI
#------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------
# Function Enable-ISCSI
#
# Enables ISCSI on the server
#------------------------------------------------------------------------------------------

Function Enable-ISCSI

{
	param ( $ComputerName = '.',
			$Debug = $false )
			
	# ----- Start the service if needed
	if ( (Get-Service -ComputerName $ComputerName -Name MSISCSI).status -eq 'Stopped' ) { 
		Start-Service -ComputerName $ComputerName -Name MSISCSI
	}
}

#------------------------------------------------------------------------------------------
# Function Discover-ISCSIPortal
#
# Sets the ISCSI Portal
#------------------------------------------------------------------------------------------

Function Discover-ISCSIPortal

{
	param ( $ComputerName = '.',
			$ISCSIPortal,
			$CHAPName,
			$CHAPPassword,
			$Debug )
			
	Invoke-Command -ComputerName $Comutername -ScriptBlock -ArgumentList $ISCSIPortal, $CHAPName, $CHAPPassword { 'c:\windows\system32\iscsicli.exe /qaddtargetportal $ISCSIPortal, $CHAPName, $CHAPPassword' } 
}		










# 2
# & 'c:\windows\system32\iscsicli.exe'


#------------------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------------------

Export-ModuleMember -Function Enable-ISCSI, Discover-ISCSIPortal
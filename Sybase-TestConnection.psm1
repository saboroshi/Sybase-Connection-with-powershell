<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 04. 15:05
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	PostgreSQL-TestConnection.psm1
	 Description:
	 ReleaseNotes:
	 Version:		1.0
	-------------------------------------------------------------------------
	 Module Name: 	PostgreSQL-TestConnection
	===========================================================================
#>

function Sybase-TestConnection
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
        $IP = "",
        $Port = "",
		$DBName = ""
	)
	$ErrorActionPreference = 'Stop'
	try
	{
		$Connection = New-Object System.Data.Odbc.OdbcConnection
	    $Connection.ConnectionString = "driver={Adaptive Server Enterprise};dsn=$Server;db=$DBName;na=$IP,$Port;uid=$Username;pwd=$Password;"
		$Connection.Open()
		$true
	}
	catch
	{
		$false
	}
	finally
	{
		$Connection.Close()
	}
}

# Export-ModuleMember Sybase-TestConnection






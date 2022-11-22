<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 04. 15:05
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	PostgreSQL-Connection.psm1
	 Description:
	 ReleaseNotes:
	 Version:		1.0
	-------------------------------------------------------------------------
	 Module Name: 	PostgreSQL-Connection
	===========================================================================
#>

function Sybase-Connect
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
        $Port = "",
        $IP = "",
		$DBName = "",
		$Query = ""
	)
	$Connection = New-Object System.Data.Odbc.OdbcConnection
	$Connection.ConnectionString = "driver={Adaptive Server Enterprise};dsn=$Server;db=$DBName;na=$IP,$Port;uid=$Username;pwd=$Password;"
	$Cmd = New-Object System.Data.Odbc.OdbcCommand
	$Cmd.CommandText = $Query
	$Cmd.Connection = $Connection
	$Adapter = New-Object System.Data.Odbc.OdbcDataAdapter         
	$Adapter.SelectCommand = $Cmd
	$DataSet = New-Object System.Data.DataSet
	$Adapter.Fill($DataSet)
	$DataSet.Tables[0]
	$Connection.Close()
}

# Export-ModuleMember Sybase-Connection






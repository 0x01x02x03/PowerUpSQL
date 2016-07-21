# PowerUpSQL Pester Tests

######################################################
#
#region           Discovery Function Tests
#
######################################################

<#
Get-SQLInstanceDomain              
Get-SQLInstanceFile                
Get-SQLInstanceLocal               
Get-SQLInstanceScanUDP             
Get-SQLInstanceScanUDPThreaded  
#>

#endregion

######################################################
#
#region           Primary Attack Function Tests
#
######################################################

<#
Invoke-SQLDumpInfo   
Invoke-SQLAudit               
Invoke-SQLEscalatePriv  
#>

#endregion

######################################################
#
#region           Core Function Tests
#
######################################################

# Invoke-SQLOSCmd 
Describe "Invoke-SQLOSCmd" {
    It "Should return results for the local host with query" {
        if ( (Invoke-SQLOSCmd -Command "whoami" | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Invoke-SQLOSCmd  -Instance $env:COMPUTERNAME -Command "whoami" | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Invoke-SQLOSCmd   -Instance $env:COMPUTERNAME -Command "whoami" -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -TimeOut argument" {
        if ( (Invoke-SQLOSCmd  -Instance $env:COMPUTERNAME -TimeOut 5 -Command "whoami" | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
    It "Should accept -Threads argument" {
        if ( (Invoke-SQLOSCmd  -Instance $env:COMPUTERNAME -Threads 5 -Command "whoami" | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
   It "Should accept -DAC flag" {
        if ( (Invoke-SQLOSCmd  -Instance $env:COMPUTERNAME -DAC -Command "whoami" | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Invoke-SQLOSCmd  -Command "whoami"  | Measure-Object).count -lt 1) {
            Throw "Incorrect OS command results returned"
        }
    }
}

# Get-SQLQuery
Describe "Get-SQLQuery" {
    It "Should return results for the local host with query" {
        if ( (Get-SQLQuery -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLQuery -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLQuery  -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -Database argument" {
        if ( (Get-SQLQuery -Instance $env:COMPUTERNAME -Database "master" -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
    It "Should accept -TimeOut argument" {
        if ( (Get-SQLQuery -Instance $env:COMPUTERNAME -TimeOut 5 -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
   It "Should accept -DAC flag" {
        if ( (Get-SQLQuery -Instance $env:COMPUTERNAME -DAC -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLQuery -Query "SELECT @@SERVERNAME"  | Measure-Object).count -lt 1) {
            Throw "Incorrect query results returned"
        }
    }
}

# Get-SQLQueryThreaded
Describe "Get-SQLQueryThreaded" {
    It "Should return results for the local host with query" {
        if ( (Get-SQLQueryThreaded -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLQueryThreaded -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLQueryThreaded  -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -Database argument" {
        if ( (Get-SQLQueryThreaded -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" -Database "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
    It "Should accept -TimeOut argument" {
        if ( (Get-SQLQueryThreaded -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" -TimeOut 5  | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
    It "Should accept -Threads argument" {
        if ( (Get-SQLQueryThreaded -Instance $env:COMPUTERNAME -Query "SELECT @@SERVERNAME" -Threads 2 | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
   It "Should accept -DAC flag" {
        if ( (Get-SQLQueryThreaded -Instance $env:COMPUTERNAME -DAC -Query "SELECT @@SERVERNAME" | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLQueryThreaded -Query "SELECT @@SERVERNAME" -Threads 2  | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded query results returned"
        }
    }
}

# Get-SQLConnectionTest
Describe "Get-SQLConnectionTest" {
    It "Should return results for the local host" {
        if ( (Get-SQLConnectionTest | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLConnectionTest -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLConnectionTest  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -TimeOut argument" {
        if ( (Get-SQLConnectionTest -Instance $env:COMPUTERNAME -TimeOut 5 | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
   It "Should accept -DAC flag" {
        if ( (Get-SQLConnectionTest -Instance $env:COMPUTERNAME -DAC| Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLConnectionTest | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
}


#Get-SQLConnectionTestThreaded
Describe "Get-SQLConnectionTestThreaded" {
    It "Should return results for the local host" {
        if ( (Get-SQLConnectionTestThreaded | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLConnectionTestThreaded -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLConnectionTestThreaded  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -TimeOut argument" {
        if ( (Get-SQLConnectionTestThreaded -Instance $env:COMPUTERNAME -TimeOut 5 | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept -Threads argument" {
        if ( (Get-SQLConnectionTestThreaded -Instance $env:COMPUTERNAME -Threads 5 | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
   It "Should accept -DAC flag" {
        if ( (Get-SQLConnectionTestThreaded -Instance $env:COMPUTERNAME -DAC| Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLConnectionTestThreaded | Measure-Object).count -lt 1) {
            Throw "Incorrect connection test results returned"
        }
    }
}


#endregion

######################################################
#
#region           Common Function Tests
#
######################################################

<#
Get-SQLColumnSampleDataThreaded 
Get-SQLAuditDatabaseSpec           
Get-SQLAuditServerSpec       
Get-SQLServerConfiguration         
Get-SQLServerCredential            
Get-SQLServerInfo                  
Get-SQLServerInfoThreaded          
Get-SQLServerLink                  
Get-SQLServerLogin                 
Get-SQLServerPriv                  
Get-SQLServerRole                  
Get-SQLServerRoleMember            
Get-SQLServiceAccount              
Get-SQLServiceLocal                
Get-SQLStoredProcedure                           
Get-SQLTriggerDdl                  
Get-SQLTriggerDml                  
#>

# Get-SQLSession
Describe "Get-SQLSession" {
    It "Should return results for the local host with query" {
        if ( (Get-SQLSession  | Measure-Object).count -lt 1) {
            Throw "Incorrect session query results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLSession -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect session query results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLSession -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect session search results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLSession    | Measure-Object).count -lt 1) {
            Throw "Incorrect session query results returned"
        }
    }
}

# Get-SQLSysadminCheck 
Describe "Get-SQLSysadminCheck " {
    It "Should return results for the local host with query" {
        if ( (Get-SQLSysadminCheck  | Measure-Object).count -lt 1) {
            Throw "Incorrect sysadmin check results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLSysadminCheck  -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect sysadmin check results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLSysadminCheck -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect sysadmin search results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLSysadminCheck    | Measure-Object).count -lt 1) {
            Throw "Incorrect sysadmin check results returned"
        }
    }
}

# Get-SQLTable
Describe "Get-SQLTable" {
    It "Should return results for the local host with query" {
        if ( (Get-SQLTable | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLTable -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLTable   -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLTable  -Instance $env:COMPUTERNAME -DatabaseName "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
    It "Should accept -TableName argument" {
        if ( (Get-SQLTable  -Instance $env:COMPUTERNAME -TableName "spt_monitor" | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLTable   | Measure-Object).count -lt 1) {
            Throw "Incorrect table results returned"
        }
    }
}

# Get-SQLView
Describe "Get-SQLView" {
    It "Should return results for the local host with query" {
        if ( (Get-SQLView | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLView -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLView   -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLView  -Instance $env:COMPUTERNAME -DatabaseName "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
    It "Should accept -ViewName argument" {
        if ( (Get-SQLView  -Instance $env:COMPUTERNAME -ViewName "spt_values" | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLView   | Measure-Object).count -lt 1) {
            Throw "Incorrect view results returned"
        }
    }
}

# Get-SQLColumn
Describe "Get-SQLColumn" {
    It "Should return results for the local host" {
        if ( (Get-SQLColumn  | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME -DatabaseName "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -TableName argument" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME -TableName "spt_values" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -ColumnName argument" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME -ColumnName "status" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -ColumnNameSearch argument" {
        if ( (Get-SQLColumn  -Instance $env:COMPUTERNAME -ColumnNameSearch "stat" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLColumn -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLColumn | Measure-Object).count -lt 1) {
            Throw "Incorrect column search results returned"
        }
    }
}

# Get-SQLColumnSampleData
Describe "Get-SQLColumnSampleData" {
    It "Should return results for the local host" {
        if ( (Get-SQLColumnSampleData  | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLColumnSampleData  -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLColumnSampleData  -Instance $env:COMPUTERNAME -Username test -Password test -Keywords "statu" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept -Keywords argument" {
        if ( (Get-SQLColumnSampleData  -Instance $env:COMPUTERNAME -Keywords "statu" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept -SampleSize argument" {
        if ( (Get-SQLColumnSampleData  -Instance $env:COMPUTERNAME -Keywords "statu" -SampleSize 2 | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLColumnSampleData  -Instance $env:COMPUTERNAME -Keywords "statu" -DatabaseName "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLColumnSampleData -Keywords "statu" | Measure-Object).count -lt 1) {
            Throw "Incorrect column search & sample data results returned"
        }
    }
}

# Get-SQLDatabase
Describe "Get-SQLDatabase" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabase | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabase -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabase  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabase -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabase -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept -HasAccess flag" {
        if ( (Get-SQLDatabase -Instance $env:COMPUTERNAME -HasAccess | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
   It "Should accept -SysAdminOnly flag" {
        if ( (Get-SQLDatabase -Instance $env:COMPUTERNAME -SysAdminOnly | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabase | Measure-Object).count -lt 1) {
            Throw "Incorrect database results returned"
        }
    }
}

# Get-SQLDatabasePriv
Describe "Get-SQLDatabasePriv" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabasePriv | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -PermissionName argument" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -PermissionName "EXECUTE" | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -PermissionType argument" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -PermissionType "OBJECT_OR_COLUMN" | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -PrincipalName argument" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -PrincipalName "Public" | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabasePriv -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabasePriv | Measure-Object).count -lt 1) {
            Throw "Incorrect database priv results returned"
        }
    }
}

# Get-SQLDatabaseRole
Describe "Get-SQLDatabaseRole" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabaseRole | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabaseRole -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabaseRole  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabaseRole -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -RolePrincipalName argument" {
        if ( (Get-SQLDatabaseRole -Instance $env:COMPUTERNAME -RolePrincipalName "db_owner" | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -RoleOwner argument" {
        if ( (Get-SQLDatabaseRole -Instance $env:COMPUTERNAME -RoleOwner "sa" | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabaseRole -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabaseRole | Measure-Object).count -lt 1) {
            Throw "Incorrect database role results returned"
        }
    }
}

# Get-SQLDatabaseRoleMember
Describe "Get-SQLDatabaseRoleMember" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabaseRoleMember | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabaseRoleMember -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabaseRoleMember  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabaseRoleMember -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -RolePrincipalName argument" {
        if ( (Get-SQLDatabaseRoleMember -Instance $env:COMPUTERNAME -RolePrincipalName "db_owner" | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -PrincipalName argument" {
        if ( (Get-SQLDatabaseRoleMember -Instance $env:COMPUTERNAME -PrincipalName "dbo" | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabaseRoleMember -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabaseRoleMember | Measure-Object).count -lt 1) {
            Throw "Incorrect database role member results returned"
        }
    }
}

# Get-SQLDatabaseSchema
Describe "Get-SQLDatabaseSchema" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabaseSchema | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabaseSchema -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabaseSchema  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabaseSchema -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
    It "Should accept -SchemaName argument" {
        if ( (Get-SQLDatabaseSchema -Instance $env:COMPUTERNAME -SchemaName "sys" | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }

    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabaseSchema -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabaseSchema | Measure-Object).count -lt 1) {
            Throw "Incorrect database schema results returned"
        }
    }
}

# Get-SQLDatabaseThreaded
Describe "Get-SQLDatabaseThreaded" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabaseThreaded | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabaseThreaded  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME -DatabaseName master | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -HasAccess flag" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME -HasAccess | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
   It "Should accept -SysAdminOnly flag" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME -SysAdminOnly | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept -Threads argument" {
        if ( (Get-SQLDatabaseThreaded -Instance $env:COMPUTERNAME -Threads 2 | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabaseThreaded | Measure-Object).count -lt 1) {
            Throw "Incorrect threaded database results returned"
        }
    }
}

# Get-SQLDatabaseUser
Describe "Get-SQLDatabaseUser" {
    It "Should return results for the local host" {
        if ( (Get-SQLDatabaseUser | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLDatabaseUser -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLDatabaseUser  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -DatabaseName argument" {
        if ( (Get-SQLDatabaseUser -Instance $env:COMPUTERNAME -DatabaseName "master" | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -DatabaseUser argument" {
        if ( (Get-SQLDatabaseUser -Instance $env:COMPUTERNAME -DatabaseUser "dbo" | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -PrincipalName argument" {
        if ( (Get-SQLDatabaseUser -Instance $env:COMPUTERNAME -PrincipalName "sa" | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept -NoDefaults flag" {
        if ( (Get-SQLDatabaseUser -Instance $env:COMPUTERNAME -NoDefaults | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLDatabaseUser | Measure-Object).count -lt 1) {
            Throw "Incorrect database user results returned"
        }
    }
}

#endregion

######################################################
#
#region           Audit Function Tests
#
######################################################

<#                   
Invoke-SQLAuditPrivCreateProcedure 
Invoke-SQLAuditPrivDbChaining      
Invoke-SQLAuditPrivImpersonateLogin
Invoke-SQLAuditPrivServerLink      
Invoke-SQLAuditPrivTrustworthy     
Invoke-SQLAuditPrivXpDirtree       
Invoke-SQLAuditRoleDbDdlAdmin      
Invoke-SQLAuditRoleDbOwner         
Invoke-SQLAuditSampleDataByColumn  
Invoke-SQLAuditWeakLoginPw          
#>

#endregion

######################################################
#
#region           Persistence Function Tests
#
######################################################

# No function have been written yet.

#endregion

######################################################
#
#region           Password Recovery Function Tests
#
######################################################

# No function have been written yet.

#endregion

######################################################
#
#region           Data Exfiltration Function Tests
#
######################################################

# No function have been written yet.

#endregion

######################################################
#
#region           Utility Function Tests
#
######################################################

<#
Create-SQLFileXpDll 
#>

# Get-SQLFuzzDatabaseName
Describe "Get-SQLFuzzDatabaseName" {
    It "Should return results for the local host" {
        if ( (Get-SQLFuzzDatabaseName | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz database name results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLFuzzDatabaseName -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz database name results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLFuzzDatabaseName -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz database name results returned"
        }
    }
    It "Should accept -StartId and -EndId arguments" {
        if ( (Get-SQLFuzzDatabaseName -Instance $env:COMPUTERNAME -StartID 1 -EndId 500 | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz database name results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLFuzzDatabaseName | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz database name results returned"
        }
    }
}

# Get-SQLFuzzDomainAccount
# Note: Need to be on a domain.
Describe "Get-SQLFuzzDomainAccount" {
    It "Should return results for the local host" {
        if ( (Get-SQLFuzzDomainAccount | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz domain account name results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLFuzzDomainAccount -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz domain account name results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLFuzzDomainAccount  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz domain account name results returned"
        }
    }
    It "Should accept -StartId and -EndId arguments" {
        if ( (Get-SQLFuzzDomainAccount -Instance $env:COMPUTERNAME -StartID 500 -EndId 550 | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz domain account name results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLFuzzDomainAccount | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz domain account name results returned"
        }
    }
}

# Get-SQLFuzzObjectName
# Note: This function requires a login with the sysadmin role.
Describe "Get-SQLFuzzObjectName" {
    It "Should return results for the local host" {
        if ( (Get-SQLFuzzObjectName | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz object name results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLFuzzObjectName -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz object name results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLFuzzObjectName  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz object name results returned"
        }
    }
    It "Should accept -StartId and -EndId arguments" {
        if ( (Get-SQLFuzzObjectName -Instance $env:COMPUTERNAME -StartID 1 -EndId 50 | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz object name results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLFuzzObjectName | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz object name results returned"
        }
    }
}

# Get-SQLFuzzServerLogin
Describe "Get-SQLFuzzServerLogin" {
    It "Should return results for the local host" {
        if ( (Get-SQLFuzzServerLogin | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz sql login name results returned"
        }
    }
    It "Should accept -Instance argument" {
        if ( (Get-SQLFuzzServerLogin -Instance $env:COMPUTERNAME | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz sql login name results returned"
        }
    }
    It "Should accept -Username and -Password arguments" {
        if ( (Get-SQLFuzzServerLogin  -Instance $env:COMPUTERNAME -Username test -Password test | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz sql login name results returned"
        }
    }
    It "Should accept -StartId and -EndId arguments" {
        if ( (Get-SQLFuzzServerLogin -Instance $env:COMPUTERNAME -StartID 1 -EndId 50 | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz sql login name results returned"
        }
    }
    It "Should accept pipeline input" {
        if ( ( Get-SQLInstanceLocal | Get-SQLFuzzServerLogin | Measure-Object).count -lt 1) {
            Throw "Incorrect fuzz sql login name results returned"
        }
    }
}


#endregion

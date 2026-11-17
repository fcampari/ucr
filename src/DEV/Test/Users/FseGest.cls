Class DEV.Test.Users.FseGest Extends %RegisteredObject
{

/// Description
ClassMethod run(database As %String, name As %String, password As %String, resourcesCustom As %String = "") As %Status
{
    Set sc = $$$OK
    new $namespace

    TSTART

    Try {
        zn "DEV"
        set monitorResources = "%Ens_Jobs:R,%Ens_Queues:R,%Ens_Dashboard:U,%Ens_Alerts:R,"
        Set Resources = "%DB_TEST:R,%DB_DEV:R,%DB_ENSLIB:R,%DB_HSLIB:R,%DB_HSSYS:R,%DB_IRISLIB:R,%DB_IRISSYS:RW,%DB_IRISAUDIT:R,%DB_IRISTEMP:R,%Development:U,%Ens_EventLog:U,%Ens_MessageContent:U,%Ens_MessageHeader:U,%Ens_MessageTrace:U,%Ens_Portal:U,%Ens_ProductionConfig:R,%Admin_Secure:U,"_ monitorResources _ resourcesCustom
        Do ##class(HS.HC.SystemConfig.API).AddUpdateRole(database, name _ "ROLE", "Utente Tester", Resources, "")

        Set TableList = $LISTBUILD("DEV_Test_Tables.Person")
        Do ##class(HS.HC.SystemConfig.API).SQLGrant(database, "DEV", "Select,Insert,Update", "Table", TableList, name _ "ROLE")
        
        Set TableList = $LISTBUILD("Ens.messageHeader","Ens.MessageBody")
        Do ##class(HS.HC.SystemConfig.API).SQLGrant(database, "DEV", "Select", "Table", TableList, name _ "ROLE")

        Set SchemaList = $LISTBUILD("DEV_Test")
        Do ##class(HS.HC.SystemConfig.API).SQLGrant(database, "DEV", "Select", "Schema", SchemaList, name _ "ROLE")

        Set SchemaList = $LISTBUILD("TEST")
        Do ##class(HS.HC.SystemConfig.API).SQLGrant(database, "TEST", "Select", "Schema", SchemaList, name _ "ROLE")

        /*
        &sql(GRANT SELECT, INSERT ON SCHEMA IAI TO GESTROLE)
        Write "SQLCODE: " _ SQLCODE _ ", DESCRIPTION: "_ $SYSTEM.SQL.Functions.SQLCODE(SQLCODE),!
        if (SQLCODE < 0){
            $$$ThrowSQLCODE(SQLCODE,$SYSTEM.SQL.Functions.SQLCODE(SQLCODE))
        }
        */
        //zn "%SYS"
        //Set sc = ##class(Security.Users).Create(name,name _ "ROLE",password,name,"DEV","","",0,1,"","1","","",.attributes,1,1,"SHA512", 10000)
        //If $$$ISERR(sc) Quit
    }
    Catch CatchError {
        #dim CatchError as %Exception.SystemException
        Set sc=CatchError.AsStatus()
    }

    If $$$ISERR(sc) {
        Write /SGR("33;1"), !, "Creazione fallita con seguente errore: " _ $SYSTEM.Status.GetErrorText(sc), /SGR(0)
        TROLLBACK 1
    } Else {
        Write !, "Creazione OK"
        TCOMMIT
    }

    Quit sc
}

}

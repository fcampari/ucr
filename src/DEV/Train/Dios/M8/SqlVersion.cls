Class DEV.Train.Dios.M8.SqlVersion Extends %RegisteredObject
{

/// same SQl query with different method - table=DEV_Bi_SourceTables.Patient - id from 1 to 7
ClassMethod Query(id As %Integer) As %String
{
    Set sc = "OK"
    //Embedded SQL
    &sql(SELECT Name INTO :n FROM DEV_Bi_SourceTables.Patient WHERE ID = :id )
    IF SQLCODE<0 {WRITE "SQLCODE error ",SQLCODE  RETURN %msg}
    ELSEIF SQLCODE=100 {WRITE "Query returns no results"  RETURN "KO"}
    WRITE "patient Name -E = "_n
    
    //Dynamic SQL
    Set rs = ##class(%SQL.Statement).%ExecDirect(,"SELECT Name FROM DEV_Bi_SourceTables.Patient WHERE ID = ?", id)
    While rs.%Next() {
        if (rs.%SQLCODE < 0) {
            //code if loop ends due to error
        }
        elseif (rs.%SQLCODE = 100) {
            //code to run after reaching end of data
        }
        Write !,"patient Name -D = "_rs.Name
    }

    //ClassQuery
    set statement = ##class(%SQL.Statement).%New()
    set status = statement.%PrepareClassQuery("DEV.Train.Dios.M8.ClassQuery","ById")
    set rset = statement.%Execute(id)
    //set rset = ##class(DEV.Bi.SourceTables.Patient).ByIdFunc(id)
    while rset.%Next() {
        write !, "patient Name -CQ = "_rset.%Get("Name"),!
    }
    Return sc
}

}

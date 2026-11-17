Class DEV.Train.Dios.M8.ClassQuery Extends %SQLQuery
{

/// Description
Query ById(id As %Integer) As %SQLQuery(ROWSPEC = "ID:%Integer,Name,LastName, City") [ SqlProc ]
{
    SELECT ID, Name, LastName, City
    FROM DEV_Bi_SourceTables.Patient 
    WHERE ID = :id
}

}

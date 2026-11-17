Class DEV.FHIR.Server.Indexer Extends HS.FHIRServer.Storage.JsonAdvSQL.Indexer
{

Method AddToSearchTableEntry(searchColumn As HS.FHIRServer.Storage.Json.SearchColumn, pValue As %String)
{
    if pValue=""{
        return
    }
    else{
        Do ##super(searchColumn, pValue)
    }
}

}

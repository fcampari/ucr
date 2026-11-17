Class DEV.Bo.SQL.JDBC.ExternalIris Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Parameter INVOCATION = "Queue";

Property Query As %String(MAXLEN = "") [ Required ];

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter SETTINGS = {"Query:Data"};

/// Recive Ens.Request (just for trigger the query) and return the columns names for the Query results
/// The query is defined in the BO-settings -> Query
Method OnMessage(pRequest As Ens.Request, Output pResponse As DEV.Messages.Rsp.SQL.QueryRsp) As %Status
{
    Set sc = $$$OK

    Try {
        // execute query on remote DB
        Set sc = ..Adapter.ExecuteQuery(.tResult, ..Query)

        //preparing the response to the BP
        set pResponse = ##class(DEV.Messages.Rsp.SQL.QueryRsp).%New()
        set colCount= tResult.GetColumnCount()
        //get the column names of the query result and insert the names in the response
        If tResult.Next() {
            set i=0
            set resp=""
            while(i < colCount){
                set resp = resp _ ", " _ tResult.GetColumnName(i)
                set i=i+1
            }
            Set pResponse.Response = resp
        } Else {
            // query result has no data
            set pResponse.Response= "no data"
        }     
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        set pResponse.Response = "System Error"
    }

    Return sc
}

}

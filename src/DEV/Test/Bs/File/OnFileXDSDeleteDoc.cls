Class DEV.Test.Bs.File.OnFileXDSDeleteDoc Extends Ens.BusinessService
{

/// Adapter used by this class
Parameter ADAPTER = "EnsLib.File.InboundAdapter";

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// BusinesService custom settings
Parameter SETTINGS = "TargetConfigName";

/// Get the file, create the Production message and send it to the Business Op
Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{
    Set sc = $$$OK
    Try {


        set DeleteReq = ##class(HS.Message.IHE.XDSb.DeleteDocumentSetRequest).%New()
        set RepoID = "1.3.6.1.4.1.21367.2010.1.2.300.1"
        set docID = "2.25.122395944669182750862517157199969793949"
        do DeleteReq.UniqueIdentifiers.SetAt(RepoID,docID)
       
        set sc= ..SendRequestSync(..TargetConfigName, DeleteReq, .pResponse )


    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

}

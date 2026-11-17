Class DEV.Bs.Adapterless.TestService Extends Ens.BusinessService
{

Parameter ADAPTER;

/// Business Host for testing Register request
Property RegisterTargetConfigName As %String(MAXLEN = 1000);

/// Business Host for testing Mail
Property MailTargetConfigName As %String(MAXLEN = 1000);

/// Businese Host configuration settings
Parameter SETTINGS = "RegisterTargetConfigName:Test:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},MailTargetConfigName:Test:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Non serve non ricevendo mai input
Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject) As %Status
{
    Quit $$$OK
}

/// Sending query request
Method XDSQuery() As %Status
{
    Set sc = $$$OK
    Try {
        set request = ##class(HS.Message.IHE.XDSb.QueryRequest).%New()
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Start regsiter test
Method XDSRegister() As %Status
{
    Set sc = $$$OK
    Try {
        set pRequest = ##class(DEV.Messages.Req.Test.Count).%New()
        set pRequest.Count = 1
        do ..SendRequestSync(..RegisterTargetConfigName, pRequest, .pResponse)
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Description
Method Mail() As %Status
{
    Set sc = $$$OK
    Try {
        set pRequest = ##class(DEV.Messages.Req.Test.Count).%New()
        set pRequest.Count = 1
        do ..SendRequestSync(..MailTargetConfigName, pRequest, .pResponse)
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    Return sc
}

// update Connections on Production UI

ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
    Do ##super(.pArray, pItem)
 
    If pItem.GetModifiedSetting("RegisterTargetConfigName", .tValue) {
        For i=1:1:$L(tValue, ",") {
            Set tOne = $ZStrip($P(tValue, ",", i), "<>W")
            Continue:tOne=""
            Set pArray(tOne)=""
        }
    }
}

}

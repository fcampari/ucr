Class DEV.Bs.SQL.JDBC.Init Extends Ens.BusinessService
{

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// BusinesService custom settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Description
Method OnProcessInput() As %Status
{
    Set sc = $$$OK
    Try {
        set request = ##class(DEV.Messages.Req.SQL.Init).%New()
        set request.number = 1
        set sc= ..SendRequestSync(..TargetConfigName, request, .response)
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
   
    Return sc
}

ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
    Do ##super(.pArray, pItem)
 
    If pItem.GetModifiedSetting("TargetConfigName", .tValue) {
        For i=1:1:$L(tValue, ",") {
            Set tOne = $ZStrip($P(tValue, ",", i), "<>W")
            Continue:tOne=""
            Set pArray(tOne)=""
        }
    }
}

}

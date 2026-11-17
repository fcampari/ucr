Class DEV.Bp.TestProcess Extends Ens.BusinessProcess
{

/// use this setting to select the test you wnat to perform
Property Test As %String(DISPLAYLIST = ",XDSbProvide&Register,XDSbRegister", VALUELIST = ",pnr,reg");

/// Description
Property PnRPOperation As %String;

Parameter SETTINGS = "Test:Basic,PnROperation:PnRsettings";

/// Description
Method OnRequest(request As DEV.Messages.Req.Test.Start, Output response As %Library.Persistent) As %Status
{
    Set sc = $$$OK
    Try {
        if ..Test="pnr"{ set sc = ..ProvideAndRegisterTest()}
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    Return sc
}

ClassMethod ProvideAndRegisterTest() As %Status
{
    Set sc = $$$OK
    Try {
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

Storage Default
{
<Data name="TestProcessDefaultData">
<Subscript>"TestProcess"</Subscript>
<Value name="1">
<Value>Test</Value>
</Value>
<Value name="2">
<Value>PnRProp</Value>
</Value>
<Value name="3">
<Value>PnRPOperation</Value>
</Value>
</Data>
<DefaultData>TestProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

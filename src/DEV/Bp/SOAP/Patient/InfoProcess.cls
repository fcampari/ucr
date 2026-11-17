Class DEV.Bp.SOAP.Patient.InfoProcess Extends Ens.BusinessProcess
{

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// Busiens Host configuration settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Description
Method OnRequest(pRequest As DEV.Messages.Req.SOAP.Patient.InfoGet, Output pResponse As DEV.Messages.Rsp.SOAP.Patient.InfoResponse) As %Status
{
    Set sc = $$$OK
    Try {
        set patientInfo = ##class(DEV.Bi.SourceTables.Patient).%OpenId(pRequest.PatientID)
        if $ISOBJECT(patientInfo){
            set pResponse = ##class(DEV.Messages.Rsp.SOAP.Patient.InfoResponse).%New()
            set pResponse.Name = patientInfo.Name
            set pResponse.LastName = patientInfo.LastName
            $$$LOGINFO("Data retrived - Name: " _ patientInfo.Name _" LastName: "_patientInfo.LastName)
            Set tSC = ..SendRequestSync(..TargetConfigName, pRequest, .boResp)
        }else{
            Throw ##class(%Exception.General).%New("No patient found",999,,"MyThrow")
        }
    }
    Catch ex {
        Set sc=ex.AsStatus()
        $$$LOGINFO(sc)
    }
    Return sc
}

// update Connectio on Production UI

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

Storage Default
{
<Data name="InfoProcessDefaultData">
<Subscript>"InfoProcess"</Subscript>
<Value name="1">
<Value>TargetConfigName</Value>
</Value>
</Data>
<DefaultData>InfoProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

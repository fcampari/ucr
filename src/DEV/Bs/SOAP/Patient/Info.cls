/// SOAP service 
/// Production: DEV.Bs.SOAP.Patient.Info -> DEV.Bp.SOAP.Patient.InfoProcess
/// URL: https://devhost2.com:443/hc/csp/dev/soap/patientInfo/DEV.Bs.SOAP.Patient.Info.cls
///     
Class DEV.Bs.SOAP.Patient.Info Extends EnsLib.SOAP.Service
{

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

Parameter ADAPTER;

Parameter SERVICENAME = "PatientInfoService";

Parameter NAMESPACE = "http://www.mypatient.org";

Parameter USECLASSNAMESPACES = 1;

Parameter XMLIGNOREINVALIDTAG = 1;

/// Busiens Host configuration settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Get patient info based on ID.
/// SOAP Reuqest example: 
///     <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
///     <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
///                      xmlns:myp="http://www.mypatient.org">
///       <soapenv:Header/>
///       <soapenv:Body>
///          <myp:Get>
///             <myp:patientID>1
///             </myp:patientID>
///             <myp:tag1>
///                <myp:a>1</myp:a>
///                <myp:b>
///                    <myp:c>1</myp:c>
///                </myp:b>
///             </myp:tag1>
///          </myp:Get>
///       </soapenv:Body>
///     /soapenv:Envelope>
/// 
Method Get(patientID As %Integer) As DEV.Messages.Rsp.SOAP.Patient.InfoResponse [ WebMethod ]
{
    Try {
        //Soap response returned by the service
        set response = ##class(DEV.Messages.Rsp.SOAP.Patient.InfoResponse).%New()

        //get stream of SOAP request 
        do %request.Content.Rewind()
        set soapReqStream = %request.Content
        //converting into Production request end send it to the process
        set pRequest=##class(DEV.Messages.Req.SOAP.Patient.InfoGet).%New()
        set pRequest.PatientID = patientID
        set pRequest.SoapBody=soapReqStream.Read(500)
        // sending to BP responsible for retriving paitient Info
        Set tSC = ..SendRequestSync(..TargetConfigName, pRequest, .pResponse)

        //if there is a patient
        if $ISOBJECT(pResponse){
            // adding custom header to response - demo purpose
            set respHeader = ##class(DEV.SOAP.Headers.PatientInfo.Response).%New()
            set respHeader.PatientResponse = "OK"
            do ..HeadersOut.SetAt(respHeader,"patinetHeader")
            set response.Name = pResponse.Name
            set response.LastName = pResponse.LastName
        }else{
            Throw ##class(%Exception.General).%New("No patient found",999,,"MyThrow")
        }
    }
    Catch ex {
        // catching system errors
        Set sc=ex.AsStatus()
        do ..ReturnMethodStatusFault(sc)
    }
    Return response
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

}

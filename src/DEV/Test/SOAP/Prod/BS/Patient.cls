/*
SOAP Service inside production
Request example for testing:
    POST https://devhost2.com:443/hc/csp/mysoap/DEV.Test.SOAP.Prod.BS.Patient.cls HTTP/1.1
    Accept-Encoding: gzip,deflate
    Content-Type: text/xml;charset=UTF-8
    SOAPAction: "http://www.mypatient.org/DEV.Test.SOAP.Prod.BS.Patient.GetPatient"
    Content-Length: 304
    Host: devhost2.com:443
    Connection: Keep-Alive
    User-Agent: Apache-HttpClient/4.5.5 (Java/17.0.12)

    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:myp="http://www.mypatient.org">
    <soapenv:Header/>
    <soapenv:Body>
        <myp:GetPatient>
            <!--Optional:-->
            <myp:id>42</myp:id>
        </myp:GetPatient>
    </soapenv:Body>
    </soapenv:Envelope>

set the <myp:id> tag equal to Error will trigger a custom SOAP error (<myp:id>Error</myp:id>)
*/

Class DEV.Test.SOAP.Prod.BS.Patient Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

Parameter SERVICENAME = "PatietnService";

Parameter NAMESPACE = "http://www.mypatient.org";

// Parameter SOAPHEADERS = "csp:CSPCHD:DEV.Test.SOAP.Headers.SessionHeader";

Parameter SOAPSESSION = 1;

Method GetPatient(id As %String) As DEV.Test.SOAP.Prod.Messages.PatientSOAPResponse [ WebMethod ]
{
    Try {
        $$$LOGINFO("Session Timeout: " _ %session.AppTimeout _ "sec")
        set SessionHeader = ..HeadersIn.Count()
        $$$LOGINFO("SH" _ SessionHeader)
        if (%session.NewSession = 1){
            $$$LOGINFO("new session")
            $$$LOGINFO("session: " _ %session.CSPSessionCookie)
            }

        set respSOAP = ##class(DEV.Test.SOAP.Prod.Messages.PatientSOAPResponse).%New()
        if (id="Error"){
            set ex = ##class(DEV.Exception.SOAP.PatientErrorString).%New()
            set ex.Location = "Method GetPatient"
            set ex.Data = "'Error' is not a valid request argument "
            set ex.Name = "Invalid argument"
            set ex.Code = "424242"
            throw ex
        }
        set respSOAP.FullName = "Jhon Smith"
        set respSOAP.DOB = "10/07/92"
        set respSOAP.Facility = "Niguarda"
        set respSOAP.ID = id

        
    }
    Catch ex {
      set fault = ..MakeFault(ex.Code,ex.Name,ex.Data,ex.Location)
      do ..ReturnFault(fault)
    }

    Quit respSOAP
}

}

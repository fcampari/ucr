Class DEV.Bo.File.SOAPOut Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

/// Description
Method OnMessage(pRequest As DEV.Messages.Req.SOAP.Patient.InfoGet, Output pResponse As Ens.StringResponse) As %Status
{
    Set sc = $$$OK
    Set pResponse = ##class(Ens.StringResponse).%New()
    Try {
        
        set reader = ##class(%XML.Reader).%New()
        Set sc = reader.OpenString(pRequest.SoapBody, "literal")

        set outWriter = ##class(%XML.Writer).%New()
        // enable pretty-print formatting (indentation)
        set outWriter.Indent=1
        set sc=outWriter.OutputToFile(..Adapter.FilePath_"patientInfo.xml")
         if $$$ISERR(sc)  quit
        // write the formatted XML document to the file
        set sc = outWriter.Document(reader.Document)

        set pResponse.StringValue = "OK"  
    }
    Catch ex {
        Set sc=ex.AsStatus()
        $$$LOGSTATUS(sc)
        set pResponse.StringValue = "KO"
    }
    Return sc
}

}

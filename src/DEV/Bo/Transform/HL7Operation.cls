Class DEV.Bo.Transform.HL7Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

/// Description
Property TargetPath As %String(MAXLEN = 1000);

/// Mapping method to the request recived
XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StreamContainer">
    <Method>WriteToOut</Method>
  </MapItem>
</MapItems>
}

/// Writing Bp request to file system
Method WriteToOut(pRequest As Ens.StreamContainer, Output pResponse As Ens.StringResponse) As %Status
{
    Set sc = $$$OK
    Set pResponse = ##class(Ens.StringResponse).%New()

    Try {

        // create an XML Reader to parse the input stream 
        set outReader = ##class(%XML.Reader).%New()
        set sc = outReader.OpenStream(pRequest.Stream)
        if $$$ISERR(sc) do $system.Status.DisplayError(sc) quit
        // get the XML Document Object Model (DOM)
        set outDoc = outReader.Document
        // create an XML Writer for outputting the formatted XML
        set outWriter = ##class(%XML.Writer).%New()
        // enable pretty-print formatting (indentation)
        set outWriter.Indent=1


        set sc=outWriter.OutputToFile(..Adapter.FilePath_"MessageOut.xml")
        if $$$ISERR(sc)  quit
        // write the formatted XML document to the file
        set sc = outWriter.Document(outDoc)
        if $$$ISERR(sc)  quit

        // set ..Adapter.FilePath = $GET(..TargetPath,"/tmp")
        // set sc = ..Adapter.PutStream("MessageOut.xml",pRequest.Stream)
        if '$$$ISERR(sc){
            set pResponse.StringValue = "OK - file saved"
        }
    }
    Catch ex {
        Set sc = ex.AsStatus()
        $$$LOGSTATUS(sc)
        Set pResponse.StringValue = sc
    }
    Return sc
}

}

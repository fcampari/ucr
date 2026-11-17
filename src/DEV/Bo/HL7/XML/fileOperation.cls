/*
This BO recive an  HL7 (Stream, EnsLib ...) and write it to the file Systems
Standard Produciotn Flow: DEV.Bs.HL7.XML.FileService -> DEV.Bp.HL7.XML.CDAExtraction -> DEV.Bo.HL7.XML.fileOperation
*/

Class DEV.Bo.HL7.XML.fileOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Parameter INVOCATION = "Queue";

/// Hl7Schema used to create XML when reciving EnsLib.Hl7.Message 
Property HL7Scehma As %String(MAXLEN = 1000);

/// Description
Parameter SETTINGS = "HL7Scehma:Basic:selector?context={Ens.ContextSearch/SchemaCategories?host=EnsLib.HL7.Service.Standard}";

/// Mapping method to the request recived
XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.StreamContainer">
    <Method>WriteStreamToOut</Method>
  </MapItem>
  <MapItem MessageType="EnsLib.HL7.Message">
    <Method>WriteEnsToOut</Method>
  </MapItem>
</MapItems>
}

/// Writing Bp request to file system
Method WriteStreamToOut(pRequest As Ens.StreamContainer, Output pResponse As Ens.StringResponse) As %Status
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

        if $$$ISERR(sc){
          quit
        } else{
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

/// Write EnsLib.Hl7.Message to the file system
Method WriteEnsToOut(pRequest As EnsLib.HL7.Message, Output pResponse As Ens.StringResponse) As %Status
{
    Set sc = $$$OK
    Set pResponse = ##class(Ens.StringResponse).%New()

    Try {

        set msgType = pRequest.GetValueAt("MSH:9.3")
        set pRequest.DocType= ..HL7Scehma_":"_msgType
        set hl7XmlStream = ##class(ITB.HL7.Util.Convert).ER7ToXML(pRequest, .sc,)

        // create an XML Reader to parse the input stream 
        set outReader = ##class(%XML.Reader).%New()
        set sc = outReader.OpenStream(hl7XmlStream)
        if $$$ISERR(sc) do $system.Status.DisplayError(sc) quit

        // get the XML Document Object Model (DOM)
        set outDoc = outReader.Document

        // create an XML Writer for outputting the formatted XML
        set outWriter = ##class(%XML.Writer).%New()

        // XML indentation
        set outWriter.Indent=1

        set sc=outWriter.OutputToFile(..Adapter.FilePath_"Hl7.xml")
        if $$$ISERR(sc)  quit

        // write the formatted XML document to the file
        set sc = outWriter.Document(outDoc)

        if $$$ISERR(sc){
          quit
        } else{
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

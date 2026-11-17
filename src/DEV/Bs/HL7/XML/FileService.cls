/*
This BS Get the HL7 in XML format and send ti to the BH defiend in the property TargetConfigName.
If needed it is possible to save the XML response to the file System in the directory defined
in the property OutputPath (for that you need to flag the SaveResponse setting)
Standard Produciotn Flow: DEV.Bs.HL7.XML.FileService -> DEV.Bp.HL7.XML.CDAExtraction -> DEV.Bo.HL7.XML.fileOperation
*/

Class DEV.Bs.HL7.XML.FileService Extends Ens.BusinessService
{

/// Adapter used by this class
Parameter ADAPTER = "EnsLib.File.InboundAdapter";

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// Path to directory to write the ACK response
Property OutputPath As %String(MAXLEN = 1000) [ InitialExpression = "/home/InterSystems/allegati/OutFile.xml" ];

/// Flag wheter save the resposne to file system or not 
Property SaveResponse As %Boolean [ InitialExpression = 0 ];

/// BusinesService custom settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},OutputPath:Basic:directorySelector,SaveResponse";

/// Get the file, create the Production message and send it to the Business Process
Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{
    Set sc = $$$OK
    Try {

        set hl7GlobalStream = ##class(%Stream.GlobalCharacter).%New()
        do hl7GlobalStream.CopyFromAndSave(pInput)

        do hl7GlobalStream.Rewind()

        set hl7MessageEr7 = ##class(ITB.HL7.Util.Convert).XMLToER7(hl7GlobalStream, .sc, "2.3.1")

        $$$LOGINFO(hl7MessageEr7.RawContentGet())

        set messageStream = ##class(Ens.StreamContainer).%New()
        set messageStream.Stream = hl7GlobalStream
        
        set pSc= ..SendRequestSync(..TargetConfigName, messageStream, .pResponse )

        
        if ..SaveResponse {
            //write the ACK response to file
            // create an XML Reader to parse the input ACK stream 
            set ackReader = ##class(%XML.Reader).%New()
            set sc = ackReader.OpenStream(pResponse.Stream)
            if $$$ISERR(sc) do $system.Status.DisplayError(sc) quit
            // get the XML Document Object Model (DOM)
            set ackDoc = ackReader.Document
            // create an XML Writer for outputting the formatted XML
            set ackWriter = ##class(%XML.Writer).%New()
            // enable pretty-print formatting (indentation)
            set ackWriter.Indent=1
            set sc=ackWriter.OutputToFile(..OutputPath_"ACKResponse.xml")
            
            if $$$ISERR(sc) $$$LOGSTATUS(sc) quit
            // write the formatted XML document to the file
            set sc = ackWriter.Document(ackDoc)
            if $$$ISERR(sc)   quit 
        }

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    Return sc
}

}

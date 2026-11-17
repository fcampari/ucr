Class DEV.Bs.Transform.HL7Service Extends Ens.BusinessService
{

/// Adapter used by this class
Parameter ADAPTER = "EnsLib.File.InboundAdapter";

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// Output file path 
Property OutputPath As %String(MAXLEN = 1000) [ InitialExpression = "/home/InterSystems/allegati/OutFile.xml" ];

/// BusinesService custom settings
Parameter SETTINGS = "TargetConfigName,OutputPath";

/// Get the file, create the Production message and send it to the Business Process
Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{
    Set sc = $$$OK
    Try {

        set GlobalStream = ##class(%Stream.GlobalCharacter).%New()
        do GlobalStream.CopyFromAndSave(pInput)

        set fileString=""
        While 'GlobalStream.AtEnd {
            set fileString = fileString _ GlobalStream.ReadLine() 
        }
        do GlobalStream.Rewind()

        set messageStream = ##class(Ens.StreamContainer).%New()
        set messageStream.Stream = GlobalStream
        set pSc= ..SendRequestSync(..TargetConfigName, messageStream, .pResponse )

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
        set sc=ackWriter.OutputToFile(..OutputPath)
        if $$$ISERR(sc) $$$LOGSTATUS(sc) quit
        // write the formatted XML document to the file
        set sc = ackWriter.Document(ackDoc)
        if $$$ISERR(sc)   quit

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

}

/*
This BS Get the HL7 in XML format from the file system. Transofmorm the HL7 from XML to ER7 using the custom library ITB
creating an instance of  EnsLib.Hl7.Message. Validate the HL7 message and send it to the BH indicated in the TargetConfigName
Use the setting SchemaHl7 to specify the schema against which to validate the HL7 message
*/

Class DEV.Bs.HL7.XML.ValidatingFileService Extends Ens.BusinessService
{

/// Adapter used by this class
Parameter ADAPTER = "EnsLib.File.InboundAdapter";

/// Business Host to send file stream messages
Property TargetConfigName As %String(MAXLEN = 1000);

/// Output file path 
Property OutputPath As %String(MAXLEN = 1000) [ InitialExpression = "/home/InterSystems/allegati/OutFile.xml" ];

/// Flag wheter save the resposne to file system or not 
Property SaveResponse As %Boolean [ InitialExpression = 0 ];

/// Hl7 schema against which to validate the HL7 message. 
/// Must be defiend in IRIS with the Interoperate Schema tools
Property SchemaHl7 As %String [ InitialExpression = "DEV2" ];

/// BusinesService custom settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId},OutputPath:Basic:directorySelector,SaveResponse,SchemaHl7:Validation:selector?context={Ens.ContextSearch/SchemaCategories?host=EnsLib.HL7.Service.Standard}";

/// Get the file, create the Production message and send it to the Business Process
Method OnProcessInput(pInput As %Stream.Object, pOutput As %RegisteredObject) As %Status
{
    Set sc = $$$OK
    Try {

        set hl7GlobalStream = ##class(%Stream.GlobalCharacter).%New()
        do hl7GlobalStream.CopyFromAndSave(pInput)

        do hl7GlobalStream.Rewind()
    
        set hl7MessageEr7 = ##class(ITB.HL7.Util.Convert).XMLToER7(hl7GlobalStream, .sc, "DEV2")
        set msgType = hl7MessageEr7.GetValueAt("MSH:9.3")
        set hl7MessageEr7.DocType= ..SchemaHl7_":"_msgType

        $$$LOGINFO(hl7MessageEr7.RawContent)

        set sc=##class(EnsLib.HL7.Util.Validator).Validate(hl7MessageEr7,"dmr-z")
        if $$$ISERR(sc) quit

        set sc= ..SendRequestSync(..TargetConfigName, hl7MessageEr7, .response)

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    quit sc
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

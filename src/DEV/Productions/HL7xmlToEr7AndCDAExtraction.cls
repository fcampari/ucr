/*
Production that allows you to recive a XML formatted HL7 message, transform that message in pipe encoded HL7 (do some basic DTL transformation on the HL7 message),
get the pdf from the HL7 message,extract the CDA from the PDF, transform the CDA using xslt, 
attach the CDAtrasnformed to the PDF and recreate the XML formatted HL7 message adn send it to the output. 
*/

Class DEV.Productions.HL7xmlToEr7AndCDAExtraction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DEV.Productions.HL7xmlToEr7AndCDAExtraction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DEV.Bs.HL7.XML.FileService" Category="" ClassName="DEV.Bs.HL7.XML.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">DEV.Bp.HL7.XML.CDAExtraction</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\testRepo\In\</Setting>
    <Setting Target="Host" Name="OutputPath">C:\InterSystems\HC\testRepo\Out\</Setting>
    <Setting Target="Adapter" Name="WorkPath">C:\InterSystems\HC\testRepo\IntermediateFiles\</Setting>
  </Item>
  <Item Name="DEV.Bp.HL7.XML.CDAExtraction" Category="" ClassName="DEV.Bp.HL7.XML.CDAExtraction" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="SaveCDA">1</Setting>
    <Setting Target="Host" Name="SavePDF">1</Setting>
    <Setting Target="Host" Name="TargetOperation">DEV.Bo.HL7.XML.fileOperation</Setting>
    <Setting Target="Host" Name="WorkPath">C:\InterSystems\HC\testRepo\IntermediateFiles\</Setting>
  </Item>
  <Item Name="DEV.Bo.HL7.XML.fileOperation" Category="" ClassName="DEV.Bo.HL7.XML.fileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\testRepo\Out\</Setting>
  </Item>
</Production>
}

}

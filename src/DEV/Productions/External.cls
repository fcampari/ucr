Class DEV.Productions.External Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DEV.Productions.External" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DEV.Bs.SOAP.Patient.Info" Category="" ClassName="DEV.Bs.SOAP.Patient.Info" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">DEV.Bp.SOAP.Patient.InfoProcess</Setting>
  </Item>
  <Item Name="DEV.Bp.SOAP.Patient.InfoProcess" Category="" ClassName="DEV.Bp.SOAP.Patient.InfoProcess" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">DEV.Bo.File.SOAPOut</Setting>
  </Item>
  <Item Name="DEV.Bo.File.SOAPOut" Category="" ClassName="DEV.Bo.File.SOAPOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/dur/General/DataOut/File/</Setting>
    <Setting Target="Adapter" Name="Overwrite">1</Setting>
  </Item>
  <Item Name="DEV.Bs.HL7.XML.ValidatingFileService" Category="" ClassName="DEV.Bs.HL7.XML.ValidatingFileService" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="OutputPath">/dur/General/DataOut/HL7/</Setting>
    <Setting Target="Adapter" Name="FilePath">/dur/General/DataIn/HL7/</Setting>
    <Setting Target="Host" Name="TargetConfigName">DEV.Bp.HL7.XML.CDAExtraction</Setting>
  </Item>
  <Item Name="DEV.Bp.HL7.XML.CDAExtraction" Category="" ClassName="DEV.Bp.HL7.XML.CDAExtraction" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DEV.Bo.HL7.XML.fileOperation" Category="" ClassName="DEV.Bo.HL7.XML.fileOperation" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DEV.Bp.Router.HL7Rule" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">DEV.Bp.HL7.RouterRoutingRule</Setting>
  </Item>
  <Item Name="DEV.Bs.HL7.FileInput" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">DEV.Bp.Router.HL7Rule</Setting>
    <Setting Target="Adapter" Name="FilePath">/dur/General/DataIn/HL7/Basic/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Operation.FileOperation2" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/dur/General/DataOut/HL7/Output2/</Setting>
    <Setting Target="Host" Name="Filename">%f_%Q%!+(_a).hl7</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">E=R</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Operation.FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/dur/General/DataOut/HL7/Output1/</Setting>
    <Setting Target="Host" Name="Filename">%f_%Q%!+(_a).hl7</Setting>
  </Item>
  <Item Name="HS.IHE.XDSb.Repository.Operations" Category="" ClassName="HS.IHE.XDSb.Repository.Operations" PoolSize="60" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="XDSbRegistryServiceName">dev2_XDSbRegistry</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="TraceOperations">*FULL*</Setting>
  </Item>
  <Item Name="DEV.Bs.Adapterless.TestService" Category="" ClassName="DEV.Bs.Adapterless.TestService" PoolSize="0" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="RegisterTargetConfigName">DEV.Bp.IHE.RegisterTest</Setting>
    <Setting Target="Host" Name="MailTargetConfigName">DEV.Bo.Mail.Send</Setting>
  </Item>
  <Item Name="DEV.Bp.IHE.RegisterTest" Category="" ClassName="DEV.Bp.IHE.RegisterTest" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">HS.IHE.XDSb.DocumentSource.Operations</Setting>
  </Item>
  <Item Name="HS.IHE.XDSb.DocumentSource.Operations" Category="" ClassName="HS.IHE.XDSb.DocumentSource.Operations" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="XDSbRegistryServiceName">dev2_XDSbRegistry</Setting>
    <Setting Target="Host" Name="XDSbRepositoryServiceName"></Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="DEV.Bo.Mail.Send" Category="" ClassName="DEV.Bo.Mail.Send" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="SMTPPort">587</Setting>
    <Setting Target="Adapter" Name="SMTPServer">smtp.gmail.com</Setting>
    <Setting Target="Adapter" Name="SSLConfig">HS.Secure.Demo*</Setting>
    <Setting Target="Adapter" Name="Credentials">fabriziocampari01@gmail.com</Setting>
    <Setting Target="Adapter" Name="Bcc"></Setting>
    <Setting Target="Adapter" Name="Recipient">fabriziocampari01@gmail.com</Setting>
    <Setting Target="Adapter" Name="From">productionIris@isc.com</Setting>
    <Setting Target="Adapter" Name="Cc"></Setting>
  </Item>
  <Item Name="Ens.Alerting.AlertManager" Category="" ClassName="Ens.Alerting.AlertManager" PoolSize="1" Enabled="false" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}

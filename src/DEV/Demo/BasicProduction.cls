Class DEV.Demo.BasicProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DEV.Demo.BasicProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DEV.Bs.HL7.XML.FileService" Category="" ClassName="DEV.Bs.HL7.XML.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">DEV.Bp.HL7.XML.CDAExtraction</Setting>
    <Setting Target="Host" Name="TargetConfigNames">DEV.Bp.HL7.XML.CDAExtraction</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\data\In\</Setting>
    <Setting Target="Host" Name="OutputPath">C:\InterSystems\HC\data\Ack\</Setting>
    <Setting Target="Host" Name="SaveResponse">1</Setting>
  </Item>
  <Item Name="DEV.Bp.HL7.XML.CDAExtraction" Category="" ClassName="DEV.Bp.HL7.XML.CDAExtraction" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetOperation">DEV.Bo.HL7.XML.fileOperation</Setting>
    <Setting Target="Host" Name="WorkPath">C:\InterSystems\HC\data\Intermediate\</Setting>
    <Setting Target="Host" Name="ReplyCodeActions"></Setting>
  </Item>
  <Item Name="DEV.Bo.HL7.XML.fileOperation" Category="" ClassName="DEV.Bo.HL7.XML.fileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\data\Out\</Setting>
    <Setting Target="Host" Name="ReplyCodeActions">E=F</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Service.FileService" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigNames">DEV.Bp.HL7.Router</Setting>
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\data\HL7in\</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Operation.FileOperation" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\data\HL7Out\</Setting>
  </Item>
  <Item Name="DEV.Bp.HL7.Router" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">DEV.Bp.HL7.RouterRoutingRule</Setting>
  </Item>
  <Item Name="EnsLib.HL7.Operation.FileOperation2" Category="" ClassName="EnsLib.HL7.Operation.FileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">C:\InterSystems\HC\data\HL7Out2\</Setting>
  </Item>
</Production>
}

}

Class DEV.Productions.PocProd Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="DEV.Productions.PocProd" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="DEV.Bs.HL7.XML.ValidatingFileService" Category="" ClassName="DEV.Bs.HL7.XML.ValidatingFileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="TargetConfigName">DEV.Bo.HL7.XML.fileOperation</Setting>
    <Setting Target="Adapter" Name="FilePath">/home/InterSystems/HC/testRepo/In/</Setting>
    <Setting Target="Host" Name="SchemaHl7">DEV2</Setting>
  </Item>
  <Item Name="DEV.Bo.HL7.XML.fileOperation" Category="" ClassName="DEV.Bo.HL7.XML.fileOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="HL7Scehma">DEV2</Setting>
    <Setting Target="Adapter" Name="FilePath">/home/InterSystems/HC/testRepo/Out/</Setting>
  </Item>
</Production>
}

}

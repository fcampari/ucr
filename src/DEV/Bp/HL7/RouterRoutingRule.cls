/// 
Class DEV.Bp.HL7.RouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="DEV.Demo.BasicProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value=""></constraint>
<when condition="1" comment="">
<send transform="DEV.Transform.HL7.ORUTransform" target="EnsLib.HL7.Operation.FileOperation"></send>
<return></return>
</when>
</rule>
<rule name="" disabled="false">
<constraint name="source" value=""></constraint>
<when condition="1" comment="">
<send transform="" target="EnsLib.HL7.Operation.FileOperation2"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}

Class DEV.Messages.Transform.HL7Response Extends (%Persistent, %XML.Adaptor)
{

Property Status As %String;

Property Description As %String;

Storage Default
{
<Data name="HL7ResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Status</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^DEV.Messages.TF308.HL7ResponseD</DataLocation>
<DefaultData>HL7ResponseDefaultData</DefaultData>
<IdLocation>^DEV.Messages.TF308.HL7ResponseD</IdLocation>
<IndexLocation>^DEV.Messages.TF308.HL7ResponseI</IndexLocation>
<StreamLocation>^DEV.Messages.TF308.HL7ResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

Class DEV.Messages.Req.SQL.Init Extends (%Persistent, %XML.Adaptor)
{

/// Description
Property number As %Integer;

Storage Default
{
<Data name="InitDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>number</Value>
</Value>
</Data>
<DataLocation>^DEV.Messages.Req.SQL.InitD</DataLocation>
<DefaultData>InitDefaultData</DefaultData>
<IdLocation>^DEV.Messages.Req.SQL.InitD</IdLocation>
<IndexLocation>^DEV.Messages.Req.SQL.InitI</IndexLocation>
<StreamLocation>^DEV.Messages.Req.SQL.InitS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

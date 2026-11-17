Class DEV.Messages.Req.Test.Count Extends Ens.Request
{

/// Description
Property Count As %Integer;

Storage Default
{
<Data name="CountDefaultData">
<Subscript>"Count"</Subscript>
<Value name="1">
<Value>Count</Value>
</Value>
</Data>
<DefaultData>CountDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

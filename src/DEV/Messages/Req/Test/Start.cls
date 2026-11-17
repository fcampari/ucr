Class DEV.Messages.Req.Test.Start Extends Ens.Request
{

Property Command As %String;

Storage Default
{
<Data name="StartDefaultData">
<Subscript>"Start"</Subscript>
<Value name="1">
<Value>Command</Value>
</Value>
</Data>
<DefaultData>StartDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

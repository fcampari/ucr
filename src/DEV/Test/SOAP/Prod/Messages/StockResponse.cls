Class DEV.Test.SOAP.Prod.Messages.StockResponse Extends (%Persistent, %XML.Adaptor)
{

/// Description
Property StockPrice As %Integer;

Storage Default
{
<Data name="StockResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>StockPrice</Value>
</Value>
</Data>
<DataLocation>^DEV.Test.SOA2D5A.StockResponseD</DataLocation>
<DefaultData>StockResponseDefaultData</DefaultData>
<IdLocation>^DEV.Test.SOA2D5A.StockResponseD</IdLocation>
<IndexLocation>^DEV.Test.SOA2D5A.StockResponseI</IndexLocation>
<StreamLocation>^DEV.Test.SOA2D5A.StockResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

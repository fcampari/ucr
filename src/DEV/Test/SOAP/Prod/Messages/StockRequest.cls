Class DEV.Test.SOAP.Prod.Messages.StockRequest Extends (%Persistent, %XML.Adaptor)
{

/// Description
Property StockName As %String;

Storage Default
{
<Data name="StockRequestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>StockNameName</Value>
</Value>
<Value name="3">
<Value>StockName</Value>
</Value>
</Data>
<DataLocation>^DEV.Test.SOAP2D5A.StockRequestD</DataLocation>
<DefaultData>StockRequestDefaultData</DefaultData>
<IdLocation>^DEV.Test.SOAP2D5A.StockRequestD</IdLocation>
<IndexLocation>^DEV.Test.SOAP2D5A.StockRequestI</IndexLocation>
<StreamLocation>^DEV.Test.SOAP2D5A.StockRequestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

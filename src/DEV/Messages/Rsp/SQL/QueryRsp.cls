Class DEV.Messages.Rsp.SQL.QueryRsp Extends (%Persistent, %XML.Adaptor)
{

/// Description
Property Response As %String(MAXLEN = 1000);

Storage Default
{
<Data name="QueryRspDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Response</Value>
</Value>
</Data>
<DataLocation>^DEV.Messages.Rsp.SQL.QueryRspD</DataLocation>
<DefaultData>QueryRspDefaultData</DefaultData>
<IdLocation>^DEV.Messages.Rsp.SQL.QueryRspD</IdLocation>
<IndexLocation>^DEV.Messages.Rsp.SQL.QueryRspI</IndexLocation>
<StreamLocation>^DEV.Messages.Rsp.SQL.QueryRspS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

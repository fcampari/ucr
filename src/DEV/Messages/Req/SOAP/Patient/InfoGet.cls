Class DEV.Messages.Req.SOAP.Patient.InfoGet Extends (%Persistent, Ens.Util.RequestBodyMethods, %XML.Adaptor)
{

/// ID
Property PatientID As %Integer;

/// Soap Request Body
Property SoapBody As %String(MAXLEN = 500);

Storage Default
{
<Data name="InfoGetDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientID</Value>
</Value>
<Value name="3">
<Value>SoapBody</Value>
</Value>
</Data>
<DataLocation>^DEV.Messages.Req.SFCCF.InfoGetD</DataLocation>
<DefaultData>InfoGetDefaultData</DefaultData>
<IdLocation>^DEV.Messages.Req.SFCCF.InfoGetD</IdLocation>
<IndexLocation>^DEV.Messages.Req.SFCCF.InfoGetI</IndexLocation>
<StreamLocation>^DEV.Messages.Req.SFCCF.InfoGetS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

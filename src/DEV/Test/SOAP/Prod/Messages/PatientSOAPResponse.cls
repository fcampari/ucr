Class DEV.Test.SOAP.Prod.Messages.PatientSOAPResponse Extends (%Persistent, %XML.Adaptor)
{

/// Description
Property FullName As %String;

/// Description
Property DOB As %String;

/// Description
Property ID As %String;

/// Description
Property Facility As %String;

Storage Default
{
<Data name="PatientSOAPResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FullName</Value>
</Value>
<Value name="3">
<Value>DOB</Value>
</Value>
<Value name="4">
<Value>ID</Value>
</Value>
<Value name="5">
<Value>Facility</Value>
</Value>
</Data>
<DataLocation>^DEV.Test.S2D5A.PatientSOAP4100D</DataLocation>
<DefaultData>PatientSOAPResponseDefaultData</DefaultData>
<IdLocation>^DEV.Test.S2D5A.PatientSOAP4100D</IdLocation>
<IndexLocation>^DEV.Test.S2D5A.PatientSOAP4100I</IndexLocation>
<StreamLocation>^DEV.Test.S2D5A.PatientSOAP4100S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

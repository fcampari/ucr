Class DEV.Messages.Rsp.SOAP.Patient.InfoResponse Extends (%Persistent, Ens.Util.RequestBodyMethods, %XML.Adaptor)
{

/// Patient Name
Property Name As %String;

/// Patient LastName
Property LastName As %String;

/// Patient Age
Property Age As %Integer;

/// Patient birth date 
Property BirthDate As %Date;

/// Patient birth time
Property BirthTime As %Time;

/// Patinet gender
Property Gender As %String;

/// Patient birth country
Property BirthCountry As %String;

/// Patient country
Property Country As %String;

/// Patient City
Property City As %String;

/// Patient Group [A,B,C]
Property PatientGroup As %String;

Storage Default
{
<Data name="InfoResponseDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Age</Value>
</Value>
<Value name="5">
<Value>BirthDate</Value>
</Value>
<Value name="6">
<Value>BirthTime</Value>
</Value>
<Value name="7">
<Value>Gender</Value>
</Value>
<Value name="8">
<Value>BirthCountry</Value>
</Value>
<Value name="9">
<Value>Country</Value>
</Value>
<Value name="10">
<Value>City</Value>
</Value>
<Value name="11">
<Value>PatientGroup</Value>
</Value>
</Data>
<DataLocation>^DEV.Messages3359.InfoResponseD</DataLocation>
<DefaultData>InfoResponseDefaultData</DefaultData>
<IdLocation>^DEV.Messages3359.InfoResponseD</IdLocation>
<IndexLocation>^DEV.Messages3359.InfoResponseI</IndexLocation>
<StreamLocation>^DEV.Messages3359.InfoResponseS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

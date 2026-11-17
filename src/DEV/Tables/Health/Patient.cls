Class DEV.Tables.Health.Patient Extends %Persistent
{

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^DEV.Tables.Health.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^DEV.Tables.Health.PatientD</IdLocation>
<IndexLocation>^DEV.Tables.Health.PatientI</IndexLocation>
<StreamLocation>^DEV.Tables.Health.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

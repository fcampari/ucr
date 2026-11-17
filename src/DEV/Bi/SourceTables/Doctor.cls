Class DEV.Bi.SourceTables.Doctor Extends %Persistent
{

Property FirstName As %String;

Property LastName As %String;

Property Specialization As %String;

Storage Default
{
<Data name="DoctorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Specialization</Value>
</Value>
</Data>
<DataLocation>^DEV.Bi.SourceTables.DoctorD</DataLocation>
<DefaultData>DoctorDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^DEV.Bi.SourceTables.DoctorD</IdLocation>
<IndexLocation>^DEV.Bi.SourceTables.DoctorI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>9</AverageFieldSize>
<OutlierSelectivity>.999999:"Lorenzo"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>9</AverageFieldSize>
<OutlierSelectivity>.999999:"Bianchi"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Specialization">
<AverageFieldSize>13</AverageFieldSize>
<OutlierSelectivity>.999999:"Pneumologia"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Bi.SourceTables.DoctorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

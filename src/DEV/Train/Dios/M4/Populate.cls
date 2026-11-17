Class DEV.Train.Dios.M4.Populate Extends (%Persistent, %Populate)
{

/// Description
Property Name As %String;

Property DOB As %Date;

/// Description
Storage Default
{
<Data name="PopulateDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>DOB</Value>
</Value>
</Data>
<DataLocation>^DEV.Train.Dios.M4.PopulateD</DataLocation>
<DefaultData>PopulateDefaultData</DefaultData>
<Description>
<![CDATA[Description]]></Description>
<ExtentSize>10</ExtentSize>
<IdLocation>^DEV.Train.Dios.M4.PopulateD</IdLocation>
<IndexLocation>^DEV.Train.Dios.M4.PopulateI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>18.8</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Train.Dios.M4.PopulateS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

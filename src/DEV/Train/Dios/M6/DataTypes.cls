Class DEV.Train.Dios.M6.DataTypes Extends %Persistent
{

/// Name
Property Name As %String(MAXLEN = 5);

/// Phone
Property PhoneNumber As %String(PATTERN = "3n1""-""3n1""-""4n");

/// Height - The logical value will be rounded to the specified SCALE number
Property Height As %Decimal(SCALE = 2);

/// DateOfBirth
Property DOB As %Date;

/// The display values are returned by the LogicalToDisplay method -> for instance in the Managment Portal
Property State As %String(DISPLAYLIST = "-Italy-Spain-Belgium", VALUELIST = "-IT-ES-BE");

/// Description
ClassMethod CreateRecord() As %Status
{
    Set sc = $$$OK
    Try {
        set record = ##class(DEV.Train.Dios.M6.DataTypes).%New()
        set record.Name = "Mario"
        set record.PhoneNumber = "335-112-3443"
        set record.Height = 1.6565
        set date =  $ZDATEH("10/01/1986",4)
        set record.DOB = date
        set record.State = "IT"
        set sc = record.%Save()
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }

    if $$$ISERR(sc){
       DO $System.Status.DisplayError(sc)
    } 
    Return sc
}

/// Description
ClassMethod DeleteAll() As %Status
{
    Set sc = $$$OK
    &sql(TRUNCATE TABLE DEV_Train_Dios_M6.DataTypes)
    Return sc
}

Storage Default
{
<Data name="DataTypesDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>PhoneNumber</Value>
</Value>
<Value name="4">
<Value>Height</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
<Value name="6">
<Value>State</Value>
</Value>
</Data>
<DataLocation>^DEV.Train.Dios.M6.DataTypesD</DataLocation>
<DefaultData>DataTypesDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^DEV.Train.Dios.M6.DataTypesD</IdLocation>
<IndexLocation>^DEV.Train.Dios.M6.DataTypesI</IndexLocation>
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
<OutlierSelectivity>.999999:52970</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Height">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:1.66</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>14</AverageFieldSize>
<OutlierSelectivity>.999999:"First Second"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="PhoneNumber">
<AverageFieldSize>14</AverageFieldSize>
<OutlierSelectivity>.999999:"335-112-3443"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Train.Dios.M6.DataTypesS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

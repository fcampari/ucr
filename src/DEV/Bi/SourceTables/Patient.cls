Class DEV.Bi.SourceTables.Patient Extends %Persistent
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

/// Doctor
Property Doctor As DEV.Bi.SourceTables.Doctor;

/// Create 10 patients
ClassMethod CreatePatient() As %Status
{
    Set sc = $$$OK
        Set p=##class(DEV.Bi.SourceTables.Patient).%New()
        Set p.Name = "Antonio"
        Set p.LastName = "Ramirez"
        Set p.Age = 26
        Set p.BirthDate = $ZDATEH("2000-01-15", 3)
        Set p.BirthTime = $ZTIMEH("12:28:10")
        Set p.Gender = "Male"
        Set p.BirthCountry = "Spain"
        Set p.Country = "Spain"
        Set p.City = "Madrid" 
        Set p.PatientGroup = "A"
        set d = ##class(Doctor).%New()
        set d.FirstName = "Lorenzo"
        set d.LastName = "Bianchi"
        set d.Specialization = "Pneumologia"
        set p.Doctor = d
        Set sc = p.%Save()
    Return sc
}

/// Description
Query ById(id As %Integer) As %SQLQuery(ROWSPEC = "ID:%Integer,Name,LastName, City") [ SqlProc ]
{
    SELECT ID, Name, LastName, City
    FROM DEV_Bi_SourceTables.Patient 
    WHERE ID = :id
}

/// Patient 
Storage Default
{
<Data name="PatientDefaultData">
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
<Value>BirthTimeStamp</Value>
</Value>
<Value name="8">
<Value>Gender</Value>
</Value>
<Value name="9">
<Value>BirthCountry</Value>
</Value>
<Value name="10">
<Value>Country</Value>
</Value>
<Value name="11">
<Value>PatientGroup</Value>
</Value>
<Value name="12">
<Value>City</Value>
</Value>
<Value name="13">
<Value>Doctor</Value>
</Value>
</Data>
<DataLocation>^DEV.Bi.SourceTables.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<Description>
<![CDATA[Patient ]]></Description>
<ExtentSize>1</ExtentSize>
<IdLocation>^DEV.Bi.SourceTables.PatientD</IdLocation>
<IndexLocation>^DEV.Bi.SourceTables.PatientI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Age">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:45</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="BirthCountry">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Italy"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="BirthDate">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:50474</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="BirthTime">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:30600</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="City">
<AverageFieldSize>9</AverageFieldSize>
<OutlierSelectivity>.999999:"Bologna"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Country">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Italy"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Gender">
<AverageFieldSize>6</AverageFieldSize>
<OutlierSelectivity>.999999:"Male"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Rossi"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Mario"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="PatientGroup">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:"A"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Bi.SourceTables.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

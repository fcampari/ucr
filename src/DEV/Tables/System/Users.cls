Class DEV.Tables.System.Users Extends %Persistent
{

/// User name
Property Username As %String;

// Password

Property Password As %String;

/// Create user for testing
ClassMethod CreateTestUser(Username As %String, Password As %String) As %String
{
    
    set u=##class(DEV.Tables.System.Users).%New()
    set u.Username=Username
    set u.Password=Password
    do u.%Save()
    Return "User :" _ u.Username _ " created with pswd : " _ u.Password
}

Storage Default
{
<Data name="UsersDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Username</Value>
</Value>
<Value name="3">
<Value>Password</Value>
</Value>
</Data>
<DataLocation>^DEV.Tables.System.UsersD</DataLocation>
<DefaultData>UsersDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^DEV.Tables.System.UsersD</IdLocation>
<IndexLocation>^DEV.Tables.System.UsersI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Password">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:"SYS"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Username">
<AverageFieldSize>11</AverageFieldSize>
<OutlierSelectivity>.999999:"Delegated"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Tables.System.UsersS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

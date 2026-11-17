Class DEV.Test.Tables.Person Extends %Persistent
{

/// First name of the person
Property FirstName As %String;

/// Last name of the person
Property LastName As %String;

/// First name + Last name
Property FullName As %String;

/// Date of birth
Property DOB As %String;

/// Height in cm
Property Height As %Numeric;

/// Weight in KG
Property Weight As %Numeric;

/*
This method will create "num" records inside the table 
*/
ClassMethod BuildTestRecords(num As %Integer = 0) As %Status
{
    if (num = 0){
        write ("No record Created. Insert an argument different from 0(default)")
        quit 0
    } 
    Try {

        //For training purposes I will create Name & Lastname lists in 2 different ways ($LIST, list class)
        set names = $LISTBUILD("Marco", "Lorenzo", "Fabio", "Anna", "Carla","Fabrizio",
                                "Mario", "Dario", "Stefano", "Simone",  "Roberta", "Giulia", "Sara", "Stefania",
                                "Giuseppe", "Marco", "Luca", "Francesca", "Alessandra",
                                "Matteo", "Andrea", "Antonio", "Giovanni", "Davide",
                                "Paola", "Simona", "Federico", "Stefano", "Gabriella",
                                "Leonardo", "Riccardo", "Daniela", "Salvatore", "Emanuele",
                                "Michele", "Pietro", "Angela", "Vincenzo", "Fabio"
                                ) 

        
        set lastNames = ##class(%ListOfDataTypes).%New()
        set listOfLastNames = $LISTBUILD("Rossi", "Russo", "Ferrari", "Esposito", "Bianchi",
                                    "Romano", "Colombo", "Ricci", "Marino", "Greco",
                                    "Bruno", "Gallo", "Conti", "De Luca", "Mancini",
                                    "Costa", "Giordano", "Rizzo", "Lombardi", "Moretti",
                                    "Barbieri", "Fontana", "Santoro", "Mariani", "Caruso"
                                    )
        for i=1:1:$LISTLENGTH(listOfLastNames){
            do lastNames.Insert($LIST(listOfLastNames,i))
        }

        //Creating the records
        for r=1:1:num{
            set randomNameIndex= $RANDOM($LISTLENGTH(names)-1)+1
            set randomLastNameIndex= $RANDOM(lastNames.Count()-1)+1

            set person = ##class("DEV.Test.Tables.Person").%New()

            set person.FirstName = $LIST(names,randomNameIndex)
            set person.LastName = lastNames.GetAt(randomLastNameIndex)
            set person.FullName = person.FirstName _" " _ person.LastName

            set person.DOB = ($RANDOM(25)+1) _ "/" _ ($RANDOM(11)+1)_ "/" _ ($RANDOM(55)+1950)

            set person.Height = 1.40 + ($RANDOM(70)/100)
            set person.Weight = (50 + $RANDOM(40) + ($RANDOM(90)/100))

            do person.%Save()
        }
        
       set tSC=$$$OK 
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    quit tSC
}

/// Description
ClassMethod DeleteAll() As %Status
{
    Set tSC = $$$OK

    TSTART

    Try {
        SET ttrunc = "TRUNCATE TABLE DEV_Test_Tables.Person"
        SET tStatement = ##class(%SQL.Statement).%New()
        SET qStatus = tStatement.%Prepare(ttrunc)
        SET rset = tStatement.%Execute()
    }
    Catch ex {
        Set tSC=ex.AsStatus()
        TROLLBACK 1
    }

    if $$$ISERR(tSC){
        TROLLBACK 1
    }Else {
        TCOMMIT
    }

    quit tSC
}

Storage Default
{
<Data name="PersonDefaultData">
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
<Value>FullName</Value>
</Value>
<Value name="5">
<Value>DOB</Value>
</Value>
<Value name="6">
<Value>Height</Value>
</Value>
<Value name="7">
<Value>Weitgh</Value>
</Value>
<Value name="8">
<Value>Weight</Value>
</Value>
</Data>
<DataLocation>^DEV.Test.Tables.PersonD</DataLocation>
<DefaultData>PersonDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^DEV.Test.Tables.PersonD</IdLocation>
<IndexLocation>^DEV.Test.Tables.PersonI</IndexLocation>
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
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.999999:"1990-05-15"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="FirstName">
<AverageFieldSize>7</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="FullName">
<AverageFieldSize>14</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="Height">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"Rossi"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Weight">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^DEV.Test.Tables.PersonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

/// 
Class DEV.Bi.Cubes.Patient Extends %DeepSee.CubeDefinition [ DependsOn = DEV.Bi.SourceTables.Patient, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Patient" displayName="Patient" disabled="false" abstract="false" sourceClass="DEV.Bi.SourceTables.Patient" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Location" disabled="false" hasAll="false" allCaption="All Location" allDisplayName="Location" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Country" displayName="Country" disabled="false" sourceProperty="Country" list="false" nullReplacement="Unknown" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
      <level name="City" displayName="City" disabled="false" sourceProperty="City" list="false" nullReplacement="Unknown" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="PatientGroup" disabled="false" hasAll="false" allCaption="All PatientGroup" allDisplayName="PatientGroup" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="PatientGroup" displayName="PatientGroup" disabled="false" sourceProperty="PatientGroup" list="false" nullReplacement="Unknown" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="BirthDate" displayName="BirthDate" disabled="false" hasAll="false" allCaption="All BirthDate" allDisplayName="BirthDate" sourceProperty="BirthDate" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Decade" displayName="Decade" disabled="false" timeFunction="Decade" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
      <level name="Year" displayName="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
      <level name="Month" disabled="false" timeFunction="MonthNumber" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="7">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Age" disabled="false" hasAll="false" allCaption="All Age" allDisplayName="Age" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AgeGroup" displayName="AgeGroup" disabled="false" sourceProperty="Age" list="false" rangeExpression="(0,18):0 to 17;[18,65):18 to 65;[65,):65+;" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="8">
        <property name="AgeCategory" displayName="AgeCategory" disabled="false" sourceExpression="%cube.GetAgeCategory(%source.Age)" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <measure name="AvgAge" displayName="AvgAge" disabled="false" sourceProperty="Age" aggregate="AVG" hidden="false" searchable="false" factNumber="1">
  </measure>
  <relationship name="Doctor" displayName="Doctor" disabled="false" sourceProperty="Doctor" relatedCube="Doctor" cardinality="one" nullReplacement="Unknown" factNumber="9">
  </relationship>
  <listing name="PatientsListing" displayName="PatientsListing" disabled="false" listingType="table" fieldList="%ID,Name,LastName,BirthDate,Age,Country" selectMode="2">
  </listing>
</cube>
}

/// Return the value for AgeCategory property of the AgeGroup level.
ClassMethod GetAgeCategory(Age As %Integer) As %String
{
  /*
    Set AgeCategory = "Senior"
    If (AgeCategory = "1 to 17"){
        set AgeCategory = "Minors"
    }
    elseif (AgeCategory = "18 to 65"){
      set AgeCategory = "Adults"
    }
    Return AgeCategory
  */
  Set AgeCategory = "Adults"
    If (Age < 18){
        set AgeCategory = "Minors"
    }
    elseif (Age >= 65 ){
      set AgeCategory = "Seniors"
    }
    Return AgeCategory
}

Parameter DOMAIN;

}

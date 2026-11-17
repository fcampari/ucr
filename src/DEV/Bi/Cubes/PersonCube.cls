/// 
Class DEV.Bi.Cubes.PersonCube Extends %DeepSee.CubeDefinition [ DependsOn = DEV.Test.Tables.Person, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="PersonCube" displayName="PersonCube" disabled="false" abstract="false" sourceClass="DEV.Test.Tables.Person" namedFactNums="true" countMeasureName="%COUNT" countMeasureCaption="TOTALE" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="HeightD" disabled="false" hasAll="true" allCaption="All Height" allDisplayName="Total Height" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="HeightGroup" displayName="HeightGroup" disabled="false" sourceProperty="Height" list="false" rangeExpression="(,1.50): to 1.50;(1.49,1.81):1.50 to 1.80;(1.80,):1.80 +;" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="WeightD" disabled="false" hasAll="true" allCaption="All WeightD" allDisplayName="TotalWeightD" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="WeightGroup" displayName="WeightGroup" disabled="false" sourceProperty="Weight" list="false" rangeExpression="(,60]:0 to 60 (kg);(60,80]:61 to 80 (kg);(80,):80+ (kg);" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="DobD" disabled="false" hasAll="true" allCaption="All DOB" allDisplayName="DOB" sourceExpression="$ZDATEH(%source.DOB,4)" type="time" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" displayName="Year" disabled="false" factName="Year" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
      <level name="Month" displayName="Month" disabled="false" factName="Month" timeFunction="MonthNumber" timeFormat="mmmm" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
      </level>
      <level name="Day" displayName="Day" disabled="false" factName="Day" timeFunction="DayNumber" timeFormat="dd" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <measure name="HeightAvg" displayName="HeightAvg" disabled="false" sourceProperty="Height" factName="Media" aggregate="AVG" type="number" hidden="false" searchable="false" formatString="#.###;;;;" factNumber="1">
  </measure>
  <measure name="WeightAvg" displayName="WeightAvg" disabled="false" sourceProperty="Weight" aggregate="AVG" type="number" hidden="false" searchable="false" formatString="#.###;;;;" factNumber="2">
  </measure>
  <measure name="Count" displayName="Count" disabled="false" sourceProperty="%ID" aggregate="COUNT" type="number" hidden="false" searchable="false" factNumber="3">
  </measure>
  <listing name="BasicListingID" displayName="BasicListingID" disabled="false" listingType="table" fieldList="%ID,DOB,Height,Weight,FullName" orderBy="%ID" selectMode="2">
  </listing>
</cube>
}

Parameter DOMAIN;

}

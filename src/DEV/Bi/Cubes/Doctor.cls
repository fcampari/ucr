/// 
Class DEV.Bi.Cubes.Doctor Extends %DeepSee.CubeDefinition [ DependsOn = DEV.Bi.SourceTables.Doctor, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Doctor" displayName="Doctor" disabled="false" abstract="false" sourceClass="DEV.Bi.SourceTables.Doctor" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Specialization" disabled="false" hasAll="false" allCaption="All Specialization" allDisplayName="Specialization" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Spec" displayName="Spec" disabled="false" sourceProperty="Specialization" list="false" nullReplacement="unknown" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
</cube>
}

Parameter DOMAIN;

}

Class DEV.Transform.From2to3 Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='Emilia:MDM_T02' targetDocType='Emilia:MDM_T02' create='new' language='objectscript' >
<assign value='source' property='target' action='set' />
<assign value='"3.0"' property='target.{MSH:VersionID.internationalversionID.identifier}' action='set' />
<assign value='"FSE2022"' property='target.{TXA:DocumentContentPresentation}' action='set' />
<foreach property='source.{PID:PatientIdentifierList()}' key='k1' >
<if condition='source.{PID:PatientIdentifierList(k1).identifiertypecode}="CS"' >
<true>
<assign value='"AUSLassist"' property='target.{PID:PatientIdentifierList(k1).assigningauthority.universalIDtype}' action='set' />
</true>
<false>
<if condition='source.{PID:PatientIdentifierList(k1).identifiertypecode}="AUSLAPPART"' >
<true>
<assign value='"AUSLappart" ' property='target.{PID:PatientIdentifierList(k1).assigningauthority.universalIDtype}' action='set' />
<assign value='"0000000"' property='target.{PID:PatientIdentifierList(k1).ID}' action='set' />
</true>
</if>
<if condition='source.{PID:PatientIdentifierList(k1).identifiertypecode}="CF"' >
<true>
<assign value='"MinFin"' property='target.{PID:PatientIdentifierList(k1).assigningauthority.namespaceID}' action='set' />
<assign value='"Ministero Finanze"' property='target.{PID:PatientIdentifierList(k1).assigningauthority.universalID}' action='set' />
</true>
</if>
</false>
</if>
</foreach>
<assign value='source.{TXA:UniqueDocumentNumber.entityidentifier}' property='target.{OBX():ObservationIdentifier.identifier}' action='set' />
</transform>
}

}

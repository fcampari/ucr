Class DEV.Transform.HL7.ORUTransform Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter GENERATEEMPTYSEGMENTS = 0;

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:ORU_R01' targetDocType='2.5:ORU_R01' create='copy' language='objectscript' >
<assign value='source' property='target' action='set' />
<assign value='"InterSystemsIRIS"' property='target.{MSH:ReceivingApplication.UniversalID}' action='set' />
</transform>
}

}

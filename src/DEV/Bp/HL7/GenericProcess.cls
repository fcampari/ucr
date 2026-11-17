Class DEV.Bp.HL7.GenericProcess Extends Ens.BusinessProcess
{

Method OnRequest(request As EnsLib.HL7.Message, Output response As Ens.StringResponse) As %Status
{
    set sc = $$$OK
    set response = ##class(Ens.StringResponse).%New()
    set response.StringValue = "OK"

    Return sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

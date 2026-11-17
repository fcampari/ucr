Class DEV.Bo.Mail.Send Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.EMail.OutboundAdapter";

Parameter INVOCATION = "Queue";

Method test(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
  Try {
    set email = ##class(%Net.MailMessage).%New()
    set email.Subject="Test email subj"
    do email.TextData.Write("test email body")
    set email.From="production@isc.com"
    set sc = ..Adapter.SendMail(email,.pf)
  }
  Catch ex {
    Set sc=ex.AsStatus()
  }

  Return sc
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Ens.Request">
    <Method>test</Method>
  </MapItem>
</MapItems>
}

}

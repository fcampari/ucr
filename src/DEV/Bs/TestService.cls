Include Ensemble

Class DEV.Bs.TestService Extends Ens.BusinessService
{

Parameter ADAPTER = "Ens.InboundAdapter";

Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=0&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Nome del componente destinatario nella Production.
Property TargetConfigName As Ens.DataType.ConfigName;

/// Flag in memoria, valido per questa istanza del Service.
Property StartAttempted As %Boolean [ InitialExpression = 0 ];

Method OnInit() As %Status
{
    If ..TargetConfigName = "" {
        Quit $$$ERROR($$$GeneralError, "Configure BP in TargetConfigName ")
    }
    Set ..StartAttempted = 0
    Quit $$$OK
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{
    Set pOutput = ""
    Set ..%WaitForNextCallInterval = 10

    // Dopo il primo tentativo, termina subito.
    If ..StartAttempted {
        Quit $$$OK
    }

    Set ..StartAttempted = 1

    Set tRequest = ##class(DEV.Messages.Req.Test.Start).%New()
    Set tRequest.Command = "start"

    Quit ..SendRequestAsync(..TargetConfigName, tRequest)
}

}

Class DEV.Test.SOAP.Prod.BP.Stock Extends Ens.BusinessProcess
{

/// Description
Method OnRequest(pRequest As DEV.Test.SOAP.Prod.Messages.StockRequest, Output pResponse As DEV.Test.SOAP.Prod.Messages.StockResponse) As %Status
{
    Set sc = $$$OK
    $$$TRACE("received Stock request ")
    set pResponse = ##class(DEV.Test.SOAP.Prod.Messages.StockResponse).%New()
    set pResponse.StockPrice= 42
    Return sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}

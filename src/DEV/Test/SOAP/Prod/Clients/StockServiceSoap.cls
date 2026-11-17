/*
Client creato da WSDL tramite la classe %SOAP.WSDL.Reader e il suo  metodo Process. Link doc: https://docs.intersystems.com/healthconnect20243/csp/docbook/DocBook.UI.Page.cls?KEY=GSOAP_webclients#GSOAP_client_generating
Per Provare questo cliente:
    set C=##class(DEV.Test.SOAP.Prod.Clients.StockServiceSoap).%New()
    ser x=C.Forecast("AAA")
x conterrÃ  la risposta del servizio invocato da questo client
*/

Class DEV.Test.SOAP.Prod.Clients.StockServiceSoap Extends %SOAP.WebClient [ ProcedureBlock ]
{

/// This is the URL used to access the web service.
Parameter LOCATION = "http://localhost/hc241/csp/soap/prod/DEV.Test.SOAP.Prod.BS.Stock.cls";

/// This is the namespace used by the Service
Parameter NAMESPACE = "http://www.Stock.org";

/// This is the name of the Service
Parameter SERVICENAME = "StockService";

/// This is the SOAP version supported by the service.
Parameter SOAPVERSION = 1.1;

Method Forecast(StockName As %String) As %Integer [ Final, ProcedureBlock = 1, SoapBindingStyle = document, SoapBodyUse = literal, WebMethod ]
{
 Quit ..WebMethod("Forecast").Invoke($this,"http://www.Stock.org/DEV.Test.SOAP.Prod.BS.Stock.Forecast",.StockName)
}

}

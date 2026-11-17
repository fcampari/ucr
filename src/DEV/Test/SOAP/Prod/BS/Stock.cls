/*
To test this production Web Service:
HTTP request:
    POST http://localhost/hc241/csp/soap/prod/DEV.Test.SOAP.Prod.BS.Stock.cls HTTP/1.1
    Accept-Encoding: gzip,deflate
    Content-Type: text/xml;charset=UTF-8
    SOAPAction: "http://www.Stock.org/DEV.Test.SOAP.Prod.BS.Stock.Forecast"
    Content-Length: 305
    Host: localhost
    Connection: Keep-Alive
    User-Agent: Apache-HttpClient/4.5.5 (Java/17.0.12)
SOAP message:
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:stoc="http://www.Stock.org">
    <soapenv:Header/>
    <soapenv:Body>
        <stoc:Forecast>
            <stoc:StockName>GPZ</stoc:StockName>
        </stoc:Forecast>
    </soapenv:Body>
    </soapenv:Envelope>

Per mostrare un errore Custom -> inserire nella richiesta XXX come StockName
*/

Class DEV.Test.SOAP.Prod.BS.Stock Extends EnsLib.SOAP.Service
{

/// For this business service, ADAPTER should be "" so that we use the normal SOAP processing
Parameter ADAPTER;

Parameter SERVICENAME = "StockService";

Parameter NAMESPACE = "http://www.Stock.org";

Parameter USECLASSNAMESPACES = 1;

/// Description
Method Forecast(StockName As %String) As %Integer [ WebMethod ]
{
   
    if (StockName = "XXX"){
        set myErrorDetail = "<Error>XXX is not a valid Stock name</Error>"
        set fault = ..MakeFault($$$FAULTServer,"Stock name error", myErrorDetail)
        do ..ReturnFault(fault)
    }
    
    //creating request for BP
    set pRequest = ##class(DEV.Test.SOAP.Prod.Messages.StockRequest).%New()
    set pRequest.StockName = StockName

    //Sendint Sync request to BP
    Set tSC = ..SendRequestSync("SoapStockBP", pRequest, .pResponse,)

    //Control comunication with BP and send price SOAP response
    if ('tSC){
        // if comunication with BP is unsuccessfull, thi is the price sent as SOAP response
        Set price = $Random(1000)
        Quit price
    }
    Quit pResponse.StockPrice
}

}

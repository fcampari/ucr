Class DEV.Test.SOAP.Stock Extends %SOAP.WebService
{

/*
TESTING this Soap Service:
HTTP REQUEST:
    POST http://localhost/hc241/csp/soap/stock/DEV.Test.SOAP.Stock.cls HTTP/1.1
    Accept-Encoding: gzip,deflate
    Content-Type: text/xml;charset=UTF-8
    SOAPAction: "https://tempuri.org/DEV.Test.SOAP.Stock.Forecast"
    Content-Length: 307
    Host: localhost
    Connection: Keep-Alive
    User-Agent: Apache-HttpClient/4.5.5 (Java/17.0.12)
SOAP Message:
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="https://tempuri.org">
    <soapenv:Header/>
    <soapenv:Body>
        <tem:Forecast>
            <tem:StockName>GPZ</tem:StockName>
        </tem:Forecast>
    </soapenv:Body>
    </soapenv:Envelope>
*/
/// Name of the WebService.
Parameter SERVICENAME = "StockService";

/// TODO: change this to actual SOAP namespace.
/// SOAP Namespace for the WebService
Parameter NAMESPACE = "https://tempuri.org";

/// Namespaces of referenced classes will be used in the WSDL.
Parameter USECLASSNAMESPACES = 1;

/// This method returns tomorrow's price for the requested stock
Method Forecast(StockName As %String) As %Integer [ WebMethod ]
{
    // apply patented, nonlinear, heuristic to find new price
    Set price = $Random(1000)
    Quit price
}

}

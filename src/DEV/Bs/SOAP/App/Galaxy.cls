/*
SOAP srvice In Production with Web Application.
url: https://devhost2.com:443/hc/csp/dev/galaxy/DEV.Bs.SOAP.App.Galaxy.cls
wsdl https://devhost2.com:443/hc/csp/dev/galaxy/DEV.Bs.SOAP.App.Galaxy.cls?WSDL

custom Headers:
    DEV.Bs.SOAP.Headers.Galaxy.Author.cls
Request:
    <?xml version="1.0" encoding="UTF-8" ?>
    <SOAP-ENV:Envelope xmlns:SOAP-ENV='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='https://www.w3.org/2001/XMLSchema-instance' xmlns:s='https://www.w3.org/2001/XMLSchema'>
        <SOAP-ENV:Body>
            <Answer xmlns="http://tempuri.org">
                <Question xsi:type="s:string">" What is the answer yo the ultimate question of life, the universe, and everything"</Question>
            </Answer>
        </SOAP-ENV:Body>
    </SOAP-ENV:Envelope>
*/

Class DEV.Bs.SOAP.App.Galaxy Extends EnsLib.SOAP.Service
{

Parameter ADAPTER;

Parameter SERVICENAME = "Galaxy";

Parameter NAMESPACE = "http://tempuri.org";

Parameter USECLASSNAMESPACES = 1;

/// Answer to the Ultimate Question of Life, the Universe, and Everything
Method Answer(Question As %String) As DEV.Messages.SOAP.Galaxy.Answer [ WebMethod ]
{
    Set soapAnswer = ##class(DEV.Messages.SOAP.Galaxy.Answer).%New()
    Set soapAnswer.Answer = 42
    Set soapAnswer.From = "Deep Thought"

    Set authorHeader = ##class(DEV.Bs.SOAP.Headers.Galaxy.Author).%New()
    set authorHeader.Author = "Douglas Adams"
    do ..HeadersOut.SetAt(authorHeader,"author")

    $$$LOGINFO("Answer")
    
    Quit soapAnswer
}

}

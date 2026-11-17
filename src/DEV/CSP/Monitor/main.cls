Class DEV.CSP.Monitor.main Extends %CSP.Page
{

// 

ClassMethod OnPage() As %Status
{
   &html<
    <!DOCTYPE html>
    <html lang="en" dir="ltr">
    <body>
    <h1>Monitor</h1>
    <div><b>Scadenza certificati TLS</b></div>
    <div></div>
    </body>
    </html>
   >
 
   Quit $$$OK
}

/// Description
ClassMethod writeHello() As %String
{
    quit $NAMESPACE
}

}

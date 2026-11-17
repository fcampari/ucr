Class DEV.Test.HTTP.API.Handler Extends %CSP.REST
{

/// 
/// The UrlMap determines how a Url should map to a HTTP Method and a Target ClassMethod
/// indicated by the 'Call' attribute. The call attribute is either the name of a method
/// or the name of a class and method seperated by a ':'. Parameters within the URL preceded
/// by a ':' will be extracted from the supplied URL and passed as arguments to the named method.
/// 
/// In this Route Entry GET requests to /class/namespace/classname will call the GetClass method
/// 
/// <Route Url="/class/:namespace/:classname" Method="GET" Call="GetClass"/>
/// 
/// In this Route Entry both POST and PUT requests are dispatched to the same method.
/// Called methods can determine which verb was used by checking the value of %request.Method
/// 
/// <Route Url="/class/:namespace/:classname" Method="POST,PUT" Call="PutClass"/>
/// 
/// To influence CORS processing you can set the "Cors" attribute to "true", default is "false".
/// The "Cors" attribute is only considered if the PARAMETER 'HandleCorsRequest' is left unspecified.
/// 
/// <Route Url="/class/:namespace/:classname" Method="GET" Call="GetClass" Cors="true"/>
/// 
/// Use a Map Entry to forward ALL requests made to a particular URL prefix. For example. If your 
/// web application has a base url route of /api/v1 and you want to map all requests to 
/// /api/v1/docserver (including all sub-urls) enter a Map entry like this:
/// 
/// <Map Prefix="/docserver" Forward="%Api.v1.DocServer"/>
/// 
/// This will result in calls such as /api/v1/docserver/class/Samples/Sample.Person being redirected
/// to the class %API.v1.DocServer ( another subclass of %CSP.REST )for futher processing. 
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/about" Call="About" Method="GET" Cors="true" />
    <Route Url="/form" Call="Form" Method="POST" Cors="true" />
    <Route Url="/eb/:pid" Call="EB" Method="POST" Cors="true" />
</Routes>
}

ClassMethod About() As %Status
{
    #if $$$isWINDOWS
    #define dumpfilelog	"c:\temp\dump.log"
    #else
    #define dumpfilelog	"/tmp/dump.log"
    #endif

    s f=$$$dumpfilelog o f:("WAS"):2 u f zw %request c f
    w $zv
    return $$$OK
}

ClassMethod Form() As %Status
{
    #if $$$isWINDOWS
    #define dumpfilelog	"c:\temp\dump.log"
    #else
    #define dumpfilelog	"/tmp/dump.log"
    #endif

    s f=$$$dumpfilelog o f:("WAS"):2 u f zw %request c f
    return $$$OK
}

ClassMethod EB(param As %String) As %Status
{
    #if $$$isWINDOWS
    #define dumpfilelog	"c:\temp\dump.log"
    #else
    #define dumpfilelog	"/tmp/dump.log"
    #endif

    s f=$$$dumpfilelog o f:("WAS"):2 u f zw %request w !,param c f
    return $$$OK
}

}

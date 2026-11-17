/*
REST service
url:
    GET https://devhost2.com:443/hc/dev/rest/test/galaxy/46
*/

Class DEV.REST.Api.Test.routing Extends %CSP.REST
{

XData UrlMap
{
<Routes>
    <Route Url="/galaxy/:id" Method="GET" Call="Get" />
    <Route Url="/galaxy" Method="POST" Call="Post" />
</Routes>
}

/// Manage GET request
ClassMethod Get(id As %Integer) As %Status
{

    Try {
        set response = ##class(DEV.REST.Api.Test.implementation).Get(id)
        Do ##class(%REST.Impl).%WriteResponse(response)
    }
    Catch ex {
        Do ##class(%REST.Impl).%SetStatusCode("500")
        Set tSC=ex.DisplayString()
        set response = {
            "errormessage": "Server error",
            "error": (tSC)
            }
        Do ##class(%REST.Impl).%WriteResponse(response)
    }
    Quit $$$OK
}

/// Description
ClassMethod Post() As %Status
{
    Try {
        set bodyObj = ##class(%DynamicObject).%FromJSON(%request.Content)
        set response = ##class(DEV.REST.Api.Test.implementation).Post(bodyObj)
        Do ##class(%REST.Impl).%WriteResponse(response)
    }
    Catch ex {
        Do ##class(%REST.Impl).%SetStatusCode("500")
        Set tSC=ex.DisplayString()
        set response = {
            "errormessage": "Server error",
            "error": (tSC)
            }
        Do ##class(%REST.Impl).%WriteResponse(response)
    }
    Quit $$$OK
}

}

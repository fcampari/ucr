Class DEV.CSP.OAuth.Basic Extends %CSP.Page
{

/// Description
Parameter OAUTH2APPNAME = "Dev-OAuth-demo";

Parameter OAUTH2CLIENTREDIRECTURL = "https://devhost2.com/hc/csp/dev/oauth/DEV.CSP.OAuth.BasicClientRedirect.cls";

/// Description
ClassMethod OnPreHTTP() As %Boolean
{
    // checking if client alredy has authorization with a specific scope
    set scope = "read"
    set ^isAuth = 0
    if ##class(%SYS.OAuth2.AccessToken).IsAuthorized(..#OAUTH2APPNAME,,scope, .accessToken, .IDToken, .responsePropeties, .error){
        set ^isAuth = 1
        set %response.ServerSideRedirect = "/hc/csp/dev/oauth/DEV.CSP.OAuth.BasicClientRedirect.cls"
    }
    Quit 1
}

ClassMethod OnPage() As %Status
{
   &html<
    <!DOCTYPE html>
    <html lang="en" dir="ltr">
    <body>
    <h1>OAuth2.0</h1>
    >

    //Printing some Sessions info
    set sessionApp = %session.Application
    set sessionTime = %session.CreateTime
    set html = "<div> <b>CSP app name: </b>"_sessionApp_"</div>"
                _"<div><b>NameSpace: </b>"_$NAMESPACE_"</div>"
                _"<div><b>User: </b>"_$USERNAME_"</div>"
                _"<div><b>Current dateTime: </b>"_$ZDATETIME($HOROLOG,3)_"</div>"
                _"<div><b>Session time: </b>"_sessionTime_"</div>"
                _"<div><b>is already Auth: </b>"_^isAuth_"</div>"
                _"</br>"

    w html

    set scope = "read super"
    set url=##class(%SYS.OAuth2.Authorization).GetAuthorizationCodeEndpoint(..#OAUTH2APPNAME,scope,
    ..#OAUTH2CLIENTREDIRECTURL,.properties,.isAuthorized,.sc)

    set html = "<div><a href='"_url_"'>Login</a></div>"
    w html

    &html<
    </br>
    <div><b>Names</b></div>
    </body>
    </html>
   >
   Quit $$$OK
}

}

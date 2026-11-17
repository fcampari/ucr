Class DEV.CSP.OAuth.BasicClientRedirect Extends %CSP.Page
{

Parameter OAUTH2APPNAME = "Dev-OAuth-demo";

ClassMethod OnPage() As %Status
{
   &html<
    <!DOCTYPE html>
    <html lang="en" dir="ltr">
    <body>
    <h1>OAuth2.0</h1>
    >
    set html = "<div><b>NameSpace: </b>"_$NAMESPACE_"</div>"
                _"<div><b>User: </b>"_$USERNAME_"</div>"
                _"<div><b>was already Auth: </b>"_^isAuth_"</div>"
    
    w html

    set scope = "read"
    if ##class(%SYS.OAuth2.AccessToken).IsAuthorized(..#OAUTH2APPNAME,,scope, .accessToken, .IDToken, .responsePropeties, .error){
        w "<div style='color: green;' ><b>Client Authorized</b></div>"
    }else{
        w "<div style='color: red;'><b>Client Not Authorized</b></div>"
    }
    &html<
    </br>
    <div><b>Redirect afetr Auth</b></div>
    </body>
    </html>
   >
   Quit $$$OK
}

}

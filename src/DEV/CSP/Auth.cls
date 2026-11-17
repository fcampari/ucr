Class DEV.CSP.Auth Extends %CSP.Page
{

// 

ClassMethod OnPage() As %Status
{
   Set html="<!DOCTYPE html>"
           _"<html lang=""en"" dir=""ltr"">"
           _"<body>"
           _"<h1>Auth</h1>"
           
   // examine %request object and
   // write more output...

   Set html=html_"</body>"
                _"</html>"
 
   Write html //finally, write the page
   Quit $$$OK
}

}

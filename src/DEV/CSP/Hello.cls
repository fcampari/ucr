Class DEV.CSP.Hello Extends %CSP.Page
{

/// Description
ClassMethod OnPreHTTP() As %Boolean
{
      Set sc = $$$OK
      set flag = $RANDOM(10)
      if (flag > 5){
            do %request.Insert("data1","42")
      }
      Quit 1
}

ClassMethod OnPage() As %Status
{
      //html Insert by the special directive &html<..> 
      &html<     
            <!DOCTYPE html>
            <html lang="en" dir="ltr">
                  <body>
                        <h1>Hello</h1>
      > 
      //print on the  HTML page the query paramter of data1 (either creted on the OnPreHTTP on passed in the url fo the request)      
      if (%request.IsDefined("data1", 1)){
            set data1 = %request.Data("data1",1)
            w "<h2>"_data1_"</h2>"
      }

      set sessionApp = %session.Application
      set sessionTime = %session.CreateTime
      set html = "<div>"_sessionApp_"</div>"
                  _"<div>"_sessionTime_"</div>"
                  _"<div> Current dateTime: "_$ZDATETIME($HOROLOG,3)_"</div>"
      w html

      //create a link on the HTML page
      set link = "https://docs.intersystems.com/"
      set tURL = ##class(%CSP.Page).Link(link,"")
      Set html="<p>Link to page 2: <a href="""_tURL_""">Link</a>"_"</p>" 
      w html

      &html<
            <form>
                  <label for="fname">First name:</label><br>
                  <input type="text" id="fname" name="fname"><br>
                  <label for="lname">Last name:</label><br>
                  <input type="text" id="lname" name="lname">
            </form>

      >

      //html insert using the write 
      write "</body>"
           _"</html>"

      Quit $$$OK
}

}

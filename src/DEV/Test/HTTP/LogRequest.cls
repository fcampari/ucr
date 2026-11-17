Class DEV.Test.HTTP.LogRequest Extends %RegisteredObject
{

/// d ##class(Netlog.TestRequest).About()
ClassMethod About()
{
    set request=##class(%Net.HttpRequest).%New()
    //set request.Authorization=""
    set request.Username="root"
    set request.Password="norway01"
    set request.Server="devhost2.com"
    //set request.Port=52773
    //set request.Https=0
    do request.InsertParam("p1","demo")
    do request.InsertParam("p2","demo")
    set sc=request.Get("/hc/csp/dev/test/about")
    #dim response as %Net.HttpResponse = request.HttpResponse
    #dim data as %Stream.GlobalCharacter = response.Data
    if response.StatusCode=200 {
        w !,data.Size
        w !,data.Read(data.Size)
    } else {
        w response.StatusLine
    }
}

/// d ##class(Netlog.TestRequest).Form()
ClassMethod Form()
{
    set request=##class(%Net.HttpRequest).%New()
    //set request.Authorization=""
    //set request.Username="root"
    //set request.Password="norway01"
    set request.Server="devhost2.com"
    //set request.Port=52773
    //set request.Https=0
    do request.InsertFormData("name","Joe")
    do request.InsertFormData("surname","Doe")
    set sc=request.Post("/hc/csp/dev/test/form")
    #dim response as %Net.HttpResponse = request.HttpResponse
    #dim data as %Stream.GlobalCharacter = response.Data
    if response.StatusCode=200 {
        w !,"y"
        w !,data.Size
        w !,data.Read(data.Size)
    } else {
        w "x: "_response.StatusLine
    }
}

/// d ##class(Netlog.TestRequest).EntityBody("test") -
ClassMethod EntityBody(param As %String)
{
    set request=##class(%Net.HttpRequest).%New()
    //set request.Authorization=""
    set request.Username="root"
    set request.Password="norway01"
    set request.Server="devhost2.com"
    //set request.Port=52773
    //set request.Https=0
    do request.EntityBody.Write("this is an entity body content.")
    set sc=request.Post("/hc/csp/dev/test/eb/"_param)
    #dim response as %Net.HttpResponse = request.HttpResponse
    #dim data as %Stream.GlobalCharacter = response.Data
    if response.StatusCode=200 {
        w !,data.Size
        w !,data.Read(data.Size)
    } else {
        w response.StatusLine
    }
}

}

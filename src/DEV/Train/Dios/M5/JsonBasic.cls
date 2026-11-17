Class DEV.Train.Dios.M5.JsonBasic Extends %RegisteredObject
{

/// Create JSON in 2 ways
ClassMethod Create() As %Status
{
    Set sc = $$$OK
    //direct object creation
    set json1 = {"first":1, "second":2}
    //zwrite json1

    //created using properties
    set jsonA = {}
    set jsonA.alpha = "a"
    set jsonA.beta = []
    set jsonA."0" = "b"
    set jsonA."1" = json1
    //zwrite jsonA

    // write formatted JSONs on current device
    set f = ##class(%JSON.Formatter).%New()
    do f.Format(json1)
    do f.Format(jsonA)

    Return sc
}

}

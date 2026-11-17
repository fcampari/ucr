Class DEV.REST.Api.Test.implementation Extends %RegisteredObject
{

/// Description
ClassMethod Get(id) As %DynamicObject
{
   
    if id=42 {
            set response = {"Question": "what's the answer to the ultimate question of life, the universe, and everything?"}
        }else{
            Do ##class(%REST.Impl).%SetStatusCode("400")
            set response = {
                "errormessage": "request error",
                "error": "Endpoint number must be 42"
                }
        }
    Return response
}

/// Description
ClassMethod Post(bodyObj As %DynamicObject) As %DynamicObject
{
    Set response = bodyObj
    Return response
}

}

Class DEV.Train.Dios.M5.Macros Extends %RegisteredObject
{

/// Sum macro
ClassMethod SimpleMacro(b As %Numeric)
{
    #define sum10(%b) 10+%b
    w $$$sum10(b)
}

}

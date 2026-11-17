Class DEV.Train.Dios.M7.UnitTestSum Extends %UnitTest.TestCase
{

/// Description
Method TestSum()
{
    do $$$AssertEquals(##class(DEV.Train.Dios.M7.Sum).Integer(1,2),3, "testing Sum.Integer(1,2) = 3")
}

}

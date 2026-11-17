Class DEV.Test.SOAP.Session.MySoapSession Extends %CSP.SessionEvents
{

/// Description
ClassMethod OnTimeout()
{
    set %session.EndSession = 1
}

}

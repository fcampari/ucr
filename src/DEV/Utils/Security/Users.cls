Class DEV.Utils.Security.Users Extends %RegisteredObject
{

/// Create team-SE user in the UCR User-Registry with %ALL role 
ClassMethod CreateSEUserHS(firstName As %String, lastName As %String, password As %String) As %Status
{
    Set sc = $$$OK
    TSTART
    Try {

        //normalize case 
        set firstName = $ZCONVERT(firstName,"l")
        set lastName = $ZCONVERT(lastName,"l")

        /* 
        Create the user and Login objects and them to the userRequest object.
        userRequest is the argument used to the UserRegistry Web method
        */
        set userRequest = ##class(HS.Registry.Person.User.WebServices.Containers.SuperContainer).%New()
        set user = ##class(HS.Registry.Person.User.WebServices.Containers.User).%New()
        set user.Active = 1
        set user.FirstName = $ZCONVERT($EXTRACT(firstName,1,1),"u")_$EXTRACT(firstName,2,)
        set user.LastName = $ZCONVERT($EXTRACT(lastName,1,1),"u")_$EXTRACT(lastName,2,)
        set user.UserID = "HS"_($EXTRACT(firstName,1,1))_lastName
        set login = ##class(HS.Registry.Person.User.WebServices.Containers.UserLoginID).%New()
        set login.LoginID = user.UserID
        do login.EncryptPassword(password)
        do login.Roles.InsertList($LISTBUILD("HS_All","%HS_Administrator","%HS_Clinician"))
        set login.Domain = "%HS_Default"
        set userRequest.UserContainer = user
        do userRequest.LoginContainers.Insert(login)

        //Call the webMethod of the Registry Service
        set sc = ##class(HS.Util.SOAPAPIHelper).InvokeSOAPService(
            "HSREGISTRY",
            "HS.Registry.Person.User.WebServicesAPI",
            "HS.Registry.Person.User.WebServicesAPIClient",
            "AddUserWeb",
            .Status,
            userRequest
        )
    }
    Catch ex {
        #dim ex as %Exception.SystemException
        Set sc=ex.AsStatus()
    }

    if $$$ISERR(sc){
        Write /SGR("33;1"), !, "Creazione fallita con seguente errore: " _ $SYSTEM.Status.GetErrorText(sc), /SGR(0)
        TROLLBACK 1
    } Else {
        Write !, "success"
        TCOMMIT
    }

    Return sc
}

/// Create team-SE iris user with %ALL role 
ClassMethod CreateSEUser(userName As %String) As %Status
{
    Set sc = $$$OK
    set ns=$NAMESPACE

    TSTART
    zn "%SYS"
    Try {
        set sc=##class(Security.Users).Create(userName,"%All","SYS",,"DEV",,,,1,,,,,,,,,,)
    }
    Catch ex {
        #dim ex as %Exception.SystemException
        Set sc=ex.AsStatus()
    }

    if $$$ISERR(sc){
        Write /SGR("33;1"), !, "Creazione fallita con seguente errore: " _ $SYSTEM.Status.GetErrorText(sc), /SGR(0)
        TROLLBACK 1
    } Else {
        Write !, "success"
        TCOMMIT
    }

    zn ns
    Return sc
}

}

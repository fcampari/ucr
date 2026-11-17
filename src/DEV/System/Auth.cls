Class DEV.System.Auth
{

/// this method is invoked by the ZAUTHENTICATE routine for delegated Auth.
/// Return a status code and Properties list of the user as Output
ClassMethod AuthUser(username As %String = "", pswd As %String = "", type As %String = "pswd", Output UserProp As %List) As %Status
{
   
    Try {
        set sc = $$$OK

        set sc = ..AllowOneSessionActive()

        //Note that the username passed in may contain the domain. Remove it so we
        //can compare it against the user defined database and then uppercase the name. 
        set username=$zcvt($p(username,"@",1),"U")

        /*
        Based on the variable "type", call the method that authenticate the user
        Allawed value for the variable type:
         - pswd
         - ldap
        */
        if (type = "pswd"){
            set sc = ..AuthenticatePasswordUser(username, pswd)
        }
        elseif (type = "ldap"){
            set sc = ..AuthenticateLDAPUser(username, pswd)
        }

    }
    Catch ex {
        set sc=ex.AsStatus()
    }
    Return sc
}

/// Authenticate the user evaluating the login passowrd against a password stored in IRIS
ClassMethod AuthenticatePasswordUser(username As %String = "", pswd As %String = "") As %Status
{
   
    set AuthStatus = 0

    /*
    ---
    Implementation code that authenticate the User
    ---
    */

    if AuthStatus '= 1 {
        Set sc = $$$ERROR($$$GeneralError,"my error text")
    }
    
    Return sc
}

/// Authenticate the user with an external LDAP server
ClassMethod AuthenticateLDAPUser(username As %String = "", pswd As %String = "") As %Status
{
    Set sc = $$$OK
    /*
    ---
    Implementation code that authenticate the User against LDAP server
    ---
    */
    Return sc
}

/*
Check if the user have another active sessions. If positive the sessions are terminated.
Session termination is logged in the Audit DB.
*/
ClassMethod AllowOneSessionActive(username As %String = "", Output sessionflag As %Boolean) As %Status
{
    Set sc = $$$OK
    Set sessionflag = 0
    set ns=$NAMESPACE
    zn "%SYS"
    
    set tUser = username
    set key=$ORDER(^%cspSession(-3,""))
    set ^zTest.Auth("web","cspSession", "key")=key
    set i = 0
    While (key'="") {
            set ^zTest.Auth("while") = "yes"
            set i=i+1
            set subValue = ^%cspSession(-3,key)
            set x=$LIST(subValue,3)
            set ^zTest.Auth("while","subValue 3lb") = x
            set user = $LIST(x,2)
            set ^zTest.Auth("while","user",i) = user
            if (tUser=user){
                set ^zTest.Auth("if") = "yes"
                set ^zTest.Auth("ifUser") = "sessione giÃ  attiva"
                //set sc = $$$ERROR($$$GeneralError,"User: "_ tUser _ " has an active session that has been terminated.")
                set sessionflag = 1
            }
            set key=$ORDER(^%cspSession(-3,key))
        }
    zn ns
    Return sc
}

}

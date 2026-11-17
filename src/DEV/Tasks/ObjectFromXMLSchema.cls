Class DEV.Tasks.ObjectFromXMLSchema Extends %SYS.Task.Definition
{

/// Called when the task start
Method OnTask() As %Status
{
    set sc=$$$OK
    Try {
        set bsName="XMLObjectFromSchema"

        set sc = ##class(Ens.Director).CreateBusinessService(bsName, .bs)
	 	quit:$$$ISERR(sc)

        set sc = bs.ProcessInput() 
        quit:$$$ISERR(sc)

    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
}

}

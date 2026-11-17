Class DEV.Utils.Pdf.Base64Decode Extends %RegisteredObject
{

/// Description
ClassMethod Decode64(base64 As %Stream.Object, Output streamOut As %Stream.Object) As %Status
{
    set sc = $$$OK

    Try {
        set stream1=##class(%Stream.TmpCharacter).%New()
        do base64.Rewind()
        while 'base64.AtEnd {
            set temp=base64.Read()
            set temp = $REPLACE(temp, "\X0A\","")
            do stream1.Write(temp)
        }
 
        do stream1.Rewind()
    
        set streamOut = ##class(%Stream.TmpCharacter).%New()

        while 'stream1.AtEnd {
            set temp=stream1.Read(4000)
            set temp=$system.Encryption.Base64Decode(temp)
            do streamOut.Write(temp)
        }
        
    }
    Catch ex {
        Set sc=ex.AsStatus()
    }
    
    Return sc
}

/// Description
ClassMethod Encode64(streamIn As %Stream.Object, Output base64 As %Stream.Object) As %Status
{
    Set sc = $$$OK
    
    Try {
        set base64=##class(%Stream.TmpCharacter).%New()

        do streamIn.Rewind()

        While ('streamIn.AtEnd) {
            set tmp=streamIn.Read(4000)
            set tmp=$SYSTEM.Encryption.Base64Encode(tmp,1)
            do base64.Write(tmp)
        }

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

}

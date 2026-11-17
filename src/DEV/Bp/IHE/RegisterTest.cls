Class DEV.Bp.IHE.RegisterTest Extends Ens.BusinessProcess
{

/// Business Host to Register request
Property TargetConfigName As %String(MAXLEN = 1000);

/// Businese Host configuration settings
Parameter SETTINGS = "TargetConfigName:Basic:selector?multiSelect=1&context={Ens.ContextSearch/ProductionItems?targets=1&productionName=@productionId}";

/// Description
Method OnRequest(pReq As DEV.Messages.Req.Test.Count) As %Status
{
    set sc = ..SendReg(pReq.Count)
    Return sc
}

/// Description
Method SendReg(count As %Integer) As %Status
{
    Set sc = $$$OK
    $$$LOGINFO( count)
    Try {
        For i=1:1:count {
            Set sc = ..BuildRegisterRequest( .regReq )
            $$$LOGINFO("count doc: "_regReq.Documents.Count())
            Set tSC = ..SendRequestAsync( ..TargetConfigName, regReq ,0) 
        }
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Description
Method BuildRegisterRequest(Output req As HS.Message.IHE.XDSb.RegisterRequest) As %Status
{
    Set sc = $$$OK
    Try {
        set req = ##class(HS.Message.IHE.XDSb.RegisterRequest).%New()
        set req.PatientId = "100000003^^^&1.3.6.1.4.1.21367.2010.1.2.300&ISO"
        set req.sourceId = "1.3.6.1.4.1.21367.2010.1.2.300"
        set entryUUID = ##class(HS.IHE.XDSb.Types.ObjectRef).%New()
        set entryUUID.EntryUUID = "doc01"
        //set req.EntryUUDI="doc01"
        set req.SubmissionTime="20260706143025"
        Set req.ContentTypeCode = ##class(HS.IHE.XDSb.Types.CodedValue).Create("11488-4","2.16.840.1.113883.6.1","Consultation Note")

        //document meta data
        set document = ##class(HS.Message.IHE.XDSb.Document).%New()
      
        Set document.ClassCode=##class(HS.IHE.XDSb.Types.CodedValue).Create("26435-8","2.16.840.1.113883.6.1","MOLECULAR PATHOLOGY STUDIES")
        Set document.FormatCode=##class(HS.IHE.XDSb.Types.CodedValue).Create("urn:ihe:iti:xds-sd:pdf:2008","1.3.6.1.4.1.19376.1.2.3","Scanned Documents PDF")
        Set document.CreationTime="20180821102615-0400"
        set document.Hash = "3e90b8a379b6958d3386a2e07dfeaeecbb130048"
        Do document.ConfidentialityCode.Insert(##class(HS.IHE.XDSb.Types.CodedValue).Create("N","2.16.840.1.113883.5.25","Normal"))
        set document.Size = 21
        Set document.MimeType="application/pdf"
        set document.UniqueId="2.25.260485394149080817326323101459376047372"
        Set document.TypeCode=##class(HS.IHE.XDSb.Types.CodedValue).Create("18768-2","2.16.840.1.113883.6.1","CELL COUNTS+DIFFERENTIAL STUDIES")
        Set document.SourcePatientId="DMRN45^^^&1.3.6.1.4.1.21367.2010.1.2.300.2.1&ISO"
        set document.PatientId = "100000003^^^&1.3.6.1.4.1.21367.2010.1.2.300&ISO"
        // Document author
        Set tAuthor= ##class(HS.IHE.XDSb.Types.Author).%New()
        Set tAuthor.AuthorPerson="John Smith"
        Do tAuthor.AuthorInstitution.Insert(##class(HS.IHE.XDSb.Types.SlotValue).%New("Johns Hopkins"))
        Do tAuthor.AuthorRole.Insert(##class(HS.IHE.XDSb.Types.SlotValue).%New("Role"))
        Do tAuthor.AuthorSpecialty.Insert(##class(HS.IHE.XDSb.Types.SlotValue).%New("Specialty"))
        Do document.Author.Insert(tAuthor)
        
        $$$LOGINFO( "insert doc"_req.Documents.Insert(document))
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Description
Method OnResponse(request As Ens.Request, ByRef response As Ens.Response, callrequest As Ens.Request, callresponse As Ens.Response, pCompletionKey As %String) As %Status
{
    Set sc = $$$OK
    $$$LOGINFO("rsp")
    Return sc
}

// update Connectio on Production UI

ClassMethod OnGetConnections(Output pArray As %String, pItem As Ens.Config.Item)
{
    Do ##super(.pArray, pItem)
 
    If pItem.GetModifiedSetting("TargetConfigName", .tValue) {
        For i=1:1:$L(tValue, ",") {
            Set tOne = $ZStrip($P(tValue, ",", i), "<>W")
            Continue:tOne=""
            Set pArray(tOne)=""
        }
    }
}

Storage Default
{
<Data name="RegisterTestDefaultData">
<Subscript>"RegisterTest"</Subscript>
<Value name="1">
<Value>TargetConfigName</Value>
</Value>
</Data>
<DefaultData>RegisterTestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

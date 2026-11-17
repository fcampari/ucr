Class DEV.Bp.Transfrom.HL7Process Extends Ens.BusinessProcess
{

/// BusinessHost setting: saving pdf file to the fiel system
Property SavePDF As %Boolean [ InitialExpression = 0 ];

/// BusinessHost setting: saving pdf file to the fiel system
Property SaveCDA As %Boolean [ InitialExpression = 0 ];

/// Description
Property WorkPath As %String [ InitialExpression = "/home/InterSystems/HC/testRepo/" ];

Parameter SETTINGS = "SavePDF,SaveCDA";

Method OnRequest(request As Ens.StreamContainer, Output response As Ens.StreamContainer) As %Status
{
    Set sc = $$$OK

    set response = ##class(Ens.StreamContainer).%New()
    set ackCode = "AA"
    set ackErr = ""

    Try {
        // conveting HL7-xml to HL7-ER7  
        set er7in = ##class(ITB.HL7.Util.Convert).XMLToER7(request.Stream, .sc, "2.3.1")
        
        // set the DocType using the Custom HL7 Schema "Emilia2.3.1" as DocType Category
        set MsgType = er7in.GetValueAt("MSH:9.3")
        set er7in.DocType = "Emilia:"_MsgType
        // set er7in.DocType=er7in.chooseDocType(.desc)
        // validate HL7
        set sc=##class(EnsLib.HL7.Util.Validator).Validate(er7in, "dmr-z")
        if $$$ISERR(sc) {
            set ackCode = "AR"
            set ackErr = $SYSTEM.Status.GetErrorText(sc)
            return sc
        }
      
        // apply the HL7transform defined with the iris DTL user interface
        set transform = ##class(DEV.Transform.From2to3).Transform(er7in, .er7out)
        $$$LOGINFO("transoformation applied")

        // get the value of the OBX segment containing the PDF
        set pdf = er7out.GetValueAt("OBX(1):5.5",,,,,.incomplite)
        set filename = er7in.GetValueAt("OBX(1):3.1",,,,,)

        // from the value of the OBX segment, extracting only the pdf binary Base64encoded
        set pdfBinary64 = $p(pdf,"X0A\\X0A\",3)
        set PDFStringHeader = $p(pdf,"X0A\\X0A\",1,2)
        set PDFStringFooter = $p(pdf,"X0A\\X0A\",4)
        
        
        // insert the pdf binary in a temporary stream
        set streamPDF = ##class(%Stream.TmpCharacter).%New() 
        do streamPDF.Write(pdfBinary64)
        do streamPDF.Rewind()

        // decode the pdf binary
        set sc = ##class(DEV.Utils.Pdf.Base64Decode).Decode64(streamPDF, .streamDecoded)

        // save PDF to FileSystem
        if (..SavePDF) {
            set tempfile = ##class(%Stream.FileCharacter).%New()
            set tempfile.Filename = ..WorkPath_"inputPdf.pdf"
            While ('streamDecoded.AtEnd) {
                do tempfile.WriteLine(streamDecoded.ReadLine())
            }
            do tempfile.%Save()
            do streamDecoded.Rewind()

        }

        // extract the CDA from decodedPDF (this is a python method using the pykepdf library)
        set CDAStream = ..CDAExtraction(streamDecoded)
        do CDAStream.Rewind()

        // extract info about the admitting doctor for the CDA transformation
        set docSurname = er7out.GetValueAt("PV1:9.2")
        set docName = er7out.GetValueAt("PV1:9.3")
        set docID = er7out.GetValueAt("TXA:12.1")
        set cftecnico = "COD_FIS"
        set cognomeTecnico = "cognomeTecnico"
        set nomeTecnico = "nomeTecnico"
        set labOrgRoot = "OIDLabOrg"

        // transform CDA
        set tParams = ##class(%ArrayOfDataTypes).%New()
        set sc = tParams.SetAt(docSurname,"family_name")
        set sc = tParams.SetAt(docName,"given_name")
        set sc = tParams.SetAt("'tel:3340003456'","docTel")
        set sc = tParams.SetAt("'AUSL DELLA ROMAGNA'","custodianName")
        set sc = tParams.SetAt("'mailto:doc@mail.com'","docMail")
        set sc = tParams.SetAt("'"_docID_"'","documentID")
        set sc = tParams.SetAt(cftecnico,"cfTecnico")
        set sc = tParams.SetAt("cognomeTecnico","cognomeTecnico")
        set sc = tParams.SetAt("nomeTecnico","nomeTecnico")
        set sc = tParams.SetAt("labOrgRoot","labOrgRoot")
        set sc = tParams.SetAt("'mailto:author@pec.it'","docPec")
        $$$LOGINFO("cda: "_CDAStream.Read(400))
        do CDAStream.Rewind()
        if ..SaveCDA {
            set sc =..WriteXMLStreamToFile(CDAStream, ..WorkPath_"CDAStream.xml")
        }
        set sc = ..CDATransform(CDAStream, tParams, .CDATransformedStream)
        
        if $$$ISERR(sc) return sc
        while 'CDATransformedStream.AtEnd { $$$LOGINFO("transformed: "_ CDATransformedStream.Read(10000))}
        

        do CDATransformedStream.Rewind()
        do CDAStream.Rewind()
        if ..SaveCDA {
            //set sc =..WriteXMLStreamToFile(CDAStream, ..WorkPath_"CDA.xml")
            set sc=..WriteXMLStreamToFile(CDATransformedStream, ..WorkPath_"CDAtransformed.xml")
        }
        
        // delete attached CDA
        set PDFnoAttachStream = ..CDADetach(streamDecoded)
        do PDFnoAttachStream.Rewind()

        // save to disk the modified PDF without attachment to disk (uncomment if needed)
        #; set tempfile = ##class(%Stream.FileCharacter).%New()
        #; set tempfile.Filename = "/home/InterSystems/allegati/Mypdf.pdf"
        #; While ('PDFnoAttachStream.AtEnd) {
        #;     do tempfile.WriteLine(PDFnoAttachStream.ReadLine())
        #; }
        #; do tempfile.%Save()
        #; do PDFnoAttachStream.Rewind()
        #; $$$LOGINFO(PDFnoAttachStream.Read(300))

        // attach the transformed CDA
        set PDFwithNewCDA = ..CDAAttach(CDAStream, PDFnoAttachStream, filename_".xml")

        set sc= ##class(DEV.Utils.Pdf.Base64Decode).Encode64(PDFwithNewCDA, .PDFEncoded)

        // insert PDF into HL7
        set sc = er7out.SetValueAt(PDFStringHeader_"X0A\\X0A\","OBX(1):5.5")

        do PDFEncoded.Rewind()
        While 'PDFEncoded.AtEnd {
            set obxString = er7out.GetValueAt("OBX(1):5.5",,,,,.incomplite)
            set sc = er7out.SetValueAt(obxString_PDFEncoded.Read(76)_"\X0A\","OBX(1):5.5")
        }
        set obxString = er7out.GetValueAt("OBX(1):5.5",,,,,.incomplite)
        
        // replace "Content-Disposition: <value>;" with "Content-Disposition: attachment;" in the OBX.5 segment
        set regex = ##class(%Regex.Matcher).%New("Content-Disposition: [^;]*;")
        set regex.Text = obxString
        if regex.Locate() {
            set obxString = regex.ReplaceAll("Content-Disposition: attachment;")
        }

        set sc = er7out.SetValueAt(obxString_PDFStringFooter,"OBX(1):5.5")


        // from ER7toXML
        set response.Stream = ##class(ITB.HL7.Util.Convert).ER7ToXML(er7out, .sc,)

        set sc = ..SendRequestSync("DEV.Bo.Transform.HL7Operation", response, .BOResponse)

        // send back an ACK message to the Service
        set pACK = ..ACKPreparing(er7out, ackCode, ackErr)
        $$$LOGINFO("ACK: "_pACK.GetValueAt("MSA:1"))

        set pACKxml = ##class(Ens.StreamContainer).%New()
        set pACKxml.Stream = ##class(ITB.HL7.Util.Convert).ER7ToXML(pACK, .sc, "2.3.1")

        set response = pACKxml

    }
    Catch ex {
        Set tSC = ex.AsStatus()
        $$$LOGSTATUS(tSC)
    }
    Return sc
}

/// Utility method that transform Stream to python bytes
ClassMethod StreamToBytes(stream As %Stream.Object) As %SYS.Python
{
    Try {
        
        set maxlen = $$$MaxLocalLength
        set builtins = ##class(%SYS.Python).Import("builtins")
        set ba = builtins.bytearray()
        
        do stream.Rewind()
        while 'stream.AtEnd {do ba.extend($system.Python.Bytes(stream.Read(maxlen)))}
        return ba
    }
    Catch ex {
        do ba.extend($system.Python.Bytes("error converting Stream to Pyton Byte"))
    }
}

/// Python method that extracts the CDA form a PDF Stream 
ClassMethod CDAExtraction(stream As %Stream.Object) As %Stream.Object [ Language = python ]
{
    import iris
    import pikepdf
    from io import BytesIO
    import os

    maxlen = iris.system.SYS.MaxLocalLength()
    pdf_bytes = bytearray()

    # converting iris Stream to python Bytes
    stream.Rewind()
    while not stream.AtEnd:
        pdf_bytes.extend(iris._SYS.Python.Bytes(stream.Read(maxlen)))
    
    # setting the folder where the CDA extracted will be saved
    cartella_output = '/home/InterSystems/allegati'

    # CDA extraction from pdf
    with pikepdf.open(BytesIO(pdf_bytes)) as pdf:
        if '/Names' not in pdf.Root or '/EmbeddedFiles' not in pdf.Root['/Names']:
            return  #no attached files

        embedded_files = pdf.Root['/Names']['/EmbeddedFiles']['/Names']

        for i in range(0, len(embedded_files), 2):
            nome_file = str(embedded_files[i])
            file_spec = embedded_files[i + 1]
            file_stream = file_spec['/EF']['/F'].read_bytes()
            
            
            # saving file on file system 
            if nome_file.lower().endswith('.xml'):
                CDAStream = iris._Stream.FileBinary._New()
                CDAStream.write(file_stream)
                output_path = os.path.join(cartella_output, nome_file)
                with open(output_path, 'wb') as f:
                    f.write(file_stream)
                
                return CDAStream
}

/// PDFwithCDA stream as Input. Remove CDA and return PDF stream without CDA
ClassMethod CDADetach(stream As %Stream.Object) As %Stream.Object [ Language = python ]
{
    import iris
    import pikepdf
    from io import BytesIO
    import os

    maxlen = iris.system.SYS.MaxLocalLength()
    stream.Rewind()

    # read the PDF from the IRIS stream into a bytearray
    pdf_bytes = bytearray()

    while not stream.AtEnd:
        pdf_bytes.extend(iris._SYS.Python.Bytes(stream.Read(maxlen)))
    
    # open the PDF in memory using pikepdf
    with pikepdf.open(BytesIO(pdf_bytes)) as pdf:

        # check if there are any embedded files in the PDF; if not --> return
        if '/Names' not in pdf.Root or '/EmbeddedFiles' not in pdf.Root['/Names']:
            return  

        # access the embedded files name tree
        embedded_files = pdf.Root['/Names']['/EmbeddedFiles']['/Names']

        # loop through embedded files
        for i in range(0, len(embedded_files), 2):
            nome_file = str(embedded_files[i])
             
            # remove the attachment from the PDF
            del pdf.attachments[nome_file]

            # save to disk the modified PDF without attachment to disk (uncomment if needed)
            # pdf.save('/home/InterSystems/allegati/pdfNo.pdf')

            # save the PDF without attachments to a memory buffer
            buffer = BytesIO()
            pdf.save(buffer)  # salva il PDF in memoria nel buffer
            delPdf_bytes = buffer.getvalue() 
              
            # Write the modified PDF to an IRIS binary stream
            pdfNoAttach = iris._Stream.FileBinary._New()
            pdfNoAttach.write(delPdf_bytes)
            
            return pdfNoAttach
}

/// CDA Transformation
ClassMethod CDATransform(CDAin As %Stream.Object, tParams As %ArrayOfDataTypes, Output CDAout As %Stream.Object) As %Status
{
    Set sc = $$$OK
    Try {
        set sc = ##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile("/home/InterSystems/HC/testRepo/XSLT/transform.xslt", .xslt) 
        If $$$ISERR(sc) Quit 

        set sc = ##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(CDAin, xslt, .CDATransformed,,tParams)
        if sc{
            set CDAout = CDATransformed
        }
    }
    Catch ex {
        Set sc = ex.AsStatus()
    }
    Return sc
}

/// This method attaches an XML document (CDA file) to an existing PDF retrieved as an IRIS stream.
/// Takes as input the XML stream, the destination PDF stream, and the attachment name.
/// It outputs a binary stream containing the updated PDF with the embedded XML.
ClassMethod CDAAttach(xmlStream As %Stream.Object, pdfStream As %Stream.Object, CDAname As %String) As %Stream.Object [ Language = python ]
{
    import iris, io
    from pikepdf import Pdf, AttachedFileSpec

    def stream_to_bytes(stream):
        stream.Rewind()

        # read the stream content into a byte array
        data = bytearray()
        while not stream.AtEnd:
            # read in chunks and encode as latin-1 to preserve binary data
            data.extend(stream.Read(8192).encode('latin-1'))
        return bytes(data)

    # read PDF content from IRIS stream
    pdf_data = stream_to_bytes(pdfStream)
    pdf = Pdf.open(io.BytesIO(pdf_data))

    # read XML content from IRIS stream
    xmlStream.Rewind()
    xml_string = ""
    while not xmlStream.AtEnd:
        xml_string += xmlStream.Read(4096)
    
    # convert string to UTF-8 bytes
    xml_bytes = bytes(xml_string, 'utf-8')

    # attach the XML file to the PDF
    filespec = AttachedFileSpec(
        pdf, 
        xml_bytes,
        filename = CDAname,
        mime_type = "application/xml"
    )
    pdf.attachments[CDAname] = filespec

    # save the resulting PDF with attachment to disk
    pdf.save("/home/InterSystems/allegati/output_con_cda.pdf")

    # prepare the output PDF as a binary stream for return to IRIS
    buf = io.BytesIO()
    pdf.save(buf)
    buf.seek(0)
    out = iris.cls('%Stream.TmpBinary')._New()
    out.Write(buf.read())

    # return the binary stream back to IRIS
    return out
}

/* FABRIZIO
devo dire da dove ho preso il metodo qui sotto? 
*/
/// Generating the ACk message in er7 format
ClassMethod ACKPreparing(er7Msg As EnsLib.HL7.Message, tAckCode As %String, tAckErr As %String) As EnsLib.HL7.Message
{
    Set sc = $$$OK

    Try {
        // FABRIZIO
        // non sono sicura che vada settato a questi valori. 
        // Originariamente prende i valori da delle setting, ma non so se cambino in base all'istallazione 
        // e se ha senso aggiungere come settings anche qui
        set LocalFacilityApplication = "SC:EnsembleHL7:ACK:NE:NE"

        // create the ACK message
        set ACKout = er7Msg.NewReplyDocument(,LocalFacilityApplication)
        set ACKout.Source = er7Msg.%Id()

        // set the MSH segment
        do ACKout.SetValueAt(er7Msg.GetValueAt("1:10"),"1:10")
        do ACKout.SetValueAt($p(LocalFacilityApplication,":",3)_"_"_$p(er7Msg.DocTypeName,"_",2),"1:9.3")
        do ACKout.SetValueAt($p(LocalFacilityApplication,":",4),"1:15")
        do ACKout.SetValueAt($p(LocalFacilityApplication,":",5),"1:16")
        
        // set the MSA segment
        set tMSA=##class(EnsLib.HL7.Segment).%New($LB("",1))
        set tMSA.Separators = ACKout.Separators
        do tMSA.SetValueAt("MSA",0)
        do tMSA.SetValueAt(tAckCode,1)
        do tMSA.SetValueAt(er7Msg.GetValueAt("1:10"),2)
        if (tAckCode '= "AA") {
            do tMSA.SetValueAt(tAckErr,3)
        }
        do ACKout.AppendSegment(tMSA)
    }

    // FABRIZIO
    // non so se ha senso il try chatch, almeno non in questo modo
    Catch ex {
        Set sc = ex.AsStatus()
    }

    Return ACKout
}

/// Description
ClassMethod WriteXMLStreamToFile(xmlStream As %Stream.Object, filePath As %String) As %Status
{
    Set sc = $$$OK
    Try {

        
        
        set Path = $GET(filePath,"/tmp/file.xml")
        // create an XML Reader to parse the input ACK stream 
        set reader = ##class(%XML.Reader).%New()

        // open the XML stream
        set sc = reader.OpenStream(xmlStream)
        if $$$ISERR(sc) do $system.Status.DisplayError(sc) quit

        // get the XML Document Object Model (DOM)
        set xmlDoc = reader.Document
 
        // create an XML Writer for outputting the formatted XML
        set writer = ##class(%XML.Writer).%New()

        set sc=writer.AddInstanceNamespace()

        // enable pretty-print formatting (indentation)
        set writer.Indent=1

        // set the output file path
        set sc=writer.OutputToFile(Path)
        if $$$ISERR(sc)  quit

        // write the formatted XML document to the file
        set sc = writer.Document(xmlDoc)
        if $$$ISERR(sc)  quit
        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Description
ClassMethod WriteXMLStreamToFile2(xmlStream As %Stream.Object, filePath As %String) As %Status
{
    Set sc = $$$OK
    Try {
        set status=##class(%XML.TextReader).ParseStream(xmlStream, .textReader)
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

/// Description
ClassMethod StreamToFile(stream As %Stream.Object, filePath As %String) As %Status
{
    Set sc = $$$OK
    Try {
        set file = ##class(%Stream.FileCharacter).%New()
        set file.Filename = filePath
        While ('stream.AtEnd) {
            do file.WriteLine(stream.ReadLine())
        }
    set sc = file.%Save()
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    Return sc
}

Storage Default
{
<Data name="HL7ProcessDefaultData">
<Subscript>"HL7Process"</Subscript>
<Value name="1">
<Value>SavePDF</Value>
</Value>
<Value name="2">
<Value>SaveCDA</Value>
</Value>
<Value name="3">
<Value>WorkPath</Value>
</Value>
</Data>
<DefaultData>HL7ProcessDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

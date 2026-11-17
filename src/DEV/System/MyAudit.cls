Class DEV.System.MyAudit Extends %Persistent
{

Index IDKEY On (UTCTimeStamp, SystemID, AuditIndex) [ IdKey, Internal, Unique ];

Property AuditIndex As %BigInt;

Property ClientExecutableName As %String(MAXLEN = 128);

Property ClientIPAddress As %String(MAXLEN = 128);

Property Description As %String(MAXLEN = 128);

Property Event As %String(MAXLEN = 64);

Property EventData As %String(MAXLEN = 16384);

Property EventSource As %String(MAXLEN = 64);

Property EventType As %String(MAXLEN = 64);

Property Namespace As %String(MAXLEN = 128);

Property Pid As %String(MAXLEN = 16);

Property Roles As %String(MAXLEN = 2048);

Property RoutineSpec As %String(MAXLEN = 512);

Property SystemID As %String(MAXLEN = 128) [ Required ];

Property Username As %String(MAXLEN = 160);

Property UTCTimeStamp As %String(MAXLEN = 64) [ Required ];

Property CSPSessionID As %String(MAXLEN = 16);

Property UserInfo As %String(MAXLEN = 64);

Property JobId As %String(MAXLEN = 16);

Property GroupName As %String(MAXLEN = 64);

Property Status As %Status [ InitialExpression = 1 ];

Property OSUsername As %String(MAXLEN = 16);

Property Authentication As %Integer;

Property StartupClientIPAddress As %String(MAXLEN = 128);

Storage Default
{
<Data name="MyAuditDefaultData">
<Value name="1">
<Value>AuditIndex</Value>
</Value>
<Value name="2">
<Value>ClientExecutableName</Value>
</Value>
<Value name="3">
<Value>ClientIPAddress</Value>
</Value>
<Value name="4">
<Value>Description</Value>
</Value>
<Value name="5">
<Value>Event</Value>
</Value>
<Value name="6">
<Value>EventData</Value>
</Value>
<Value name="7">
<Value>EventSource</Value>
</Value>
<Value name="8">
<Value>EventType</Value>
</Value>
<Value name="9">
<Value>Namespace</Value>
</Value>
<Value name="10">
<Value>Pid</Value>
</Value>
<Value name="11">
<Value>Roles</Value>
</Value>
<Value name="12">
<Value>RoutineSpec</Value>
</Value>
<Value name="13">
<Value>SystemID</Value>
</Value>
<Value name="14">
<Value>Username</Value>
</Value>
<Value name="15">
<Value>UTCTimeStamp</Value>
</Value>
<Value name="16">
<Value>CSPSessionID</Value>
</Value>
<Value name="17">
<Value>UserInfo</Value>
</Value>
<Value name="18">
<Value>JobId</Value>
</Value>
<Value name="19">
<Value>GroupName</Value>
</Value>
<Value name="20">
<Value>Status</Value>
</Value>
<Value name="21">
<Value>OSUsername</Value>
</Value>
<Value name="22">
<Value>Authentication</Value>
</Value>
<Value name="23">
<Value>StartupClientIPAddress</Value>
</Value>
<Value name="24">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^IRIS.AuditD</DataLocation>
<DefaultData>MyAuditDefaultData</DefaultData>
<ExtentSize>2900</ExtentSize>
<IdLocation>^IRIS.AuditD</IdLocation>
<IndexLocation>^DEV.System.MyAuditI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>46.65</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2026-11-09 09:40:07.468||local-rhel:UCR||38","2026-11-09 09:40:23.278||local-rhel:UCR||178","2026-11-09 09:40:44.904||local-rhel:UCR||374","2026-11-09 09:40:53.702||local-rhel:UCR||582","2026-11-09 09:59:26.368||local-rhel:UCR||889","2026-11-09 09:59:52.476||local-rhel:UCR||1002","2026-11-09 11:11:56.912||local-rhel:UCR||1252","2026-11-09 11:12:04.775||local-rhel:UCR||1441","2026-11-09 11:39:50.891||local-rhel:UCR||1826","2026-11-09 14:26:46.732||local-rhel:UCR||2231","2026-11-10 23:41:59.314||local-rhel:UCR||2444","2026-11-11 02:10:59.304||local-rhel:UCR||2566","2026-11-11 15:45:52.446||local-rhel:UCR||2741","2026-11-11 15:46:06.147||local-rhel:UCR||2990","2026-11-11 17:27:17.110||local-rhel:UCR||3132","2026-11-14 15:01:17.177||local-rhel:UCR||3317"),$lb(17,17,17,14,17,11,15,14,12,8,9,11,15,12,9),$lb(842019382,808922676,842214962,842214962,875834937,875834937,892546615,875575861,892942898,842411571,892481076,809056821,825309745,825898294,842674228,825375280,859388469,825897785,876229174,809050161,825237554,807416371,824193074,808598065,825571892,893007154,909783094,893006902,926560823,824193335,874524981,842019382))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AuditIndex">
<AverageFieldSize>5.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(38,178,374,582,889,1002,1252,1441,1826,2231,2444,2566,2741,2990,3132,3317),$lb(0,0,0,0,0,1,1,1,0,1,1,1,1,0,1),"")</Histogram>
<Selectivity>0.0345%</Selectivity>
</Property>
<Property name="Authentication">
<AverageFieldSize>3.66</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,32,32,32,32,1024,1024,1024,1024,1024,1024,8192,8192,8192,8192,8192),$lb(0,2,2,2,0,4,4,4,4,4,0,4,4,4,4),"")</Histogram>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="CSPSessionID">
<AverageFieldSize>3.85</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," XKCKUU7GX7"," XKCKUU7GX7"," ZPF8MZLTWM"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,12,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1481327435,0,0,1481327435,1515210296,542789702))</Histogram>
<OutlierSelectivity>.814815:</OutlierSelectivity>
<Selectivity>0.0587%</Selectivity>
</Property>
<Property name="ClientExecutableName">
<AverageFieldSize>3.67</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," CSPA24.SO"," CSPA24.SO"," CSPA24.SO"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,11,11),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129533505,0,0,0,0,541283152))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ClientIPAddress">
<AverageFieldSize>8.99</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"),$lb(2,2,2,2,2,2,1,14,14,14,14,14,14,14,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,825831982,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,540096818))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="Description">
<AverageFieldSize>46.4</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" /API/ATELIER LOGIN NON RIUSCITO"," CLEAR SWITCH 10"," CREA SEZIONE MAP.DEV GLOBAL HS.DOC.DATA.FIELDD"," CREA SEZIONE MAP.HSCONSUMER GLOBAL ENSEDI.ASTM.SCHEMA"," CREA SEZIONE MAP.HSCONSUMER GLOBAL IRIS.MSGNAMES(""HSOAUTH2SERVERERR"")"," CREA SEZIONE MAP.HSEDGE ROUTINE SCHEMAMAP*_INC"," CREA SEZIONE MAP.HSREGISTRY PACKAGE ENS"," CREATE APPLICATION /CSP/HEALTHSHARE/HSSYS/APP/API"," CREATE SECTION DATABASE HSSYSLOCALTEMP"," CREATE SECTION MAP.HSLIB GLOBAL HS.REPORTS.PAT8D83.SECTIONTYPED"," CREATE SECTION MAP.HSPILIB GLOBAL ENSHL7.SCHEMA(2.4)"," CREATE SECTION MAP.HSSYS GLOBAL IRIS.MSG(""ZHSUNIVERSALLOGINERR"")"," INITIALIZE DATABASE /HOME/INTERSYSTEMS/UCR/MGR/HSREGISTRY/"," MESSAGE BROWSER"," MODIFY LOGIN HSFCAMPARI@%HS_DEFAULT FOR USER HSFCAMPARI"," SHUTDOWN"),$lb(1,2,18,36,20,20,5,8,16,22,22,1,1,2,1),$lb(539967824,792809545,1129071937,1279607122,1380270368,1145394720,1213416271,1162761029,1230129491,1129270867,1162102597,1162102597,1380271945,542328154,1413816385,1095782476,1397048148,1145132097,1296125998,1279869472,1346980937,1346980937,1398362912,1129465153,1229867348,1229867348,1296388947,1163088705,1329875270,1297040457,1397249364,542328917))</Histogram>
<OutlierSelectivity>.09465:"Message Browser"</OutlierSelectivity>
<Selectivity>0.0127%</Selectivity>
</Property>
<Property name="Event">
<AverageFieldSize>19.1</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" APPLICATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," CONFIGURATIONCHANGE"," LOGINFAILURE"," ROLECHANGE"," VIEWCONTENTS"," VIEWCONTENTS"),$lb(1,21,21,21,21,21,21,21,21,21,21,1,1,1,14),$lb(541151312,1095782476,1129270854,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129270854,1280264009,1280264009,1380928581,1380928581,1447642455,0,0,542525765))</Histogram>
<OutlierSelectivity>.691358:"ConfigurationChange"</OutlierSelectivity>
<Selectivity>1.7317%</Selectivity>
</Property>
<Property name="EventData">
<AverageFieldSize>217.21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," COLLATION MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: 5"_$c(13,10)_"DATABASE MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: ENSLIB"_$c(13,10)_"LOCKDATABASE MODIFICATO:"_$c(13,10)_"  NUO"," COLLATION MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: 5"_$c(13,10)_"DATABASE MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: ENSLIB"_$c(13,10)_"LOCKDATABASE MODIFICATO:"_$c(13,10)_"  NUO"," COLLATION MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: 5"_$c(13,10)_"DATABASE MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: HSLIB"_$c(13,10)_"LOCKDATABASE MODIFICATO:"_$c(13,10)_"  NUOV"," COLLATION MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: 5"_$c(13,10)_"DATABASE MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: HSSYS"_$c(13,10)_"LOCKDATABASE MODIFICATO:"_$c(13,10)_"  NUOV"," COLLATION MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: 5"_$c(13,10)_"DATABASE MODIFICATO:"_$c(13,10)_"  NUOVO VALORE: HSSYS"_$c(13,10)_"LOCKDATABASE MODIFICATO:"_$c(13,10)_"  NUOV"," COLLATION MODIFIED:"_$c(13,10)_"  NEW VALUE: 5"_$c(13,10)_"DATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: ENSLIB"_$c(13,10)_"LOCKDATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: "_$c(13,10)_"NA"," COLLATION MODIFIED:"_$c(13,10)_"  NEW VALUE: 5"_$c(13,10)_"DATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: ENSLIB"_$c(13,10)_"LOCKDATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: "_$c(13,10)_"NA"," COLLATION MODIFIED:"_$c(13,10)_"  NEW VALUE: 5"_$c(13,10)_"DATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: ENSLIB"_$c(13,10)_"LOCKDATABASE MODIFIED:"_$c(13,10)_"  NEW VALUE: ENSL"," COPIA DATI AUDIT"_$c(13,10)_"DATA INIZIO:        INIZIO (2026-11-09 10:40:03.309)"_$c(13,10)_"DATA FINE:          FINE (2026-11-14 15:25:30.1"," CREATE ROLE:            %HS_USERMANAGER"_$c(13,10)_"DESCRIPTION:            "_$c(13,10,13,10)_"GRANTED ROLES:          "_$c(13,10)_"RESOURCE                "," GLOBALS MODIFIED:"_$c(13,10)_"  NEW VALUE: %DEFAULTDB"_$c(13,10)_"INTEROP MODIFIED:"_$c(13,10)_"  NEW VALUE: 0"_$c(13,10)_"LIBRARY MODIFIED:"_$c(13,10)_"  NEW VALUE: IRISLIB"_$c(13)," MESSAGE IDENTIFICATION: MESSAGEHEADERID = 293, MESSAGEBODYCLASSNAME = HS.UTIL.TRACE.REQUEST, MESSAGEBODYID = 202, SESSI"," MESSAGGIO DI ERRORE:ERRORE #798: AUTENTICAZIONE PASSWORD NON RIUSCITA"_$c(13,10)_"ERRORE #952: PASSWORD NON VALIDA"_$c(13,10)_"APPLICAZIONE C"," NOME QUERY:         LIST"_$c(13,10)_"DATA INIZIO:        INIZIO (2026-11-09 10:40:03.309)"_$c(13,10)_"DATA FINE:          FINE (2026-11-14 15"," SYSTEMMODE MODIFIED:"_$c(13,10)_"  NEW VALUE: DEVELOPMENT"_$c(13,10)_"  OLD VALUE: "_$c(13,10)),$lb(1,176,114,116,176,17,187,171,3,2,1,1,7,1,1),$lb(536870912,0,1129270348,0,0,169877582,538988117,1314213718,1314213718,0,0,1128354895,1162099213,0,0,0,0,1280065876,1346978080,1330661697,1380270420,1129465153,1196183362,1196183362,1296388947,1159743812,1195986720,1296388947,1313819973,1313819973,1398362964,542333267))</Histogram>
<OutlierSelectivity>.065844:"Collation modified:"_$c(13,10)_"  New value: 5"_$c(13,10)_"Database modified:"_$c(13,10)_"  New value: ENSLIB"_$c(13,10)_"LockDatabase modified:"_$c(13,10)_"  New value: "_$c(13,10)_"Namespace modified:"_$c(13,10)_"  New value: HSPILIB"_$c(13,10)</OutlierSelectivity>
<Selectivity>0.1146%</Selectivity>
</Property>
<Property name="EventSource">
<AverageFieldSize>9.22</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" %ENSEMBLE"," %ENSEMBLE"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"),$lb(11,2,9,9,9,9,9,9,9,9,9,9,9,9,9),$lb(539313486,0,0,1162761029,1398362964,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,539317081))</Histogram>
<OutlierSelectivity>.888889:"%System"</OutlierSelectivity>
<Selectivity>11.1111%</Selectivity>
</Property>
<Property name="EventType">
<AverageFieldSize>9.36</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" %LOGIN"," %MESSAGE"," %MESSAGE"," %SECURITY"," %SECURITY"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"," %SYSTEM"),$lb(2,10,2,11,3,9,9,9,9,9,9,9,9,9,9),$lb(539315279,1280264009,1296388947,0,0,1296388947,1397048149,0,0,1162040658,1498633285,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,539317081))</Histogram>
<OutlierSelectivity>.711934:"%System"</OutlierSelectivity>
<Selectivity>7.2016%</Selectivity>
</Property>
<Property name="GroupName">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="JobId">
<AverageFieldSize>5.13</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 1245212"," 131109"," 1441912"," 1441912"," 19398772"," 262199"," 262226"," 327706"," 65549"," 65549"," 65549"," 65549"," 65549"," 65549"," 65567"," 917615"),$lb(2,2,9,2,1,4,1,1,7,7,7,7,7,4,1),$lb(540095028,842282290,858861872,858861872,875835705,0,0,875835705,959658296,825832249,842412593,825833728,842151424,842412594,858928951,858928951,909456692,0,0,0,0,0,0,0,0,0,0,876150784,909574144,909456694,959526710,540619063))</Histogram>
<OutlierSelectivity>.386831:65549</OutlierSelectivity>
<Selectivity>0.6113%</Selectivity>
</Property>
<Property name="Namespace">
<AverageFieldSize>6.72</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," %SYS"," DEV"," HSREGISTRY"," HSSYS"),$lb(6,6,6,6,6,6,6,6,6,6,6,6,1,1,3),$lb(539317081,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,626219347,1145394688,1145394688,1213420101,1380271945,1398362880,541610835))</Histogram>
<OutlierSelectivity>.864198:"%SYS"</OutlierSelectivity>
<Selectivity>1.8429%</Selectivity>
</Property>
<Property name="OSUsername">
<AverageFieldSize>11.38</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," CSP GATEWAY"," IRISUSR"," IRISUSR"," IRISUSR"," IRISUSR"," IRISUSR"," IRISUSR"," IRISUSR"),$lb(13,13,13,13,13,13,13,13,1,9,9,9,9,9,9),$lb(541283152,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1129533472,1230129491,0,0,0,0,0,0,0,0,0,0,0,0,541676105))</Histogram>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="Pid">
<AverageFieldSize>6.71</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 18372"," 18372"," 18372"," 18372"," 18372"," 18372"," 22459"," 22751"," 2350"," 2460"," 2544"," 26225"," 26268"," 27433"," 3040"," 46237"),$lb(7,7,7,7,7,1,3,2,2,2,2,4,2,1,1),$lb(540096563,0,0,0,0,0,0,0,0,0,0,825766711,842150965,875903232,926232832,842478897,859123712,859123712,875966464,875966464,892613632,892613632,909259317,842334208,909639680,909260344,926167859,842478643,858797104,858797104,875967027,540292658))</Histogram>
<OutlierSelectivity>.380658:18372</OutlierSelectivity>
<Selectivity>0.5031%</Selectivity>
</Property>
<Property name="Roles">
<AverageFieldSize>375.35</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," %ALL"," %ALL"," %ALL"," %ALL"," %ALL"," %ALL"," %ALL,%DB_HSCUSTOM,%DB_HSLIB,%HS_DB_HSREGISTRY,%HS_DB_HSSYS"," %ALL,%DB_HSLIB,%DB_HSSYS"," %ALL,%DB_HSLIB,%DB_HSSYS"," %ALL,%DB_HSLIB,%DB_HSSYS"," %ALL,%MANAGER,%DEVELOPER,%DB_ENSLIB,%DB_HSAALIB,%DB_HSCUSTOM,%DB_HSLIB,%DB_HSSYS,%DB_USER,%ENSROLE_ADMINISTRATOR,%ENSRO"," %ALL,%MANAGER,%DEVELOPER,%DB_ENSLIB,%DB_HSAALIB,%DB_HSCUSTOM,%DB_HSLIB,%DB_HSSYS,%DB_USER,%ENSROLE_ADMINISTRATOR,%ENSRO"," %ALL,%MANAGER,%DEVELOPER,%DB_ENSLIB,%DB_HSAALIB,%DB_HSCUSTOM,%DB_HSLIB,%DB_HSSYS,%DB_USER,%ENSROLE_ADMINISTRATOR,%ENSRO"," %ALL,%MANAGER,%DEVELOPER,%DB_ENSLIB,%DB_HSAALIB,%DB_HSCUSTOM,%DB_HSLIB,%DB_HSSYS,%DB_USER,%ENSROLE_ADMINISTRATOR,%ENSRO"," %ALL,%MANAGER,%DEVELOPER,%DB_ENSLIB,%DB_HSAALIB,%DB_HSCUSTOM,%DB_HSLIB,%DB_HSSYS,%DB_USER,%ENSROLE_ADMINISTRATOR,%ENSRO"),$lb(1,6,6,6,6,6,5,12,26,26,7,121,121,121,121),$lb(536870912,0,625036364,0,0,0,0,0,0,0,0,0,0,0,740639810,1129665364,1279869484,0,0,0,0,1145200456,1296125505,0,0,0,0,0,0,0,0,539312460))</Histogram>
<OutlierSelectivity>.419753:"%All"</OutlierSelectivity>
<Selectivity>5.0158%</Selectivity>
</Property>
<Property name="RoutineSpec">
<AverageFieldSize>16.58</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," %ONAFTERSAVE+4^HS.REGISTRY.PERSON.USERLOGINID.1 |""^^/HOME/INTERSYSTEMS/UCR/MGR/HSLIB/""|"," AUDITVIEWMESSAGE+25^ENS.UTIL.AUDITING.1 |""^^/HOME/INTERSYSTEMS/UCR/MGR/ENSLIB/""|"," AUDITVIEWMESSAGE+25^ENS.UTIL.AUDITING.1 |""^^/HOME/INTERSYSTEMS/UCR/MGR/ENSLIB/""|"," TURNONSWITCH10+2^NSPACTIVATE |""^^/HOME/INTERSYSTEMS/UCR/MGR/""|"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,1,84,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,625954369,625954369,1096107081,0,0,1096107081,1414877774,542397778))</Histogram>
<OutlierSelectivity>.800412:</OutlierSelectivity>
<Selectivity>0.9373%</Selectivity>
</Property>
<Property name="StartupClientIPAddress">
<AverageFieldSize>8.43</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," 127.0.0.1"," 127.0.0.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"," 192.168.64.1"),$lb(2,2,2,2,2,2,1,11,2,14,14,14,14,14,14),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,825374510,0,0,842477104,959589937,0,0,0,0,0,0,0,0,0,0,0,0,540096818))</Histogram>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("1","1","1","1","1","1","1","1","1","1","1","1","1","1","1","1"),$lb(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),$lb(822083584,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,822083584))</Histogram>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="SystemID">
<AverageFieldSize>16</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR","local-rhel:UCR"),$lb(15,15,15,15,15,15,15,15,15,15,15,15,15,15,15),$lb(1819239265,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1819239265))</Histogram>
<OutlierSelectivity>.999999:"local-rhel:UCR"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="UTCTimeStamp">
<AverageFieldSize>25</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb("2026-11-09 09:40:07.468","2026-11-09 09:40:23.278","2026-11-09 09:40:44.904","2026-11-09 09:40:53.702","2026-11-09 09:59:26.368","2026-11-09 09:59:52.476","2026-11-09 11:11:56.912","2026-11-09 11:12:04.775","2026-11-09 11:39:50.891","2026-11-09 14:26:46.732","2026-11-10 23:41:59.314","2026-11-11 02:10:59.304","2026-11-11 15:45:52.446","2026-11-11 15:46:06.147","2026-11-11 17:27:17.110","2026-11-14 15:01:17.177"),$lb(17,17,17,14,17,11,15,14,12,8,9,11,15,12,9),$lb(842019382,808922676,842214962,842214962,875834937,875834937,892546615,875575861,892942898,842411571,892481076,809056821,825309745,825898294,842674228,825375280,859388469,825897785,876229174,809050161,825237554,807416371,824193074,808598065,825571892,893007154,909783094,893006902,926560823,824193335,874524981,842019382))</Histogram>
<OutlierSelectivity>.006173:"2026-11-09 10:44:46.566"</OutlierSelectivity>
<Selectivity>0.0345%</Selectivity>
</Property>
<Property name="UserInfo">
<AverageFieldSize>2.09</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," UNUSED"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1431197011,542461525))</Histogram>
<OutlierSelectivity>.985597:</OutlierSelectivity>
<Selectivity>1.4403%</Selectivity>
</Property>
<Property name="Username">
<AverageFieldSize>10.55</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," HSFCAMPARI"," HSFCAMPARI"," HSFCAMPARI"," HSFCAMPARI"," SUPERUSER"," SUPERUSER"," SUPERUSER"," SUPERUSER"," UNKNOWNUSER"," _SYSTEM"," _SYSTEM"," _SYSTEM"," _SYSTEM"," _SYSTEM"," _SYSTEM"),$lb(1,12,12,12,1,11,11,11,1,1,9,9,9,9,9),$lb(536870912,0,1213417027,0,0,0,0,0,0,1213417027,1398100037,0,0,0,0,0,0,1398100037,1431194446,1431194446,1599297875,0,0,0,0,0,0,0,0,0,0,543118169))</Histogram>
<OutlierSelectivity>.382716:"_SYSTEM"</OutlierSelectivity>
<Selectivity>5.8037%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-1472</BlockCount>
</SQLMap>
<StreamLocation>^DEV.System.MyAuditS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

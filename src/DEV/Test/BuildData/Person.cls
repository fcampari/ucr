Class DEV.Test.BuildData.Person Extends %RegisteredObject
{

/// Description
ClassMethod Build(num As %Integer) As %Status
{
    Try {
        set names = $LISTBUILD("Marco", "Lorenzo", "Fabio", "Anna", "Carla","Fabrizio",
                                "Mario", "Dario", "Stefano", "Simone",  "Roberta", "Giulia", "Sara", "Stefania",
                                "Giuseppe", "Marco", "Luca", "Francesca", "Alessandra",
                                "Matteo", "Andrea", "Antonio", "Giovanni", "Davide",
                                "Paola", "Simona", "Federico", "Stefano", "Gabriella",
                                "Leonardo", "Riccardo", "Daniela", "Salvatore", "Emanuele",
                                "Michele", "Pietro", "Angela", "Vincenzo", "Fabio"
                                ) 
        set lastNames = $LISTBUILD("Rossi", "Russo", "Ferrari", "Esposito", "Bianchi",
                                    "Romano", "Colombo", "Ricci", "Marino", "Greco",
                                    "Bruno", "Gallo", "Conti", "De Luca", "Mancini",
                                    "Costa", "Giordano", "Rizzo", "Lombardi", "Moretti",
                                    "Barbieri", "Fontana", "Santoro", "Mariani", "Caruso"
                                    )

        
    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    quit tSC
}

}

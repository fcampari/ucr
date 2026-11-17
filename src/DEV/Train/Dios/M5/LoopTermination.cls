Class DEV.Train.Dios.M5.LoopTermination Extends %RegisteredObject
{

ClassMethod Continue()
{
    Set sc = 0
    While (sc <= 5 ) {
        
        if (sc = 3){
            set sc = sc + 1
            continue
        }

        w sc
        set sc = sc + 1   
    }
}

ClassMethod Quit()
{
    Set sc = 0
    While (sc <= 5 ) {
        
        if (sc = 3){
            set sc = sc + 1
        }

        w sc
        set sc = sc + 1   
    }
}

ClassMethod Return()
{
    Set sc = 0
    While (sc <= 5 ) {
        set i = 0
        While (i <= 5) {
            if (i=3){
                return
            }
            w "a"
            set i = i + 1
        }
        w sc
        set sc = sc + 1   
    }
}

}


#define WAIT_TIMEOUT 258

/*
    For now using Ev1 as a local var is a bit tricky
    Func testing needs to be defined before main and
    Ev1 needs to be defined before waitfor.

*/


func testing ()
    int z, i

    while TRUE

        switch ( i = w () )
            case WAIT_TIMEOUT
                if ( z < 2 )
                    info ( "Timeout" )
                    ++ z 
                end
                break
            case 2
                info ( "Test 2" )
                break
            case 3
                return
            default
                mess ( i ) 
        end
    wend
end


form main ()
    layout "Event test" sysmenu 

 a        a
 a        a
 a        a
 a        a
end
event Ev1 [4]
int i
pre
    process ( testing )
end
field
IDCANCEL
    select
        setevent ( Ev1, 3 ) 
        sleep ( 10 )
    end

a: BT "Event 0"
    select
        setevent ( Ev1, 0 ) 
    end

a: BT "Event 1"
    select
        setevent ( Ev1, 1 )
    end

a: BT "Event 2"
    select
        setevent ( Ev1, 2 )
    end

end


func w ()
    return waitfor ( main.Ev1, 20000 )      //20 sec timeout
end

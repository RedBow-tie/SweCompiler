font F1 "Times New Roman" size= 12

text Str

event Ev [3]

func addc ( char c 2 )
    protect
        Str += c
    end
end

func test1 ()
    int i

    for ( i = 0; i < 100; ++ i )
        addc ( "!" )
    end
    setevent ( Ev, 0 )
end


func test2 ()
    int i

    for ( i = 0; i < 100; ++ i )
        addc ( "z" )
    end
    setevent ( Ev, 1 )
end

func test3 ()
    int i

    for ( i = 0; i < 100; ++ i )
        addc ( "6" )
    end
    setevent ( Ev, 2 )

end


form main ()
    layout "Protect"  sysmenu y2 + 10  

 a                              a c      c                               
 a                              a
end
    pre
        .font ( T1, F1 )
        .color ( T1, color.red )
        .font ( T2, F1 )
        .color ( T2, color.red )
    end

field
a: T1 ltext "This program test the PROTECTION section statement" 
a: T2 ltext "3 threads adds a singel char to the same string (!,z,6)"

c: BT "Run" 
    select 
        resetevent ( Ev, 0 )
        resetevent ( Ev, 1 )
        resetevent ( Ev, 2 )

        process ( test1 )
        process ( test2 )
        process ( test3 )

        waitforall ( Ev, 2000 )
        info ( Str )  
        Str = ""

    end
end

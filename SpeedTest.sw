
font F1 "Times New Roman" size= 12

func run_fn ( int i )
end

form main ()
    layout "Simple speedtest"  sysmenu 
 a                          a c      c                               
 a                          a 
 b                          b
 b                          b
 b                          b
 b                          b
 b                          b


end
    pre
        .font ( T1, F1 )
        .color ( T1, color.red )
        .font ( T2, F1 )
        .color ( T2, color.red )

        .font ( R0, F1 )
        .color ( R0, color.blue )
        .font ( R1, F1 )
        .color ( R1, color.blue )
        .font ( R2, F1 )
        .color ( R2, color.blue )
        .font ( R3, F1 )
        .color ( R3, color.blue )
        .font ( R4, F1 )
        .color ( R4, color.blue )
    end

field
a: T1 ltext "This program runs 2 loops (for && while)" 
a: T2 ltext "5 000 000 Times" 
b: R0 ltext 
b: R1 ltext 
b: R2 ltext 
b: R3 ltext 
b: R4 ltext 

c: BT "Run" 
    select 
        long j
        int z, z1, i

        .clear ( R0 )
        .clear ( R1 )
        .clear ( R2 )
        .clear ( R3 )
        .clear ( R4 )

//------
        .value ( R0, "* Measuring *" )
        z = systemtimer
        for ( i = 0; i < 5000000; ++ i )
        end
        z1 = systemtimer
        .value ( R0,  "for loop1 (int) takes " + itoa ( z1 - z ) + " mS" )
//------
        .value ( R1, "* Measuring *" )
        z = systemtimer
        for ( j = 0; j < 5000000l; ++ j )
        end
        z1 = systemtimer
        .value ( R1,  "for loop2 (long) takes " + itoa ( z1 - z ) + " mS" )
//------
        .value ( R2, "* Measuring *" )
        z = systemtimer
        j = 0
        while ( j < 5000000l )
            ++ j
        wend
        z1 = systemtimer
        .value ( R2,  "while loop1 takes " + itoa ( z1 - z ) + " mS" )
//------
        .value ( R3, "* Measuring *" )
        z = systemtimer
        j = 0
        while ( ++j < 5000000l )
        wend
        z1 = systemtimer
        .value ( R3,  "while loop2 takes " + itoa ( z1 - z ) + " mS" )
//------
        .value ( R4, "* Measuring *" )
        z = systemtimer
        j = 0
        while ( ++j < 5000000l )
            run_fn ( 100 )
        wend
        z1 = systemtimer
        .value ( R4,  "while loop3 takes " + itoa ( z1 - z ) + " mS" )
    end
end




char a1 50
char a2 50

char c1 100
text c2

form string_test ()
    layout "Displays results from different string format" sysmenu

    b     ba                                      a
    b     ba                                      a
    b     ba                                      a
    b     ba                                      a
    b     ba                                      a
    b     ba                                      a
    b     ba                                      a
    a                                                a
    a                                                a
    a                                                a
    end

    pre
        .value ( E1, "Anders" )

        a1 = "where id=[.E1]"
        a2 = "where id=[#.E1]"

        c1 += "Test1"

        .display ()
    end

field
b: "Input"
b: "[.E1]"
b: "[#.E1]"

a: E1 EDIT
    leave
        c1 = ""
        .display ()
    end
a: EDIT, display ( "where id=[.E1]" ) 
a: EDIT, display ( a2 )
a: EDIT, display ( c1 )
a: EDIT, display ( c1 += " Test11" )
a: EDIT, display ( c1 += " Test111" )

end

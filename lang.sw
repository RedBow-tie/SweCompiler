
lang "testlang1"
test, "This is a test"
field_a, "Testing ABCDEFG"
Lang1, "Test 1"
Lang2, "Test 2"
end


lang "testlang2"
test, "This is lang2"
field_a, "Testing HIJKLMN"
Lang1, "Testing 1"
Lang2, "Testing 2"
end

form main ()
    layout "Lang test" sysmenu

 a           a b      b
 a           a b      b
 a           a b      b


    end
    pre
        disp ()
    end
field
a: LTEXT, display (  @ "test" )
a: LTEXT, display (  @ "field_a" )
b: B1 BT "Lang1"
    select 
        if ( set_lang ( "testlang1" ) )
            message ( "Can't set lang" )
        end
        disp ()
    end
b: B2 BT "Lang2"
    select 
        if ( set_lang ( "testlang2" ) )
            message ( "Can't set lang" )
        end
        disp ()
    end
b: BT "Default"
    select 
        set_lang ( "" )
        disp ()
    end
end

func disp ()
    main.value ( B1, @ "Lang1" )
    main.value ( B2, @ "Lang2" )
    main.display ()
end



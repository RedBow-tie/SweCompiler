

form start (), wait
    layout "Tooltip"   SYSMENU 


    a      a        c       c

    a      a
 
end
pre
    .value ( E1, "String 1" )
    .value ( E2, "String 2" )

end
tooltip
E1, "This is Edit 1"
E2, "This is Edit 2.\nEdit1 is " + .E1
B1, "Hey! You find the button"

field
a:  E1 edit
a:  E2 edit
c:  B1 BT "Test"
end


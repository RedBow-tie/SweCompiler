
text demo = "Line1|Line2|Line3|Line4|Line5|Line6|Line7"

form select_test ()
    layout "Select test" SYSMENU

 a                 b                   c






                                                                        
                  a                   b                    c
 a                 b                   c


                                                                        
                  a                   b                    c





    end
    pre
        .additem ( C1, demo ) 
        .label ( L2, "Test" )
        .additemy ( L1, demo ) 
        .additemy ( L2, demo ) 
    end
field
a: C1 COMBOBOX
    value_change 
        .additem ( L3, .value ( C1 ) )
    end
b: L1 LCB       //can't get list box to work here 
    select_item (int i )
        .additem ( L4, .getitem ( L1, i, 0 ) )
    end
    deselect_item (int i )
        .delitem ( L4, .getitem ( L1, i, 0 ) )
    end

c: L2 LISTCONTROL
    select_item (int i )
        .additem ( L5, .getitem ( L2, i, 0 ) )
    end
    deselect_item (int i )
        .delitem ( L5, .getitem ( L2, i, 0 ) )
    end

a: L3 LB    //=Listbox
b: L4 LB
c: L5 LB

end

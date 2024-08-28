
text demo = "Line1|Line2|Line3|Line4|Line5|Line6|Line7"

form check_test ()
    layout "Check test" SYSMENU

 a          a      b                   c
 a          a 
 a          a
 a          a




                                                                        
                                      b                    c
 a                 b                   c


                                                                        
                  a                   b                    c





    end
    pre
        .label ( L2, "Test" )
        .additemy ( L1, demo ) 
        .additemy ( L2, demo ) 
    end
field
a: CB1 RB "Check 1"
    select
        test_rb ( .CB1 )
    end
a: CB2 RB "Check 2"
    select
        test_rb ( .CB2 )
    end
a: CB3 RB "Check 3"
    select
        test_rb ( .CB3 )
    end
a: CB4 TB "Check 4"
    select
        test_rb ( .CB4 )
    end

b: L1 LCB     
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

func test_rb ( text t )
    check_test.additem ( L3, t ) 

end

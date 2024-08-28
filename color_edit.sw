


form start ()
    layout "Color edit" sysmenu

  a      a
    end
    pre
        .display ()
    end
field
#reuse
a: "Hi Liza"
#newline

a: EDIT disabled, display ( "Foo" ) 
#newline
a: EDIT readonly, color=red display ( "Foo" ) 
#newline
a: EDIT disabled, bcolor=red display ( "Foo" ) 
#newline
a: EDIT disabled, color=red bcolor=yellow display ( "Foo" ) 
#newline
#newline

a: EDIT, color=green display ( "Foo" ) 
#newline
a: EDIT, color=red display ( "Foo" ) 
#newline
a: EDIT, bcolor=red display ( "Foo" ) 
#newline
a: EDIT, color=red bcolor=yellow display ( "Foo" ) 
#newline

#newline

a: BT, color=green display ( "Foo" ) 
#newline
a: BT, color=red display ( "Foo" ) 
#newline
a: BT, bcolor=red display ( "Foo" ) 
#newline
a: BT, color=red bcolor=yellow display ( "Foo" ) 
#newline
end

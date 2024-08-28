

int i 
long l
double d
float f

form start ()
    layout "Test ++/--" sysmenu

 a      ab     b a      ab     b a      ab     b a      ab     b
 a      ab     b a      ab     b a      ab     b a      ab     b
 a      ab     b a      ab     b a      ab     b a      ab     b
 a      ab     b a      ab     b a      ab     b a      ab     b
 a      ab     b a      ab     b a      ab     b a      ab     b
 a      ab     b a      ab     b a      ab     b a      ab     b

end
    pre
        i = 10
        l = 20
        d = 30
        f = 40
        .display ()
    end
field
a: "11 int - -"

//~ a: "11 ++ int"
b: ED, display ( ++ i )

a: "21 ++ long"
b: ED, display ( ++ l )

a: "41 ++ float"
b: ED, display ( ++ f )

a: "31 ++ double"
b: ED, display ( ++ d )



a: "11 int - -"
b: ED, display ( i -- )

a: "21 long - -"
b: ED, display ( l -- )

a: "41 float - -"
b: ED, display ( f -- )

a: "31 double - -"
b: ED, display ( d -- )


a: "10 int"
b: ED, display ( i )

a: "20 long"
b: ED, display ( l )

a: "40 float"
b: ED, display ( f )

a: "30 double"
b: ED, display ( d )



a: "30 += 20 int"
b: ED, display ( i += 20 )

a: "40 += 20 long"
b: ED, display ( l += 20 )

a: "60 += 20 float"
b: ED, display ( f += 20 )

a: "50 += 20 double"
b: ED, display ( d += 20 )



a: "25 -= 5 int"
b: ED, display ( i -= 5 )

a: "35 -= long"
b: ED, display ( l -= 5 )

a: "55 -= float"
b: ED, display ( f -= 5 )

a: "45 -= double"
b: ED, display ( d -= 5 )

end



char z 50
int i = 100
int j
int i1

// ! text right align
// $ text left align



form start ()
    layout "Math test/Loop test"   SYSMENU 


    a    a c   c
    a    a c           c
    a    a c       c 
    a    a c       c
    a    a b       b 
    a    a b       b
    a    a b       b
    a    a
    a    a
    a    a
    a    a
    a    a
    a    a b      b 
    a    a

end
    pre
        z = "ABCDEFGHIJ"
        .display ( )
    end
field
a:  edit, display ( 10 * 20 + 30 )
a:  edit, display ( 30 + 10 * 20 )
a:  edit, display ( left ( z, 4 ) )
a:  edit, display ( right ( z, 6 ) )
a:  edit, display ( mid ( z, 3, 4 ) )
a:  edit, display ( i ++ )
b:  edit, display ( i )
a:  edit, display ( ++ i )
b:  edit, display ( i )
//a:  edit, display ( x )
c:  edit, display ( loop ())
c:  edit, display ( loop1 ())
c:  edit, display ( loop2 ())
c:  edit, display ( test ())
b:  edit, display ( i )

end

sfunc  loop ()
    z = ""
    for ( i = 0; i < 10; ++ i )
        if ( i == 6 )
            break
        end
        if ( i < 3 )
            continue
        end
        z = z + itoa ( i )
    end
    z = z + "Q"
break_point
    return z   //345Q
end

sfunc loop1 ()
    z = ""
    for ( j = 0; j < 5; ++ j )
        i = 0
        while ( i < 5 )
            if ( j == 0 )
                break
            end
            if ( j == 2 )
                break
            end
            ++ i
            if ( i < 4 )
                continue
            end
            z = z + j + i + " " 
        wend
        if ( j == 4 )
            break
        end
        z = z + "!" 
    end
    z = z + "Q"
    return z   //!14 15 !! 34 35 ! 44 45 Q
end

func loop2 ()
    for ( i = 0; i < 5; ++ i )
        for ( j = 0; j < 5; ++ j )
            if ( j == 2 )
                break
            end
        end
        if ( i == 3 )
            break
        end
    end
    return i * 10 + j  //32
end

//A0B3B4C4D0

sfunc test ()

    i = 0
    z = ""
    
    goto l1
    i = i + 1
l1:
    z = z + "A" + itoa(i) 
    j = 2
    goto l4
    i = i + 1
l2:
    i = i + 10
l3:
    for ( j = 0; j < 10; ++ j )
        z = z + "B" + itoa(j) //1
        if ( j == 4 )
            goto l5
        end
l4:
    end
    i = i + 1
l5:
    z = z + "C" + j 
    z = z + "D" + i
    return z
end


func test1 ( int xx )

    return xx
end

func sw_test ( int a, int b )
    switch ( a )
        case 10
            switch ( b )
                case 4
                break
            end
            message ("")
            break
        case 20
            a = test1 (a)
            z = a
            //test1.set_value ( 2, "kljj" )
            break
    end
end




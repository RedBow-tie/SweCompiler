

bitmap tt size(256, 256)  
....b...
........
........
........
t.......c.
........
........
........
........
........
...x....
end
b: red
//~ paint
   //~ line ( 100, 200, 255 )

        
//t: TEXT "COMPANY_INC" blue
end


char xx 20

Font Font_1 "Comic Sans MS" size=14  p3=-900

form start ()
    layout "Paint"   SYSMENU 
                    b      b
    a      
            
 
              a
                    c       c

    a      a
 
    end

field
    paint ( cre x )
    
        int a, b
        
        a = x.xx / 2
        b = x.yy / 2

        line ( a, b, a + 30, b +30, color.red ) 

        end
a:  E1 bt
    PAINT ( cre x )
    
        layout z1 XSTEP = 2 ySTEP = 6
            a 
            z 
            e 
         b     c          

            v    x
              w
        v        y   v

        end

        layout z XSTEP = 2 ySTEP = 6
  a             b    e  
                 

        w        


                 
   c                 d
        end

        int co [6]

        //points ( z.asderfds )

        //color ( des, color.red )
        //gfill ()


        co [0] = color.rgb ( 10,10,10 )
        co [1] = color.rgb (10,10,10 )

//        gfill ( z.abcde, co )
//        gfill ( z.abcde, co [] )


       line ( z.ac, color.green, 3 )
       line ( z.cd, color.GREEN )
       //fill ( z.z, color.GREEN )

        double zz
int i

        //print ( z.e, "Kalle" )  //b/w

        PRINT ( z.a, "Test", color.red )
        PRINT ( Font_1, z.e, "Font" ) //, color.white, color.blue )

//        TEXTOUT ( font, z.ae, "Test" )
//        TEXTOUT ( font, pos1, pos2, pos3, pos4, "Test", color )


        i = x.yy / 2
  //      line ( 0, i, x.x1, x.y1 / 2, color.GRAY )
  //  ROUNDRECT ( z.ad, color.green )


    //pie ( z.adew, color.green )
/*

        for ( zz = 0, zz < PI2, zz = zz + PI2 / 60 )
            dot ( to_int ( zz * 8 ), to_int ( sin ( zz ) * 20 ) + i, color.green )
        end
*/

//        circle ( z.cx, color.green )
//        dot ( z.z, color.black )
       // rect ( z.vb, color.green )
        //fill ( z.w, color.GREEN )

       // message ( x.x1 )
        //message ( x.y )


//int xx
 
/*
        layout z
        a     
                    b
        v     b   v
        end
*/

/*
layout pp 
................
................
................
........a......
................
......z...w.....


...............
....c...e...d..
................
................
................
........b......
................
.
.
.
....e........f.
................
end
*/
    end
 /*

    len
    x, y
    x, y



    len
    x, y
    x, y

    mul x
    mul y

    pos 


    len 
    p1
    p2
    p3


  pp.rotate ( e, 20 ).abcdef 

    line ( 20, 22, color.RED )
    line ( pp.aedsqce ( 12.33, 33.22 ), color.red )
    line ( pp.aedsqce ( x, y ), color.red )
    line ( pp.aedsqce, color.red )
    dot ( pp.aedsqce, color.red )


        work_area z

        z = work_area ( p2 - p1 )

        for ( z = 0, z < PI2, z += PI2 / 8 )
            z.line ( z.e, sin ( z ), cos ( z ) )
            z.line ( p2.x, p1.y, z.e.x + sin ( z ) * 10, z.e.y + cos ( z ) * 10, red )
            arrow ( z.b )
z.e, 
        z.line ( x, y, 2 )
        z.move_to ( z.a ) 
        z.line ( p2, RED ) 
        line ( p2 - z.b, RED ) 
        line ( z.c, z.d )
        fill ( p1, p2, GREEN )
        ptext ( font, size )
        circle ( z.c, z.e, BLUE, 1 )
        sin ( a )
        rect ( 

a:        move_to ( x, y )

        
        move_to ( x, y )
        move_to ( p, x, y )

        move_work ( z, 0, 0 )
        move_work ( 0, 0, z )

        work_area ( 0 )
 
        //line_to
        //move_to
    end
*/

a:  E2 edit
b:  BT "Nop"
end




    

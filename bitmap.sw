
int zz, z


form start ()
    layout "Create bitmap"  maxbox MINIBOX SYSMENU x2=320 y2=200  xstep - 3 


       a          c1   c1   c1   c1   c1   c1   c1   c1       

                  c2   c2   c2   c2   c2   c2   c2   c2      
              a
   w

              c3   c3   c3   c3  
              a abbccdd














                                                                w
end
    pre

    end
field
    select ()
 
        if ( z <= 2 )
            return ( TRUE )
        end
        if ( z >= C1  && z <= C2 )

            .bcolor (C1, start.bcolor ( z ) )
        end
    end
a: C1    ltext notify border, bcolor = BLACK
//wsize(12,12)
#use_one_point
c1:     ltext notify border, bcolor = BLACK
c1:     ltext notify border, bcolor = RED
c1:     ltext notify border, bcolor =GREEN
c1:     ltext notify border, bcolor =YELLOW
c1:     ltext notify border, bcolor =BLUE
c1:     ltext notify border, bcolor =MAGENTA
c1:     ltext notify border, bcolor =CYAN
c1:     ltext notify border, bcolor =Lt_GRAY
c2:     ltext notify border, bcolor =Lt_RED
c2:     ltext notify border, bcolor =Lt_GREEN
c2:     ltext notify border, bcolor =Lt_BLUE
c2:     ltext notify border, bcolor =Lt_MAGENTA
c2:     ltext notify border, bcolor =Lt_CYAN
c2:     ltext notify border, bcolor =WHITE
c2:     ltext notify border, bcolor =LIGHT3D
c2: C2  ltext notify border, bcolor =GRAY
 
//wsize(6,6)

//#repeat_line ( 3, 2, 3 )
c3:     ltext "a"  notify border, bcolor =WHITE
c3:     ltext notify border, bcolor =WHITE
c3:     ltext notify border 
c3:     ltext notify border 

#use_two_point


end

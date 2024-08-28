

query xx


bitmap aa size (16,16)
abbbbbbbbbbacccc
defghijkklmncccc
bobbbbbbbbbbbacc
bodefghijkklmnpc
bobobbbbbbbbbbba
bobodefghijkklmn
bqbobobbbbbbbbrb
bobobobssssssbrb
bobqbobsbbbbsbtb
bobobobsbukbsbvb
bobobqbsbwxbsbvb
abbobobsbbbbsbtb
ccbobobssssssbvb
cccbbobbbbbbbbrb
ccccboyz{wBCDEvb
cccccbbbbbbbbbba
end
c: RGB ( 0, 0, 0 )
a: RGB ( 205, 227, 141 )
b: RGB ( 156, 199, 28 )
d: RGB ( 158, 200, 32 )
e: RGB ( 226, 252, 150 )
f: RGB ( 227, 246, 167 )
g: RGB ( 226, 238, 190 )
h: RGB ( 228, 234, 211 )
i: RGB ( 229, 231, 222 )
j: RGB ( 231, 231, 229 )
k: RGB ( 230, 230, 230 )
l: RGB ( 226, 229, 218 )
m: RGB ( 215, 231, 169 )
n: RGB ( 180, 209, 91 )
o: RGB ( 226, 255, 139 )
p: RGB ( 254, 254, 254 )
end


bitmap disk size (25,25) 
................
................
................
................
................
................
.xxxxxxxxxxxxxx.
.x............x.
.x............x.
.x........yyy.x.
.x........yyy.x.
.x............x.
.xxxxxxxxxxxxxx.
................
................
................
end
.: WHITE
y: GREEN
x: GRAY
end



bitmap aaa size(25, 25) xpm ( "arrow_1_green.xpm" )  //load ( "\cito\res\3dcheck.bmp" )

bitmap b_n1 load ("3dcheck.bmp" ) 


bitmap b_not size (70,39)  // load (/* 32748 */ "\cito\res\3dcheck.bmp" ) 
..........
zzzzzzzzzzz
..........
zzzzzzzzzzz
..........
zzzzzzzzzzz
..........
zzzzzzzzzzz
..........
 zzzzzzzzzzz
end 
.:   YELLOW    
z:   BLUE 

    //~ BLUE LINE 1 2     "mnom"
    //~ RED circle 1    "cC"
    //~ GREEN ellipse 1 5    "ba"
    //~ YELLOW fill 1       "px" 
    //~ Y   TEXT "jkh" 2 "iouu" "av"
    //~ RGB(23,22,33) rect 2 3 "jjkk"

    //~ RGB (fn(1)) LINE 2 2    "nN"
    //~ RED LINE 2 2            fn ( konst, ... )  = fn (x,y,konst)
    //~ RGB (fn(konst)) LINE 2 2    fn (a, b)

    //~ Y REFPOINT                 "c"
    //~ B REFPOINT                 "C" = "c"
//ac:     YELLOW REFPOINT 2 
    //RED GFILL 2 "abcacd"
    
end

bitmap ab size(24, 70) xpm ( "dot-red.xpm" )  //load ( "\cito\res\3dcheck.bmp" )
 ....               
 ....              
 ....     xxxxxxx             
 ....     xxxxxxx
          xxxxxxx               
 a                    d
  t


           
     





 b                    c
end
 :  OrangeRed 
.:  BLUE      
//x:  GREEN  
//ac:     YELLOW REFPOINT  
//f:  FONT "Times New Roman" size=10  yellow  //italic STRIKEOUT UNL WEIGHT=100  //Bg_color

//t: TEXT "Nisse" font=f RED
 
a<yellow>bc<yellow>a<yellow>c<green>d: GFILL RED 

end


handle hh

IMAGELIST b1
aa
disk
hh
ab
end

int q1


funk xx1 ( char p0 50, int p1, char p2 200, int p3, int p4  )

//message ( p2 )
      if ( p2 == "." || p2 == ".." )
            return (1)
      end

     st.additem ( T1, p2 )
  //   st.change_icon ( T1, last_id, q1 )

      if ( ++ q1 > 4 )
            q1 = 0
      end
    //p0 = "54544"
    //message ( p0 + "!" + p2 + "      " + itoa (p3 ) )
end


form start (), modal
    layout "Tree/Bitmap test"  maxbox MINIBOX SYSMENU x2=320 y2=250  xstep - 3 // size(320, 250) Frame size font = "kjhkhjkh" size=12

    a                b                b

            a

    a








                         

                                                          a
    end
    pre

    //file_find ( "*", 0, xx1 )
   
        hh = load_bmp ( 158 )
      //.set_icon ( B1, hh )

      .additem ( T1, "Misse;kalle;Lisa" ) 
      .additem_i ( T1, 2, "Hej" )
      .additem_i ( T1, 1, "Hopp;ppp" )
  
      .imagelist ( T1, b1 )
/*
      .change_item_ic ( T1, 1, 1 )


    .change_item ( T1, Str, Str )
    .change_item_i ( T1, int, int )  // Bytid
    .change_item_o ( T1, int, int )  // Byt oid

    .change_item_i ( T1, int, Str )  // Byt text
    .change_item_o ( T1, int, Str )

    .change_item_io ( T1, int, int )
    .change_item_oi ( T1, int, int )
    .change_item_ch ( T1, int, int ) // child on/off
    .change_item_i_icon ( T1, int, int )
    .change_item_o_icon ( T1, int, int )

    .ch_it_o_ic
    .ch_it_oi

    .image_list ( T1, lista )

    xx = .find_item ( T1, str )
    xx = .find_item_i ( T1, str )
    xx = .find_item_o ( T1, str )

    .num_items ( T1 )
    item xx

    xx=list_items_i ( T1, id )
    xx=list_items_o ( T1, id )
    xx=list_items ( T1 )
    
    while ( xx )

    xx = 0

    ++ xx

    xx.oid
    xx.id
    xx.fg
    xx.bg
    xx.sub_id
    xx.sub_oid
    xx.parent_id
    xx.parent_recid

    xx.data [i]  [] endast listcontroll

    

    start_drag ( item )

      ret false om ej tillåtet
        dragto ( T1,t2,t3 )

    stop_drag ( id, f_item t_item)
        ret false om ej tillåtet

display ( )
display ( sql )
display ( sql, 2 )


*/
        .display ( )
    
    end
field
a:  B1 bt , image ( b_not)
a:  T1 TREE
b:  edit

/*
------------------------------------------


z: LINE RED
x<+a,+b,cc><+x,+0>: LINE CC
?? dynamic


a: rect xx ()


a: rect bg_color=var.xx1

    <+5,+b><+x,+0>: LINE CC
    <+5,+b><+x,+0>: LINE red

paint xx ()
    line (10, 20, 0, 5)

end

 
------------------------------------------      
*/
//c: class "NetUIHWND",
end
  

/*

rec_id
id
.

12
34
*/






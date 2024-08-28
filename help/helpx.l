
/*

text Ab

func test1 ()
    Ab = "nisse grus"

    test2 ( Ab )

end

func test2 ( text Ab )
  mess ( Ab )
end
*/

func main ()
 int i 
    i = load_dll ( "riched20.dll" )
    mess ( i ) 

    ed_help ()
end


char apa

struct tablerow
							// EM_INSERTTABLE wparam is a (TABLEROWPARMS *)
	char	cbRow			// Count of bytes in this structure
	char	cbCell 		// Count of bytes in TABLECELLPARMS
	char	cCell			// Count of cells
	char	cRow			// Count of rows
	int 	dxCellMargin	// Cell left/right margin (\trgaph)
	int 	dxIndent		// Row left (right if fRTL indent (similar to \trleft)
	int 	dyHeight		// Row height (\trrh)
    int     flag
	//~ DWORD	nAlignment:3;	// Row alignment (like PARAFORMAT::bAlignment, \trql, trqr, \trqc)
	//~ DWORD	fRTL:1; 		// Display cells in RTL order (\rtlrow)
	//~ DWORD	fKeep:1;		// Keep row together (\trkeep}
	//~ DWORD	fKeepFollow:1;	// Keep row on same page as following row (\trkeepfollow)
	//~ DWORD	fWrap:1;		// Wrap text to right/left (depending on bAlignment)
	//~ DWORD	fIdentCells:1;	// lparam points at single struct valid for all cells
	int 	cpStartRow		// cp where to insert table (-1 for selection cp)
	//	(can be used for either TRD by EM_GETTABLEPARMS)
	char	bTableLevel	// Table nesting level (EM_GETTABLEPARMS only)
	char	iCell			// Index of cell to insert/delete (EM_SETTABLEPARMS only)
end

def struct _paraformat 
    int _size
    int mask
    short wNumbering
    short wEffects
    int dxStartIndent
    int dxRightIndent
    int dxOffset
    short wAlignment
    short cTabCount
    int rgxTabs [32]
end

struct _paraformat paraformat

int cur, Grp
query sql1, sql2

menu menu1
    menu_item ( M1, "File", m_submenu )
    menu_item ( M_SQL, "SQL", m_last )
end

struct comp_color
    int txt
    int bg
    int effect
end

struct charformat 
    int _size
    int mask
    int effects
    int yheight
    int yoffset
    int _color
    char charSet
    char family
    char facename 34
end

def struct charfmt22 
	int		_size
	int		mask
	int		effects
	int		height
	int		offset			// > 0 for superscript, < 0 for subscript 
	int	    _color
	char	charSet
	char	pitch
	char	facename 32
	short	weight			// Font weight (LOGFONT value)		
	short	spacing			// Amount to space between letters	
    short slask
	int	    bgcolor		// Background color 				
	int		lcid				// Locale ID						
    int		cookie	 		// Client cookie opaque to RichEdit
	short	style 			// Style handle 					
    short	kerning			// Twip size above which to kern char pair
	char	underlineyype 	// Underline type					
	char	animation 		// Animated text like marching ants 
	char	revauthor 		// Revision author index			
	char	underlinecolor	// Underline color
end

struct charfmt22 charfmt2

/*
---------------------------

---------------------------
0000  54 00 00 00 ff ff ff ff 20 00 00 44 f0 00 00 00  T...ÿÿÿÿ...Dð...
0010  00 00 00 00 00 00 00 00 80 10 54 69 6d 65 73 20  ........€.Times.
0020  4e 65 77 20 52 6f 6d 61 6e 00 00 00 00 00 00 00  New.Roman.......
0030  00 00 00 00 00 00 00 00 00 00 00 00 90 01 00 00  ...............
0040  00 00 00 00 ff 00 00 00 00 00 00 00 00 00 0a 00  ....ÿ...........
0050  01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ....
---------------------------
OK   
---------------------------


---------------------------
0000  54 00 00 00 ff ff ff ff 26 00 80 00 f0 00 00 00  T...ÿÿÿÿ&.€.ð...
0010  00 00 00 00 00 00 00 00 80 31 43 6f 75 72 69 65  ........€1Courie
0020  72 20 4e 65 77 00 00 00 00 00 00 00 00 00 00 00  r.New...........
0030  00 00 00 00 00 00 00 00 00 00 00 00 90 01 00 00  ...............
0040  ff e0 82 00 ff 00 00 00 00 00 00 00 00 00 0a 00  ÿà‚.ÿ...........
0050  01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ....
---------------------------
OK   
---------------------------
*/

int C

mtext Init_rich
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1053{\fonttbl{\f0\froman\fprq2\fcharset0 Times New Roman;}}
{\colortbl ;\red0\green0\blue0;}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1 
\pard\cf1\kerning1\f0\fs20\lang1033\par
}
end


form ed_help ()

int Pos [2]

    layout "Edit help text" sysmenu maxbox minibox
e         a                     
 





                   
                                                         a
         ea                   ac   cd    d

 e   ee    ee    e 
 a










                                                         a

 b    bb    bb    bb    b
    end
pre
//~ break_point
//~ #op_debug
//~ mess ( sizeof ( charformat ) )

//~ #yy_debug
 int i 
    

/*
 mess ( _INSTRUCTIONS.FORM_INST ["date"][0] )
 mess ( _INSTRUCTIONS.FORM_INST ["date"][2] )

 mess ( _INSTRUCTIONS.FUNC_INST [1][0] )

*/
//~ #op_debug
  mess (  $ ("kalle " + i )  +> kuladweqweqwe
   + $null0 "kula" )

//~ mess ( sizeof ( charfmt2 ) )

//~ mess ( charfmt22.bgcolor ) 
    charformat._size = sizeof ( charformat ) 
    //~ charformat.mask = 10
    //~ mess ( charformat.mask )
//~ #op_debug 

    //~ charformat.mask = 0x10
    //~ charformat.charSet = 44

//~ mess ( dump ( charformat ) )
//~ #op_debug 
    //mess ( charformat.charSet )

//~ #op_debug
    //~ charformat.facename = "Hej"
//~ mess ( dump ( charformat ) )
 
    //~ mess ( charformat.facename )

//~ mess ( sizeof ( _paraformat ) )
    .menu ( menu1 )
    db.connect ( "help.db" )
    sql1.select ( "* from sort order by cmd" )
    .COLUMNLABEL ( V_CMD, sql1 )
    .columnwidth ( V_CMD, "300|50|50" )
    .additem ( V_CMD, sql1 )
    .COLUMNLABEL ( V_GRP, "Sections" )
    .additemy ( V_GRP, "Manual|Form fn|Functions" )
    
    .sendmessage ( V_TXT, EM_SHOWSCROLLBAR, 1, 1 )
    .sendmessage ( V_TXT, EM_SETEVENTMASK, 0, 0x04000000 )  //ENM_LINK 

   //~ .color ( V_TXT, color.red )
    //~ .sendmessage ( V_TXT, EM_SETBKGNDCOLOR, 0, color.blue )
    //~ comp_color.txt = color.white
    //~ comp_color.bg = color.red
    
    //~ .sendmessage ( V_TXT, EM_SETTEXTMODE, /* TM_RICHTEXT */ 2, 0 )

    .sendmessage ( V_TXT, EM_SETUNDOLIMIT, 30, 0 )
    .richtext ( V_TXT, Init_rich )

end
field
M_SQL
    select 
        x_sql (0)
    end

e: V_GRP LC allways
    click ( int i )
        Grp = i
        if ( i != -1 )
            sql1.select ( "* from sort where var=[i] order by var,cmd" )
            .additem ( V_CMD, sql1 )
        end
    end

a: V_CMD LC allways
    dbl_click ( int i )
        char slask 300

        cur = i
        .value ( V_C, .getitem ( V_CMD, i, 0 ) )
// mess ( strlen ( .getitem ( V_CMD, i, 3 )) )
        
        if ( .getitem ( V_CMD, i, 3 ) == "" )
            .richtext ( V_TXT, Init_rich )
        else
            .richtext ( V_TXT, .getitem ( V_CMD, i, 3 ) )
        end

        charfmt2._size = sizeof ( charfmt2 ) 
        charfmt2.mask = -1

//~ MESS ( charfmt22.bAnimation )

        .sendmessage ( V_TXT, EM_GETCHARFORMAT, 1, charfmt2 )

        Pos [0] = 0
        Pos [1] = 0
        .sendmessage ( V_TXT, EM_EXSETSEL, 1, & Pos ) 

        .SendMessage ( V_TXT, EM_REPLACESEL, 1, & "\n"  );
        .sendmessage ( V_TXT, EM_EXSETSEL, 1, & Pos ) 


        //~ charfmt2.mask = CFM_COLOR | CFM_SIZE | CFM_BACKCOLOR
        charfmt2.effects &= ~ CF_BACKCOLOR //CFE_AUTOBACKCOLOR
        charfmt2.height = 230
        charfmt2._color = color.blue
        charfmt2.bgcolor = color.yellow
        .sendmessage ( V_TXT, EM_SETCHARFORMAT, 1, charfmt2 )

        paraformat._size = sizeof ( paraformat )
        paraformat.mask = PFM_ALIGNMENT
        paraformat.wAlignment = 1       //left
        .sendmessage ( V_TXT, EM_SETPARAFORMAT, 0, & paraformat )
        slask =  _INSTRUCTIONS.FORM [.getitem ( V_CMD, cur, 0 )][0]  + "\n"
        slask = subst_all ( slask, "|", "\n" )

        .sendmessage ( V_TXT, EM_EXSETSEL, 1, & Pos ) 
        .SendMessage ( V_TXT, EM_REPLACESEL, 1, str_ptr ( slask )  );

        .sendmessage ( V_TXT, WM_LBUTTONDOWN, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, WM_LBUTTONUP, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, EM_EXSETSEL, 1, & Pos ) 


        
    end
    
e: BT "format"

    select
 //bcolor 0xe0ff0000

/*

        .sendmessage ( V_TXT, EM_EXGETSEL, 0, & Pos ) 

        charfmt2._size = sizeof ( charfmt2 )
        charfmt2.mask = -1


        //~ .sendmessage ( V_TXT, EM_GETCHARFORMAT, 1, charfmt2 )   //SCF_DEFAULT

 //       SendMessage (CTrace_data->m_hWnd, EM_SETSEL, -1, -1);
        .SendMessage ( V_TXT, EM_REPLACESEL, 0, & "hakke" );

*/
    mess ( .V_TXT )
/*
        charfmt2._size = sizeof ( charfmt2 )

//~ mess ( hex ( charfmt2.crBackColor ) )
        //~ mess ( hex ( charfmt2.dwEffects ) )
//~ mess ( dump ( charfmt2 ) )
mess ( hex ( charfmt2.dwEffects ) )

//~ mess ( hex ( charfmt2.crBackColor ) )
mess ( hex ( charfmt2.lcid ))
mess ( hex ( charfmt2.dwCookie ))


        //~ charfmt2.dwEffects &= ~ 0x40000000 
        charfmt2.dwEffects = 0x4800024 //CFE_LINK // | CFM_UNDERLINETYPE
        charfmt2.bUnderlineType = 1

        charfmt2._color = color.red
       // charfmt2.mask  = 0x40000000
    //~ charfmt2.bUnderlineColor = ++ C
         .sendmessage ( V_TXT, EM_SETCHARFORMAT, 1, charfmt2 ) //SCF_DEFAULT
*/
      //~ .focus ( V_TXT )

        //~ mess ( charfmt2.facename )
    end
e: BT "Set"
    select
        charfmt2._size = sizeof ( charfmt2 )
        charfmt2.mask = -1
        .sendmessage ( V_TXT, EM_GETCHARFORMAT, 1, charfmt2 )   //SCF_DEFAULT

mess ( hex ( charfmt2.bgcolor ) )
        charfmt2.bgcolor = color.green
mess ( hex ( charfmt2.bgcolor ) )

        .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 
        charfmt2._color = color.blue
        .sendmessage ( V_TXT, EM_SETCHARFORMAT, 1, charfmt2 ) //SCF_DEFAULT

        .sendmessage ( V_TXT, WM_LBUTTONDOWN, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, WM_LBUTTONUP, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 


            //~ .focus ( V_TXT )
        //~ .sendmessage ( V_TXT, 0x21, 0, 0 ) 
        //~ .sendmessage ( V_TXT, WM_ACTIVE, 0, 0 ) 
        //~ .sendmessage ( V_TXT, WM_ACTIVE, 0, 0 ) 

    end
e: BT "Test 1"
    select
        int i
            //~ .focus ( V_TXT )
        charfmt2._size = sizeof ( charfmt2 ) 
        charfmt2.mask = -1

//~ MESS ( charfmt22.bAnimation )

        MESS ( .sendmessage ( V_TXT, EM_GETCHARFORMAT, 1, charfmt2 ) )   //SCF_DEFAULT



        Pos [0] = 0
        Pos [1] = 0
        .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 

        charfmt2.mask = CF_COLOR | CF_SIZE
        charfmt2.height = 200
        charfmt2._color = color.blue
//        charfmt2.bgcolor = color.yellow
        MESS ( .sendmessage ( V_TXT, EM_SETCHARFORMAT, 1, charfmt2 ) )


        .SendMessage ( V_TXT, EM_REPLACESEL, 0, & "hakke\nnisse\n" );

        charfmt2._color = color.black
        .sendmessage ( V_TXT, EM_SETCHARFORMAT, 1, charfmt2 ) //SCF_DEFAULT

        .sendmessage ( V_TXT, WM_LBUTTONDOWN, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, WM_LBUTTONUP, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 

/*

        //~ .showcaret ( V_TXT )
        i = .sendmessage ( V_TXT, EM_POSFROMCHAR, 5, 0 )
        
   //~ mess ( hex ( i ) )

        .sendmessage ( V_TXT, WM_LBUTTONDOWN, MK_LBUTTON, 0x10001 )
        .sendmessage ( V_TXT, WM_LBUTTONUP, MK_LBUTTON, 0x10001 )

        .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 
*/


    end

a: V_C edit
a: V_TXT re
c: BT "Insert"
    select
        sql1.insert ( "sort values ( [.V_C],0,[Grp],'')" )
        sql1.select ( "* from sort where var=[Grp] order by var,cmd" )
        .additem ( V_CMD, sql1 ) 
    end
d: BT "Delete"
    select
        if ( ask ( "Radera [.V_C] ? " ) )
            sql1.delete ( "sort where var=[Grp] and cmd=[.V_C]" ) 
            sql1.insert ( "sort values ( [.V_C],0,[Grp],'')" )
            sql1.select ( "* from sort where var=[Grp] order by var,cmd" )
            .additem ( V_CMD, sql1 ) 
        end
    end

//~ a: V_TXT class "RICHEDIT50W" //style=0x550081c4  exstyle=0x10
b: BT "Spara"
    select
        int z
        text x

        z = .getitem ( V_CMD, cur, 2 )
        x = .richtext ( V_TXT ) 
//~ mess ( x )
  fcreate_bin ( 1, "test" )
    fwrite ( 1, x )
    close ( 1 )


        sql2.update ( "sort set help=\"" + x + "\" where cmd=[.V_C] and var=[z]" )

        .UPDATEITEM1 ( V_CMD, cur, 3, x )
        .value ( V_C, "" )
        .value ( V_TXT, "" )

    end
b: BT "tesy"
    select
        text t
        t = .richtext ( V_TXT )

        mess ( t )
    end
b: BT "reset"
    select

    paraformat._size = sizeof ( paraformat )
    paraformat.mask = PFM_ALIGNMENT

    mess ( .sendmessage ( V_TXT, EM_GETPARAFORMAT, 0, & paraformat ) )
    mess ( paraformat.wAlignment )


       //~ .richtext ( V_TXT, aa )
    end


/*
b: BT "+" 
    select
        int i, j

        .sendmessage ( V_TXT, EM_GETZOOM, & i, & j )
        j = 10
        mess ( .sendmessage ( V_TXT, EM_SETZOOM, i, j ) )
    end
*/
b: BT "-" 
    select
        int i, j

        .sendmessage ( V_TXT, EM_GETZOOM, & i, & j )
        j -= 10
        .sendmessage ( V_TXT, EM_SETZOOM, i, j )
    end


end

#include "../ide/sql.l"

#if 0
                        // EM_INSERTTABLE wparam is a (TABLEROWPARMS *)
        tablerow.cbRow ;			// Count of bytes in this structure
        tablerow.cbCell; 		// Count of bytes in TABLECELLPARMS
        tablerow.cCell;			// Count of cells
        tablerow.cRow			// Count of rows
        tablerow.dxCellMargin;	// Cell left/right margin (\trgaph)
        tablerow.dxIndent;		// Row left (right if fRTL indent (similar to \trleft)
        tablerow.dyHeight;		// Row height (\trrh)
        tablerow.flag
//~ DWORD	nAlignment:3;	// Row alignment (like PARAFORMAT::bAlignment, \trql, trqr, \trqc)
//~ DWORD	fRTL:1; 		// Display cells in RTL order (\rtlrow)
//~ DWORD	fKeep:1;		// Keep row together (\trkeep}
//~ DWORD	fKeepFollow:1;	// Keep row on same page as following row (\trkeepfollow)
//~ DWORD	fWrap:1;		// Wrap text to right/left (depending on bAlignment)
//~ DWORD	fIdentCells:1;	// lparam points at single struct valid for all cells
        tablerow.cpStartRow		// cp where to insert table (-1 for selection cp)
        tablerow.bTableLevel	// Table nesting level (EM_GETTABLEPARMS only)
        tablerow.iCell			// Index of cell to insert/delete (EM_SETTABLEPARMS only)
end
 #endif


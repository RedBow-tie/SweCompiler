
#include "ide/sci.h"

text if_end = "if end wend case for int char str form func field para menu layout dll_std dll_str dll struct select pre post" 

text aa1
int Init
int i
int j
int z
int k
int f
int id
int color1
text str 

int ed_h

query sql

int Color1 [] =
    0x808080
    0x007f00        // /* */
    0x007f00        // //
    0xff7070        // /**
    0x707000        //Numbers
    0x802020        // Keyword
    0x7f007f        // "str"          
    0x7f207f        // 'c'
    0x804080
    0x7f7f00        //#if/#else
    0x7f0000        //++ &&
    -1
    0x0000ff        //none closed string
    0x7f00
    0x3f7f3f
    0x7070ff        // /// or //!!
    0xe05050        // Keywords 2
    0x3060a0
    0x804020
    -2
end

int Color2 [] = 
    0xc0c0c0
    0x90b090
    0x90b090
    0xd0d0d0
    0xb0b090
    0xb09090
    0xb090b0
    0xb090b0
    0xc0c0c0
    0x90b0b0
    0xb0b0b0
    0xb0b0b0
    0
    0x7f00
    0x7faf7f
    0xc0c0c0
    0xc0c0c0
    0xc0c0c0
    0xc0c0c0
    -2
end

dll_std ed () @1 ( ed_h, int, int, int )

char Slask 3000

func edit ( char file 40 )
    if ( ! load_dll ("ide/SciLexer.DLL") )
        message ( "Can't load SciLexer.DLL" )
        return 0
    end
    edit1 ( file )
end


form edit1 ( char file 40 )
    layout "Edit"  maxbox RESIZE MINIBOX SYSMENU  y2 + 2 xstep - 2 
    w                                            
    
            
              
               





















      

                                                                                            w
end
    pre
        ed_h = .sendmessage ( XX, SCI_GETDIRECTPOINTER, 0, 0)
        if ( ed_h == 0 )
            message ( "Error 1" )
            return 1
        end
 
        .title ( "Edit " + file )

        ed ( SCI_SETLEXER, 4, 0) 
        ed ( SCI_STYLESETSIZE, STYLE_DEFAULT, 10 )
        ed ( SCI_STYLESETFONT, STYLE_DEFAULT, "Fixedsys")

        ed ( 75 & 0xf, SCI_STYLESETUNDERLINE, 0 )        

        ed ( SCI_STYLECLEARALL, 0, 0 )

        ed ( SCI_STYLESETVISIBLE, STYLE_LINENUMBER, 1 )
        ed ( SCI_SETMARGINWIDTHN, 0,  ed ( SCI_TEXTWIDTH, STYLE_LINENUMBER, & "_9999" ) )   
 
        ed ( SCI_ASSIGNCMDKEY, 'E' + (SCMOD_CTRL << 16), SCI_LINEEND )
        ed ( SCI_ASSIGNCMDKEY, 'K' + (SCMOD_CTRL << 16), 	SCI_DELLINERIGHT )
        ed ( SCI_ASSIGNCMDKEY, ('A' + (SCMOD_CTRL << 16)), 2312 )  

        //ed ( SCI_COLOURISE, 0, -1 )
        
        //ed ( SCI_STYLESETVISIBLE, 68, 1 )
        //ed ( SCI_STYLESETFORE, 68, 0xff00)

        for ( i = 0; Color1 [i] != -2; ++ i ) 
            if ( Color1 [i] != -1 )
                ed ( SCI_STYLESETFORE, i, Color1 [i] )
            end
        end

        for ( i = 0; Color2 [i] != -2; ++ i ) 
            ed ( SCI_STYLESETFORE, i + 0x40, Color2 [i] )
        end
        
        ed ( SCI_STYLESETFORE, 37, 0xC0C0C0 )       //vertical help lines (dotted)

        ed ( SCI_STYLESETBOLD, 5, 1 )   
        
        ed ( SCI_MARKERDEFINE, 0, SC_MARK_CIRCLE )
        ed ( SCI_MARKERDEFINE, 1, SC_MARK_DOTDOTDOT )

        aa1 = load_file ( "ide/icons\\blue_dot.xpm" )
        if ( aa1 != "" )
            ed ( SCI_MARKERDEFINEPIXMAP, 0, aa1 )
        end

        ed ( SCI_SETDOCPOINTER, 0, 0 )
        ed ( SCI_ADDREFDOCUMENT, 0, ed ( SCI_GETDOCPOINTER, 0, 0 ) )

        init_fmt ()

        if ( ! fopen ( 1, file ) )
            return 0
        end

        str = fgets ( 1 )
        while ( ! feof ( 1 ) )
            str += "\n"
            ed ( SCI_APPENDTEXT, len ( str ), str )
            str = fgets ( 1 )
        wend
        ed ( SCI_SETEMPTYSELECTION, 0,0 )
        close ( 1 )

    end
field
    key_ctrl_f
        find ()
    end

    key_f5
        .erun ( .hwnd ( XX ) )
    end

w:  XX  class "Scintilla" border x2 + 10 y2 + 5, A_RIGHT A_BOTTOM
    key_ctrl_g
        f_goto ()
    end

    KEY_CTRL_E 
        ed ( SCI_LINEEND, 0, 0)
    end
    key_ctrl_q
        make_com ()
    end
    key_ctrl_a
        ed ( SCI_HOME, 0, 0 )
    end
    key_f3
        ed ( SCI_SEARCHANCHOR, 0, 0 )
    end
    key_f4
        i = ed ( SCI_GETCURRENTPOS, 0, 0 )
        j = ed ( SCI_WORDSTARTPOSITION, i, 1 ) 
        k = ed ( SCI_WORDENDPOSITION, i, 1 )  
    end
    key_f2
        z = ed ( SCI_LINEFROMPOSITION, ed ( SCI_GETCURRENTPOS,0,0 ), 0 )        
        z = ed ( SCI_MARKERNEXT, z + 1 , 1 )
        if ( z != -1 )
            ed ( SCI_GOTOLINE, z, 0 )
        else
            z = ed ( SCI_MARKERNEXT, 0, 1 )
            if ( z != -1 )
                ed ( SCI_GOTOLINE, z, 0 )
            end
        end
    end
    key_sh_f2
        ed ( SCI_MARKERADD, ed ( SCI_LINEFROMPOSITION, ed ( SCI_GETCURRENTPOS,0,0 ), 0 ) , 1 )
    end
    key_ctrl_f2
        z = ed ( SCI_LINEFROMPOSITION, ed ( SCI_GETCURRENTPOS,0,0 ), 0 )

        if ( ed ( SCI_MARKERGET, z, 0 ) & 1 )
            ed ( SCI_MARKERDELETE, z, 0 )
        else
            ed ( SCI_MARKERADD, z , 0 )
        end
    end
end

form find ()
    layout "Find"  SYSMENU 

  a     as                                b     b


  c              c





                                         s



    end

field
a: "Find"
c: CHECKBOX "Case sensitive"
s: ID_FIND COMBOBOXEDIT
b: BT "Find"
    select
        z = .finditem ( ID_FIND, .ID_FIND )
        if ( z != -1 )
            .deleteitem ( ID_FIND, z )
        end
        .additem ( ID_FIND, .ID_FIND, 0 )

        ed ( SCI_SEARCHANCHOR, 0, 0 )
    end 
end

form f_goto ()
    layout "Goto line" sysmenu
 a    ab     b
endf
field
a: "Line"
b: E1 EDIT
    leave
        ed ( SCI_GOTOLINE, atoi ( .E1 ) - 1, 0  )
        .close (0)
    end
end

func GetLineIndentPosition ( int pos, int _end )
    int c

    c = ed ( SCI_GETCHARAT, pos, 0 )
	while ((pos < _end) && ( c == ' ' || c == '\t')) 
		++ pos
        c = ed ( SCI_GETCHARAT, pos, 0 )
	wend
    return pos
end

func make_com ()
	int selectionStart
    int selectionEnd
    int caretPosition
    int move_caret
    int selStartLine
    int lines
    int firstSelLineStart
    int lineStart
    int lineIndent
    int lineEnd
    int selEndLine
    int commentLength
    text linebuf
    char comment 5
    char long_comment 5

    long_comment = "//~"
    comment = "//"

    selectionStart = ed ( SCI_GETSELECTIONSTART, 0, 0 )
    selectionEnd = ed (SCI_GETSELECTIONEND, 0, 0 )
    caretPosition = ed (SCI_GETCURRENTPOS, 0, 0 )
    move_caret = caretPosition < selectionEnd
    selStartLine = ed (SCI_LINEFROMPOSITION, selectionStart, 0)
    selEndLine = ed (SCI_LINEFROMPOSITION, selectionEnd, 0)
    lines = selEndLine - selStartLine
    firstSelLineStart = ed (SCI_POSITIONFROMLINE, selStartLine, 0)
	if ((lines > 0) &&  (selectionEnd == ed (SCI_POSITIONFROMLINE, selEndLine, 0 )))
		selEndLine--
    end

	ed (SCI_BEGINUNDOACTION, 0, 0 )
	for ( i = selStartLine; i <= selEndLine; i++) 
		lineStart = ed ( SCI_POSITIONFROMLINE, i, 0 )
		lineIndent = lineStart
		lineEnd = ed (SCI_GETLINEENDPOSITION, i, 0 )
		
		lineIndent = GetLineIndentPosition ( lineStart, lineEnd )

        z = ed ( SCI_EXGETTEXTRANGE, lineIndent, lineEnd )

		if ( len ( str_ptr ( z ) ) < 1 ) 
            ed ( SCI_EXFREE, 0, z )
			continue    
        end
        commentLength = len ( comment )
		if ( left ( str_ptr ( z ), commentLength ) == comment ) 
            if ( left ( str_ptr ( z ), len ( long_comment ) ) == long_comment ) 
				commentLength = len ( long_comment )
			end
			ed (SCI_SETSEL, lineIndent, lineIndent + commentLength )
			ed (SCI_REPLACESEL, 0, "")
			if ( i == selStartLine ) 
				selectionStart -= commentLength
            end
			selectionEnd -= commentLength 
			continue
		end
		if (i == selStartLine) 
			selectionStart += len ( long_comment )
        end
		selectionEnd += len ( long_comment ) 
		ed ( SCI_INSERTTEXT, lineIndent, long_comment )

        ed ( SCI_EXFREE, 0, z )

	end
	if (selectionStart < firstSelLineStart)
		if (selectionStart >= selectionEnd - len ( long_comment ) - 1)
			selectionEnd = firstSelLineStart
        end
		selectionStart = firstSelLineStart
	end
    ed (SCI_SETSEL, -1, caretPosition )
    ed ( SCI_SETCURRENTPOS, caretPosition, 0)
	ed ( SCI_ENDUNDOACTION, 0, 0 )
end

func init_fmt ()
    ed ( SCI_SETLEXER, 3, 0) 
    ed ( SCI_SETTABINDENTS, 4, 0 )
    ed ( SCI_SETTABWIDTH, 4, 0 )
    ed ( SCI_SETUSETABS, 0, 0 )
    ed ( SCI_SETTABINDENTS, 1, 0 )
    ed ( SCI_SETINDENT, 4, 0 )
    ed ( SCI_SETEOLMODE, 0, 0 )     //end of line mode

    ed ( SCI_SETSELBACK, 1, 0xffff )

    ed ( SCI_SETINDENTATIONGUIDES, SC_IV_LOOKBOTH, 0 )

    ed ( SCI_SETLEXERLANGUAGE, 0, "cpp" )
break_point
    ed ( SCI_SETKEYWORDS, 0, if_end )

    ed ( SCI_INDICSETSTYLE, 1, INDIC_HIDDEN )
    ed ( SCI_INDICSETFORE, 1, 0x606060 )
end


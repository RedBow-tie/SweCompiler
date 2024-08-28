
#define TREE_ROOT  -2
#define TREE_FIRST -3
#define TREE_LAST  -4
#define TREE_SORT  -5

#include "sci.h"

//~ #USE_ACUTE
//~ #NO_SYNTAX_HINT
//~ #SAVE_REF


extern form save_as (item, hwnd) load ( "saveas" )
extern form load_proj () load ( "load_proj" )
extern form x_sql (int) load ( "sql" )
extern form login (int) load ( "login" )
extern form new_proj () load ( "new_proj" )

dll_str get_def ( ) 
dll_str get_short ( ) 
dll_str get_src ( ) 
dll get_sort ()
dll_str main (  char ) 
dll conv_res (  char ) 
dll_str get_res ()


static text if_end = "if end wend case for int char str form func field menu layout dll_std dll_str dll struct select pre post" 
 
text Old_search 
text st1
char Usr 50

int Init
int i
int j
int z
int k
int f
int id
int color1
text str 

ole aa
int ed_h
item it
item it1

query sql


menu mm1
    menu_item ( M_RUN,      "File",  m_submenu )
    menu_item ( M_LOAD,     "Open file" )
    menu_item ( M_LOADX,    "Open file - Expand fn" )

if ( db.connected () )
    menu_item ( M_LOADD,    "Open file - Database" )
else
    menu_item ( M_LOADD,    "Open file - Database", m_disabled )
end

    menu_item (M_SAVE,     "Save" )
    menu_item (M_SAVEA,    "Save as" )
    menu_item (M_OPEN,     "Open project" )
    menu_item (M_NEW,      "New project" )
    menu_item (M_LOAD1,    "Load"  )
    menu_item (M_EXIT,     "Exit",  m_last )

    menu_item (M_DATAB,    "Database", m_submenu )
    menu_item (M_DB_CON,   "Connect (proj)" )

if ( db.connected () )
    menu_item (M_DB_DIS,   "Disconnect (proj)" ) 
    menu_item (M_SQL,      "SQL (proj)" )
else
    menu_item (M_DB_DIS,   "Disconnect", m_disabled )
    menu_item (M_SQL,      "SQL (proj)", m_disabled )
end

    menu_item (M_DB_CON2,  "Connect db2" , m_SEPARATOR )

if ( db2.connected ( ) )
    menu_item (M_DB_DIS,   "Disconnect (db2)" ) 
    menu_item (M_SQL2,     "SQL (db2)" , m_last )
else
    menu_item ( M_DB_DIS2,  "Disconnect", m_disabled  )
    menu_item (M_SQL2,     "SQL (db2)", m_disabled | m_last )
end

    menu_item ( M_DATAB,    "Util", m_submenu )
    menu_item ( M_CONV_RES, "Convert rc-file", m_last )
end

menu pop 
    if ( _last_item.data1 )
        if ( _last_item.data1 == 3 )
            if ( _last_item.PARENT () )  //dummy if - handle limitation/bug
            end
        end
        menu_item (M_CLOSE, "Close " + _last_item.text )  
    else
        menu_item (M_CLOSE1, "Close ",  m_DISABLED )
    end
        menu_item (M_NEW,   "New file" )
        menu_item (M_ADD,   "Add file" )
        menu_item (M_ADD1,  "Add file - Expand fn" )
        menu_item (M_ADDD,  "Add file - From database" )
        menu_item (M_ADDD,  "Add file - Only local" )
        menu_item (M_ADDD1, "Add file - Only local, expand" )

end

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

int Color2 []  = 
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



text aa1

dll_std ed () @1 ( ed_h, int, int, int )

char Slask 3000

funk start ()

    REG_SECTION ( "SOFTWARE\\swec\\ide" )

    if ( ! load_dll ("SciLexer.DLL") )
        message ( "Can't load SciLexer.DLL" )
        exit ()
    end

    if ( ! load_dll ( "conv/konv_c.dll" ) )
        message ( "Can't load conv_c.DLL" )
        exit ()
    end

    if ( ! load_dll ( "conv/konv_rc.dll" ) )
        message ( "Can't load conv_rc.DLL" )
        exit ()
    end

    if ( reg_str ( "auto" ) )
        Slask = "dbname=" + reg_str ( "database" )
        Slask += " host=" + reg_str ( "server" )
        Slask += " port=" + reg_str ( "server_port" ) 
        Usr = reg_str ( "login" )
        Slask += " user=" + Usr 
        Slask += " password=" + uncrypt ( reg_str ( "pwd" ), 56 )

        if ( db.connect ( Slask ) ) 
            message ( sql.error () )
        end
    end
    if ( reg_str ( "auto2" ) )
        Slask = "dbname=" + reg_str ( "database2" )
        Slask += " host=" + reg_str ( "server2" )
        Slask += " port=" + reg_str ( "server_port2" ) 
        Slask += " user=" + reg_str ( "login2" )
        Slask += " password=" + uncrypt ( reg_str ( "pwd2" ), 56 )
        if ( db2.connect ( Slask ) ) 
            message ( sql.error () )
        end
    end

    //message ( "Press F5 to run" )
    st ()
end

form st (), DEFAULT_CR
    layout "Edit"  maxbox RESIZE MINIBOX SYSMENU  y2 + 2 xstep - 2 
 b         b b        b b        b  z       z

 a                         w                                            
    
            
              
               



















      

                          a                                                                           w
    p                  
                                p
 


end
    pre
        .menu ( mm1 )

        ed_h = .sendmessage ( XX, SCI_GETDIRECTPOINTER, 0, 0)
        if ( ed_h == 0 )
            message ( "Can't read SCI_GETDIRECTPOINTER" )
            return 1
        end
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

        ed ( SCI_COLOURISE, 0, -1 )
        
        ed ( SCI_STYLESETVISIBLE, 68, 1 )
        ed ( SCI_STYLESETFORE, 68, 0xff00)

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
        //ed ( SCI_MARKERDEFINE, 1, SC_MARK_DOTDOTDOT )

        aa1 = load_file ( "icons\\blue_dot.xpm" )
        if ( aa1 != "" )
            ed ( SCI_MARKERDEFINEPIXMAP, 0, & aa1 )
        end

        .additem ( T1, "Files" )
        .additem ( T1, "DB-Files" )
        .additem ( T1, "Projects" )

        .ADDITEM_I ( T1, 1, "Empty" ) 

        ed ( SCI_SETDOCPOINTER, 0, 0 )

        _last_item.data = ed ( SCI_GETDOCPOINTER, 0, 0 )
        ed ( SCI_ADDREFDOCUMENT, 0, _last_item.data )

//!------------------------
        init_fmt ()

        if ( db.connected () )
            sql.select ( "* from settings where usr=[Usr]" )
            if ( sql.ROWS () )
                i = 0
                while ( substr ( sql.last_opend, i ) != NULL )
                    str = substr ( sql.last_opend, i + 1 )
                    switch ( atoi ( substr ( sql.last_opend, i ) ) )
                        case 1
                            .exec_trigger ( M_LOAD, 0 )
                            break
                        case 2
                            .exec_trigger ( M_LOADX, 0 )
                            break
                        case 4
                            i = atoi ( str )
                            .exec_trigger ( M_LOADD, 0 )
                            break
                    end                
                    i += 2
                wend
            end
        end
        Init = TRUE
    end
field
    on_close

        if ( ! db.connected () )
            return TRUE
        end

        str = ""
        it = _last_item
        it.first ()
        while ( it.walk () )
            switch ( it.data1 )
                case 1
                    str += "1;" + it.tooltip + ";"
                    break
                case 2
                    str += "2;" + it.tooltip + ";"
                    break
                case 4
                    str += "4;" + it.oid + ";"
                    break
            end
        wend

        sql.update ( "settings set last_opend=[str] where usr=[Usr]" )

        it.first ()
        if ( it.data )
            ed ( SCI_RELEASEDOCUMENT, 0, it.data )
        end
        while ( it.next () )
            if ( it.data )
                ed ( SCI_RELEASEDOCUMENT, 0, it.data )
            end
        wend
    end

    key_ctrl_r
        ed ( SCI_SETREADONLY, ! ed ( SCI_GETREADONLY, 0, 0 ), 0 )
    end

    key_ctrl_f
        find ()
    end

    key_f8
        new_proj ()
    end
    key_f5
        .erun ( .hwnd ( XX ) )
    end
M_EXIT
    select
        .close ( 0 )
    end
M_DB_DIS
    select
        if ( ask ( "Disconnect proj-database ?" ) )
            db.disconnect ()
            .menu ( mm1 )       //Updatate menu
        end
    end
M_DB_DIS2
    select
        if ( ask ( "Disconnect db2 ?" ) )
            db2.disconnect ( )
            .menu ( mm1 )       //Update menu
        end
    end
M_SQL
    select
        x_sql (0)
    end
M_SQL2
    select
        x_sql (1)
    end
M_DB_CON
    select
        login (0)
        .menu ( mm1 )   //Update menu
    end    
M_DB_CON2
    select
        login (1)
        .menu ( mm1 )   //Update menu
    end    
M_SAVEA
    select
//~ #yy_debugp2
        save_as (_last_item, .HWND (XX))
    end
M_CONV_RES
    select
   		str = load_dlg ( "*.rc", "Convert .rc file", "Resource files (*.rc)|*.rc|" )
        if ( str == "" )
            return (0)
        end
        i = conv_res ( str )
        if ( i == 0 )
            message ( "Can't open " + str )
            return 0
        end

        .additem_i ( T1, 1, "Conv RC-file" )
        .tooltip_i ( T1, _last_id, str )
        _last_item.data1 = 0     //No save
        str = get_res ()

        ed ( SCI_SETDOCPOINTER, 0, 0 )
        _last_item.data = .sendmessage ( XX, SCI_GETDOCPOINTER, 0, 0 )
        ed ( SCI_ADDREFDOCUMENT, 0, _last_item.data )

        ed ( SCI_ADDTEXT, len ( str ), str )
    end

b: BT "Compile"
    select
        compile ( .HWND (XX) )
    end

b: BT 
b: BT 


z:  BT "Run"
    select
        .erun ( .hwnd ( XX ) )
    end


M_NEW
    select
        new_proj ()
    end
/*
M_OPENF
    select
        @openf ()
    end
*/
M_OPEN
    select
        load_proj ()
    end     
M_LOAD
    select
        if ( Init )
            str = load_dlg ( "", "", "" )
            if ( str == "" )
                return (0)
            end
        end

        if ( ! fopen_bin ( 1, str ) )
            return 0
        end

        .additem_i ( T1, 1, right ( str, strrchr ( str, '\\' ) + 1 ) )
        .tooltip_i ( T1, _last_id, str )
        _last_item.data1 = 1

        ed ( SCI_SETDOCPOINTER, 0, 0 )
        _last_item.data = .sendmessage ( XX, SCI_GETDOCPOINTER, 0, 0 )
        ed ( SCI_ADDREFDOCUMENT, 0, _last_item.data )
        init_fmt ()

        text str1
        if ( ! fopen_bin ( 1, str ) )
            info ( "Can't open " + str )
            return 0
        end
        .title ( str )

        str1 = fread ( 1, 100k )
        //~ ed ( SCI_ADDTEXT, len ( str1 ), & str1 )
        .value ( XX, str1)
        close ( 1 )
    end

M_LOADX
    select
        if ( Init )
            str = load_dlg ( "", "", "" )
            if ( str == "" )
                return (0)
            end
        end

        .additem_i ( T1, 1, right ( str, strrchr ( str, '\\' ) + 1 ) )
        .tooltip_i ( T1, _last_id, str )
        _last_item.data1 = 2

        i = _last_id
        main ( str )

        str = get_def ()
        while ( str != "" )     
            .additem_i ( T1, i, TREE_SORT, get_short () )
            .tooltip_i ( T1, _last_id, str )
            _last_item.data1 = 3   
            //.change_oid_i ( T1, last_id, get_sort () ) 

            _LAST_ITEM.oid = get_sort ()
            st1 = get_src ()

            ed ( SCI_SETDOCPOINTER, 0, 0 )
            _last_item.data = .sendmessage ( XX, SCI_GETDOCPOINTER, 0, 0 )
            ed ( SCI_ADDREFDOCUMENT, 0, _last_item.data )
            init_fmt ()

            ed ( SCI_ADDTEXT, len ( st1 ), st1 + chr (10) + chr(13))

            str = get_def ()
        wend
    end
M_SAVE
    select
        it = _last_item
        if ( it.data1 == 0 )
            return (0)
        end
        save ( "", 0 )

        message ( it.text )
        while ( it.next () )
            message ( it.text )
        wend    
    end

M_LOADD
    select
        if ( Init )
            i = load_db ()
        end
        if ( i > 6 )
  
            _last_item.oid = i
            ed ( SCI_SETDOCPOINTER, 0, 0 )
            _last_item.data = ed ( SCI_GETDOCPOINTER, 0, 0 )
            ed ( SCI_ADDREFDOCUMENT, 0, _last_item.data )
            _last_item.data1 = 4
            init_fmt ()

            ed ( SCI_ADDTEXT, len ( sql.src ), sql.src )
        end
    end

a:  T1  tree, A_BOTTOM 
    value_change ( item i )
        if ( i.data != 0 )
            .sendmessage ( XX, SCI_SETDOCPOINTER, 0, i.data )
        end
        _last_item = i
    end
    RIGHT_CLICK ( dr_item i )       //Must use drag_item 
        //~ if ( last_item.data )       
            .POPUP_MENU ( pop )
        //~ end
    end

M_CLOSE
    select
        if ( _last_item.data1 == 2 )  //close all functions
            it = _last_item
            _last_item.NEXT_SIB () 

            while ( _last_item )
                ed ( SCI_RELEASEDOCUMENT, 0, _last_item.data )  
                _last_item.next ()
            wend
            .delitem (T1, it.id )

            _last_item.first ()
            _last_item.NEXT ()
            ed ( SCI_SETDOCPOINTER, 0, _last_item.data )
            return 0
        end
    if ( _last_item.data )
            if ( _last_item.text != "Empty" )
                ed ( SCI_RELEASEDOCUMENT, 0, _last_item.data )  
                .delitem (T1, _last_item.id )

                while ( _last_item.WALK () )
                    if ( _last_item.data ) 
                        ed ( SCI_SETDOCPOINTER, 0, _last_item.data )
                        i = TRUE
                        break
                    end
                wend
                if ( ! i )
                    _last_item.clear ()
                    while ( _last_item.WALK () )
                        if ( _last_item.data ) 
                            ed ( SCI_SETDOCPOINTER, 0, _last_item.data )
                            break
                        end
                        message ( itoa ( i ) )
                    wend
                end
            end
        end
    end
M_ADD
    select
   		str = load_dlg ( "", "LT-files", "LT-source files (*.l)|*.l|Header files (*.h)|*.h|All files (*.*)|*.*|" )
        if ( str == "" )
            return (0)
        end
        

    end
//
//####################################################################################################
//


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

        message ( str_ptr ( ed ( SCI_EXGETTEXTRANGE, j, k ) ) )
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

    pre
        //~ .additem ( ID_FIND, "23123123;2323123;rewwer;" )
        //~ .display ()

        //~ .set_value ( ID_FIND, "test2" )
        //.loadfields ( Old_search )
    end

field
a: "Find"
c: CHECKBOX "Case sensitive"
s: ID_FIND CB 
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

form f_goto (), default_cr
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

form load_db ()
    layout "Load file from database" SYSMENU

 l

















                                                                l

    end
    pre
        sql.select ( "oid as ´@oi´,name,changed,major,minor,build from func" )
        .label ( L1, sql )
        .additem ( L1, sql )
        .columnwidth ( L1, "300;100" )
    end
field
l: L1 LC
    dbl_click ( int i )
        if ( i != -1 )
            st.additem_i ( T1, 2, sql [i].name )
            st.CHANGE_OID_I ( T1, _last_item.id, .oid ( L1, i ) )

            i = .oid (L1, i)
            sql.select ( "src from func where oid=[#i]" )

            .close (i)
        end
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


func save ( text str, int typ )
    if ( typ == 0 )
        str = st.tooltip_i ( T1, _last_id )
        typ = it.data1
    end
    if ( ! fcreate ( 1, str ) )
        warning ( "Can't create " + str )
        return 0
    end

    if ( typ == 1 )            //ordinary file
        z = ed ( SCI_GETLENGTH, 0, 0 )
        malloc ( st1.vardef, z )
        ed ( SCI_GETTEXT, z, st1 )
        put ( 1, st1 )
    end

    if ( typ == 3 || typ == 2 )
        if ( typ == 3 )     //3=func. 2 = master/fileneme
            it.parent ()
        end
        it1 = it
        it1.NEXT_SIB ()
        i = 1
        while ( it1.next () )
            ++ i
        wend
        j = 0
        while ( i )
            it1 = it
            it1.NEXT_SIB ()
            if ( it1.oid == j )
                -- i
                ++ j
                ed ( SCI_SETDOCPOINTER, 0, it1.data )
                ed ( SCI_SETSAVEPOINT, 0, 0 )
                z = ed ( SCI_GETLENGTH, 0, 0 )
                malloc ( st1.vardef, z )
                ed ( SCI_GETTEXT, z, st1 )
                put ( 1, st1 )
            end
            f = 0
            while ( it1.next () )
                if ( it1.oid == j )
                    -- i
                    ++ j
                    ed ( SCI_SETDOCPOINTER, 0, it1.data )
                    ed ( SCI_SETSAVEPOINT, 0, 0 )
                    z = ed ( SCI_GETLENGTH, 0, 0 )
                    malloc ( st1.vardef, z )
                    ed ( SCI_GETTEXT, z, st1 )
                    put ( 1, st1 )
                    f = TRUE
                end
            wend
            if ( f == 0 )
                ++ j
            end
        wend            
    end
    if ( typ == 4 )
        z = ed ( SCI_GETLENGTH, 0, 0 )
        malloc ( st1.vardef, z )
        ed ( SCI_GETTEXT, z, st1 )
        sql.update ( "func set src=[st1] where oid=[#str]" )
    end

    close ( 1 )
    ed ( SCI_SETDOCPOINTER, 0, _last_item.data )
end


#if 0
int SciTEBase::FindNext(bool reverseDirection, bool showWarnings, bool allowRegExp) {
	if (findWhat.length() == 0) {
		Find();
		return -1;
	}
	SString findTarget = EncodeString(findWhat);
	int lenFind = UnSlashAsNeeded(findTarget, unSlash, regExp);
	if (lenFind == 0)
		return -1;

	Sci_CharacterRange cr = GetSelection();
	int startPosition = static_cast<int>(cr.cpMax);
	int endPosition = LengthDocument();
	if (reverseDirection) {
		startPosition = static_cast<int>(cr.cpMin);
		endPosition = 0;
	}

	int flags = (wholeWord ? SCFIND_WHOLEWORD : 0) |
	        (matchCase ? SCFIND_MATCHCASE : 0) |
	        ((allowRegExp && regExp) ? SCFIND_REGEXP : 0) |
	        (props.GetInt("find.replace.regexp.posix") ? SCFIND_POSIX : 0);

	wEditor.Call(SCI_SETSEARCHFLAGS, flags);
	int posFind = FindInTarget(findTarget.c_str(), lenFind, startPosition, endPosition);
	if (posFind == -1 && wrapFind) {
		// Failed to find in indicated direction
		// so search from the beginning (forward) or from the end (reverse)
		// unless wrapFind is false
		if (reverseDirection) {
			startPosition = LengthDocument();
			endPosition = 0;
		} else {
			startPosition = 0;
			endPosition = LengthDocument();
		}
		posFind = FindInTarget(findTarget.c_str(), lenFind, startPosition, endPosition);
		WarnUser(warnFindWrapped);
	}
	if (posFind == -1) {
		havefound = false;
		if (showWarnings) {
			WarnUser(warnNotFound);
			FindMessageBox("Can not find the string '^0'.",
			        &findWhat);
		}
	} else {
		havefound = true;
		int start = wEditor.Call(SCI_GETTARGETSTART);
		int end = wEditor.Call(SCI_GETTARGETEND);
		// Ensure found text is styled so that caret will be made visible.
		int endStyled = wEditor.Call(SCI_GETENDSTYLED);
		if (endStyled < end)
			wEditor.Call(SCI_COLOURISE, endStyled, end);
		EnsureRangeVisible(wEditor, start, end);
		wEditor.Call(SCI_SCROLLRANGE, start, end);
		SetSelection(start, end);
		if (!replacing && closeFind) {
			DestroyFindReplace();
		}
	}
	return posFind;
}

#endif

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

    ed ( SCI_SETKEYWORDS, 0, & if_end )

    ed ( SCI_INDICSETSTYLE, 1, INDIC_HIDDEN )
    ed ( SCI_INDICSETFORE, 1, 0x606060 )
end

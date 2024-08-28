


//~ bitmap b_n1 

#define DIR_READONLY     0x0001  
#define DIR_HIDDEN       0x0002  
#define DIR_SYSTEM       0x0004  
#define DIR_DIR          0x0010  
#define DIR_ARCHIVE      0x0020  
#define DIR_NORMAL       0x0080  
#define DIR_TEMPORARY    0x0100  
#define DIR_COMPRESSED   0x0800  
#define DIR_ENCRYPTED    0x4000  


lfunc file1 ( long j, char search 300, int id, char _file 300, int flag, long _size, char date1 100 )
    
    long i
    text c
    text search1 
    text mod

    if ( _file == "." || _file == ".." )
        return ( j )
    end

    search1 = right ( search, 3 )
    search1 = left ( search1, len ( search1 ) - 1 )
    search = left ( search, len ( search ) - 1 )
//~ message ( itoa ( _file == "." ) + "!" + search1 + "!" + search + "#" + _file  + "#")

    j += _size
    if ( flag & DIR_DIR )
        if ( toupper ( _file ) != "$RECYCLE.BIN" )

break_point
            mod = subst_all ( "<DIR>|" + search + _file + "|[i]|[date1]" , "/", "\\" )
            main.additem ( L1, mod )
            i = file_find ( search + _file + "/*", id + 1, file1 )
/*
            if ( _POSTGRES_DB )
                db.COPYIN ( "[#h]|[#search1]|[#_file]|<DIR>|[date1]|[#i]\n" )
            else
                sql.insert ( "disk_files values([h],[search1],[_file],'<DIR>',[date1],[i])" )
            end
*/
            j += i 
/*
            file_index.value ( T2, search + _file ) 
            if ( id < 102 )            
                file_index.value ( P1, ++ Dir )
            end
*/
        end
    else
        c = right ( _file, strrchr ( _file, '.' ) )
break_point
        mod = subst_all ( "|[#search][#_file]|[#_size]|[date1]" , "/", "\\" )
        main.additem ( L1, mod )

    end

    return ( j )
end


form main ()
    layout "Dir" sysmenu RESIZE // maxbox minibox
 a    ab                            bzzd      d
                                       d      d

 c













                                              c
end
pre
    .COLUMNLABEL ( L1, "Dir|File|Size|Date" )
    .columnwidth ( L1, "120|255|80|170" )

  text aa
    aa = ENUM_ICON_RC ( "c:\\windows\\explorer.exe" )
mess ( aa )

    if ( load_dll ("shell32.dll" ) == 0 )
        info ( "Can't load SHELL32.DLL" )
    else
break_point
        .image ( B2, load_icon ( 9 ) )
    end

end
field
a: "Folder"
b: E_START EDIT, ANCHOR_RIGHT
z: B2 BT icon_img size ( 32, 32 )
    select
        text str

  		str = CHOOSE_FOLDER ( )
        if ( str == "" )
            return
        end
    end

d: BT "Search", ANCHOR_XMOVE
    select
        if ( trim ( .E_START ) == "" )
            .clear ( L1 )
            .WAITCURSOR ( 1 )
            file_find ( "./*", 100, file1 )
        else
            if ( strchr ( .E_START, "*" ) < 0 )
                info ( "You must add a *" )
                return 0
            end
            .clear ( L1 )
            .WAITCURSOR ( 1 )
            file_find ( .E_START, 100, file1 )
        end
        .WAITCURSOR ( 0 )
    end
d: BT "Run a prog", ANCHOR_XMOVE
    select 
        int i

        while ( i < .GETROWCOUNT ( L1 ) )
            if ( i < 2 )
                info ( .getitem ( L1, i, 1 ) )
            end
            ++ i 
        wend
            
    end

c: L1 LC singel allways, ANCHOR_BOTTOM ANCHOR_RIGHT
    key_del
        int i

        if ( (i = .selected ( L1 ) ) != -1 )
            .delete_item ( L1, i )
        end
    end
    dbl_click ( int i )
        if ( i != -1 )
            SHELLEXECUTE ( .getitem ( L1, i , 1 ), ".\\" )
        end
    end
end





query sql


int i
long j
int P
int Dir
char h 20


lfunc file ( long j, char search 300, int id, char _file 300, int flag, long _size, char date1 100 )
    onerror 
mess ( "error" )
        terminate ()
    end

    long i

    if ( _file == "." || _file == ".." )
        return ( j )
    end

    search = left ( search, len ( search ) - 1 )

    //put ( 1,  " " + j + "    " + _size + "     " + search + _file + "\n" )
    //h = hex ( flag )

    //~ message ( "[#search] ![#_file]! [#h] [#_size] [#date1] "  )
    
    if ( (flag & DIR_DIR) && (id < 2) )
        if ( toupper ( _file ) != "$RECYCLE.BIN" )

            i = file_find ( j, search + _file + "/*", id + 1, file )
            //put ( 1, " " + i + "  " + "<DIR>    " + search + _file + "\n" ) 
            //~ file_index.value ( T2, search + _file ) 
            j = i + 1
            //file_index.value ( P1, to_int ( j ) )
        end
    end

    return ( j )
end

/*
func search ()
    onerror 
        file_index.value ( B1, "Start" )       //when stop
        file_index.clear ( T2 ) 
        if ( _POSTGRES_DB )
            db.abortcopy ()
        end
    end

    i = 0
    Dir = 0
    file_index.value ( B1, "Stop" )
    while ( i < file_index.GETROWCOUNT ( L1 ) )
        if ( file_index.checked ( L1, i ) )

            h = file_index.GETITEM ( L1, i, 0 )
            file_index.value ( P1, 0, 0 )
            file_index.value ( P1, 0 )
            h = left ( h, 2)

            j = file_find ( h + "/*", 0, file )

            file_index.value ( P1, 0, toint ( j ))

            j = file_find ( h + "/*", 100, file1 )


            if ( _POSTGRES_DB )
                db.fincopy ( )
            else
                sql.commit ()
            end
            file_index.check ( L1, i, 0 )
        end
        ++ i
    wend

    file_index.clear ( T2 ) 
    file_index.value ( B1, "Start" )       //when stop
    file_index.value ( P1, 0 )
end

*/

form file_index ()
    layout "Create file index"  sysmenu

 t                                 t
 a                         b      b

                           c      c 

                           d      d
                         a 
 p                                 p
 x                                 x      
    end
    pre
        if ( ! db.connected () )
            if ( db.connect ( "dbname=postgres host=localhost port=5438 user=postgres" ) )
                message ( sql.error () )
                .close ( 0 )
            end
        end

        .EXSTYLE ( L1, LVS_EX_CHECKBOXES | LVS_EX_GRIDLINES )      //checkboxes
        .label ( L1, "Drive" ) 
        .additemy ( L1, GETDRIVES () )
        .click ( CLR )
    end
    tooltip
        CLR, "Delete's all file-names in the database for the selected drive"
    
field
    on_close 
        if ( .B1 != "Start" )
            message ( "Program is running!" )
            return 0
        end
    end

t: LTEXT "Load database with file-names"
a: L1 LC sort  
    select_item ( int i )
        if ( .checked ( L1, 0 ) )
        end
    
    end

b: B1 BT "Start"
    select
        if ( .B1 == "Start" )
            P = process ( search )
        else
            terminate ( P )
            .value ( B1, "Wait" )
        end
    end
c: CLR TB "Delete first"
/*
d: B2 BT "Select dir"
    select
        LOAD_DLG ( "", "", "" )
    end */
x: T2 LTEXT ""
p: P1 progres
end



extern int ed_h
extern item it1
extern func save ( char, int )

query sql
int i
int j
text str
item it

dll_std ed () @1 ( ed_h, int, int, int )

form save_as ( item it, int win1 ), default_cr
    layout "Save as" SYSMENU
       e
        a                  a           d       d     
        a                  a
        a                  a
        a                  a
        a                  a
                              e
 b    bb                     b         g       g                         
 b    bb                             b                          
 b    bb           


                                      b                          

    end
    pre

        //it = last_item
        if ( it.data == 0 )
            return (0)
        end
        .title ( "Save as ([#it.text])" )
/*
        if ( it.data1 == 3 )
            it.parent ()
            it1 = it
            it1.NEXT_SIB ()
            i = 1
            while ( it1.next () )
                ++ i
            wend
            j = 0
        end
*/
        .click ( TF )
    end
field


a: TF RB "File"  
    select
        .state ( 1 )  
    end
a: TFC RB "File (compiled)"  
    select
        .state ( 1 )  
    end
a: TD RB "To database"
    select
        .state ( 0 )  
    end
a: TDL RB "To database (large object)"
    select
        .state ( 0 )
    end
a: TDC RB "To database (compiled)"
    select
        .state ( 0 )
    end
b: "Folder"
b: EF EDIT,   enable = "ED"
g:  BT "Search" y2 - 2
    select

    end
b: "Name"
b: E1 EDIT,   enable = "ED"   //for multiple enable/disable of fields. Activates with .state(nn). 1 == Disable
b: "Info"   
b: EI EDIT multiline wreturn vscroll,  enable = "ED" 
d: BT "Save" 
    select
        onerror sql.abort ()

        if ( .CHECKED ( TDL ) )
            sql.begin  ()
            i = DB_LOIMPORT ( str )
           // sql.insert ("files (prog,name,info,file_id) values ([.E1],[.E2],[.EI],[i])" ) 
            sql.commit ()
        end
        if ( .checked ( TF ) )      //Too file
            str = save_dlg ( "", "", "" )
            if ( str == "" )
                return (0)
            end
            save ( str, 1 )        
        end
        if ( .checked ( TFC ) )     //compiled file
            str = save_dlg ( "", "", "" )
            if ( str == "" )
                return (0)
            end
            compile ( win1, str )
        end
        .close ( 0 )
    end
e: RE 
//b: EDIT
end

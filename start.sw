
char Usr 40

char Folder [] 10 =
"Help|help"
"OpenGL|opengl"
end

//#include "sql.sw"

extern form login ( int ) load ( "ide/login" )
//~ extern form edit ( char ) load ( "ed" )
extern form edit ( char ) load ( "richedit" ) CACHE //load this file direct, as some progs is in sub folders 
//perhaps cache should be changed to "persistent"


form main ()
    layout "Demo" SYSMENU  ystep + 3 
 r
  l                    b           b
                       b           b



         
                     
                     l                     r
 r
  l                    b           b
                       b           b



                       b           b 
                     
                     l                    r
    end
    pre
        REG_SECTION ( "SOFTWARE\\swec\\ide" )

        .additemy ( L1, "Help|OpenGL|Frame1|Frame2|Color|Math|Bitmap|Select|str_test|Updown|check|compile|lang|tooltip" +
            "|paint|base64|SpeedTest|Tab_ctrl|Mandelbr|Protect|Event|Clipboard|Color_edit|add" )
        .additemy ( L2, "Frame3|edit_cust|Sql|Print" )

        db.sqlite ( "demo.db" )
    end
field
l: L1 LISTBOX vscroll
b: B1 BUTTON "Source"
    select
        int i

        if ( .value ( L1 ) != "" )
            i = find_cd ( .value ( L1 ) )
            edit ( .value ( L1 ) + ".sw" ) 
            if ( i )
                cd ( ".." )
            end
        end
    end
b: B2 BUTTON "Run"
    select
        int i

        if ( .value ( L1 ) != "" )
            i = find_cd ( .value ( L1 ) )
            runswe ( .value ( L1 ) ) 
            if ( i )
                cd ( ".." )
            end
        end
    end
l: L2 LISTBOX 
b: B3 BUTTON "Source"
    select
        if ( .value ( L2 ) != "" )
            if ( .selected ( L2 ) < 1 )
                edit ( .value ( L2 ) + ".sw" ) 
            else
                edit ( "ide/" + .value ( L2 ) + ".sw" ) 
            end
        end
    end
b: B4 BUTTON "Run" 
    select
        if ( .value ( L2 ) != "" )

            //~ if ( .selected ( L2 ) < 2 )
                runswe ( .value ( L2 ) ) 
            //~ else
                //~ runswe ( "ide/" + .value ( L2 ) ) 
            //~ end
        end
    end
/*
b: B5 BUTTON "Connect db" y1 + 5
    select
        if ( db.connected () )
            db.disconnect ()
            .value ( B5, "Connect db" )
            .disable ( B4 )
        else
            login ( 0 )
            if ( db.connected () )
                .value ( B5, "Disconnect" )
                .enable ( B4 )
            end
        end
    end
*/
r: GB "Test/Verify program" 
r: GB "Test/Demo database"

end

func find_cd ( char file 20 )
    foreach ( Folder )
        if ( substr ( Folder [], 0 ) == file )
            cd ( substr ( Folder [], 1 ) )
            return 
        end
    end
    return 0
end



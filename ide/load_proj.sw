#include "edit_ref.h"

query sql
extern form st ()
#USE_ACUTE

form load_proj ()
    layout "Load project"  SYSMENU   

 a    
                                













                                                    a 
    end
    pre
        sql.select ( "id as ´@pa´,name,info,folder from proj" )
        .SETCOLUMNLABEL ( L1, sql )
        .SETCOLUMNWIDTH ( L1, "200;250" )
        .additem ( L1, sql )
    end
field
a: L1 LC
    dbl_click ( int pos )
        if ( pos != -1 )
            //st.additem ( T1, .getitem ( L1, pos, 0 ) ) 
            st.additem_i ( T1, 3, .getitem ( L1, pos, 0 ) )
            last_item.id = .PARAM ( L1, pos )
            sql.select ( "id as ´@pa´,name,info,folder from proj" )

           .close (0)
        end
    end
end


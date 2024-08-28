
#include "edit_ref.h"

query sql

extern form st ()

form new_proj ()
    layout "Create new project" sysmenu

 a      ab                  b
 a      ab                  b
 a      ac                  
 a      ab      b
 a      ab      b
 a      ab      b           c

                            
                d           d



end
pre
    .additem (E3, "LT;C++" )
    .set_value ( E3, "LT" )
    .set_value ( E4, "0" )
    .set_value ( E5, "0" )
    .set_value ( E6, "0" )
    
end
field
a: "Name"
b: E1 EDIT
a: "Info"
b: E2 EDIT
a: "Type"
c: E3 CB, len =4 
a: "Major"
b: E4 EDIT
a: "Minor"
b: E5 EDIT
a: "Build"
b: E6 EDIT
d: BT "Create"
    select
        if ( ! sql.insert ("proj (name,info,type,major,minor,build) values ([.E1],[.E2],[.E3],[#.E4],[#.E5],[#.E6])" ) )
            .close ( 0 )

            st.additem ( T1, "[#.E1]" )
        end

    end

end

/*
   50   1276  196  OP_SOURCE_ROW
   50   1279   44  OP_H_TAL
   50   1284   44  OP_H_TAL
   50   1289   38  OP_FORM_VAR
   50   1294  192  OP_FORM_FUNK
   50   1295    4  OP_FORM_GET
   50   1296  194  OP_STR_SPECIAL
   50   1302   53  OP_VAR_ANNAN_FIL
   50   1303   38  OP_FORM_VAR
   50   1308   92  OP_NYFORM_FUNK
   50   1309   34  OP_FORM_ADDITEM
   50   1310   98  OP_H_NEG

*/



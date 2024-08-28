
#include "demo_dll/resource.h"

func main ()
    if ( ! load_dll ( "demo_dll\\demo_dll.dll" ) )

        message ( "Can't load dll" )
        exit ()
    end

    main1 ()
end


form main1 (), frame_id ( 129 ) 

field

IDC_BUTTON1
    select
        .enable ( IDC_EDIT1 )
        .value ( IDC_EDIT1,"Test 1" )
        //.disable ( IDC_EDIT1 )
    end
IDC_BUTTON2
    select
       .value ( IDC_EDIT2, "Test 2" )
    end
end

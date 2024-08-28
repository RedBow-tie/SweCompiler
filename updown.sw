
int Page

form main ()
    layout "Updown" sysmenu

 e         eq       qu      u
    end
    pre
        .link ( U1, E1 )
        .value ( U1, 1, 9 )
        .value ( U1, 1 )
        .additem ( C2, "1|2|3|4|5|6|7|8|9" )
        .value ( C2, "3" )
    end


field
e: E1 EDIT
    leave
        int i

        i = atoi ( .E1 )
        if ( i < 1 || i > 9 )
            .value ( E1, itoa ( Page ) )
        else
            Page = i
            .value ( U1, Page )
            .value ( C2, itoa ( Page ) )
        end
    end
q: C2 CB
    value_change 
        Page = atoi ( .value ( C2 ) )
        .value ( U1, Page )
    end
u: U1 updown right

    SPIN_CHANGE ( int i )
        Page = atoi ( .value ( U1 ) ) + i
        .value ( C2, itoa ( Page ) )
    end 
end

    

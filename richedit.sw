
#define WM_CHAR 0x102


char a 10
text b

func main ()
edit ( "color.l" )
end

struct charr
    int min
    int max
end


form edit ( text str ), default_cr
    layout "empty" sysmenu resize
 c         c
 a




















                                                                     a
    end
    pre
        text str1

        .title ( str )
        if ( ! fopen_bin ( 1, str ) )
            info ( "Can't open " + str )
            return 0
        end

        str1 = fread ( 1, 60k )

        .value ( E1, str1 )
        close ( 1 )
        .sendmessage ( E1, EM_SHOWSCROLLBAR, 0, 1)
        .sendmessage ( E1, EM_SHOWSCROLLBAR, 1, 1)

        .timer ( 1, 10 )
    end
field
    on_timer ( int t )
        .timer ( 1, 0 )
        charr.min = 0
        charr.max = 0
        .SendMessage (E1, EM_SETSCROLLPOS , 0, & charr )
        .SendMessage (E1, EM_EXSETSEL, 0, & charr ) 
    end
c: BT "Run from editor"
    select
        runswe ( .E1 )
    end
a: E1 richedit, a_right a_bottom 
    key_rtab
        .sendmessage ( E1, WM_CHAR, ' ', 0 )
        .sendmessage ( E1, WM_CHAR, ' ', 0 )
        .sendmessage ( E1, WM_CHAR, ' ', 0 )
        .sendmessage ( E1, WM_CHAR, ' ', 0 )
    end      
end

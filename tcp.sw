
//extern func start () web ( "127.0.0.1/xx.lt", 81 )

tcp a

mtext taa
asdkja  asd
 JAG ÄR EN APA
end

PROCINFO proc

#define FCGI_BEGIN_REQUEST       1
#define FCGI_ABORT_REQUEST       2
#define FCGI_END_REQUEST         3
#define FCGI_PARAMS              4
#define FCGI_STDIN               5
#define FCGI_STDOUT              6
#define FCGI_STDERR              7
#define FCGI_DATA                8
#define FCGI_GET_VALUES          9
#define FCGI_GET_VALUES_RESULT  10
#define FCGI_UNKNOWN_TYPE       11
//~ #define FCGI_MAXTYPE (FCGI_UNKNOWN_TYPE)

#define FCGI_REQUEST_COMPLETE 0

struct fcgi
    char version
    char type
    char requestIdB1;
    char requestIdB0;
    char contentLengthB1;
    char contentLengthB0;
    char paddingLength;
    char reserved;
end

form start ()
    layout "A" sysmenu
 a                     
 




  
                                            a
 
 b    b
    end
pre
    text z


                char x221 100


int i
    x221 = "ABCewrewrwrwrwrwerwerewewr"


//~ #op_debug
fcgi.version = 1


char x1 100

            //~ x1 = fcgi
            //x1 = x1 + fcgi

char xx 200 


    z = "hej" 

    .label ( L1, "cmd|data" )
    .columnwidth ( L1, "200|200" )

    .tcp_server ( 10, 3306 /* 9000  */)
    //~ .tcp_server ( 10, 80 )

    //~ .web_server ()

/*
    break_point
    proc.run_stdio ( "c:\\data\\gnuplot\\binary\\gnuplot.exe -persist" )
    sleep ( 2000 )
    proc.write ( "jk kll jl\r" )
    mess ( proc.read () )
    mess ( proc.read () )
*/
end
field
/*
tcp_data1 ( tcp a, text x )  //

    mess ( a )
end
*/
//~ #yy_debug 2

tcp_data ( tcp a, text x )  //fastcgi
    int i, j
    text y
                char x1 5000
                text x2
/*
  //~ mess ( a.REMOTE_PORT () ) 
    while ( (y = substr ( x, i ++,  "\r\n" )) != NULL ) 
        .additem ( L1, y )
mess ( y )
    wend
    //~ mess ( x )
    return 0
*/

/*

//~ #op_debug
                fcgi.contentLengthB0 = 0

            x1 = fcgi
            x1 += "Content-type: text/html\r\n\r\n<html>\nHej hopp"

            x1 = x1 + fcgi

                fcgi.type = FCGI_END_REQUEST
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 1
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 8

            x1 = x1 + fcgi
               fcgi.type = 0  //FCGI_REQUEST_COMPLETE
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 0
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 0
            x1 = x1 + fcgi

                a.send ( x1, 0     ) 
           return 1

*/
char xx  300

//~ mess ( strlen ( x ) )
//~ message ( dump ( x ) )

    while ( i < strlen ( x ) )
        //for now as I havn't ant char */offset ptr 
        fcgi =  right ( x, i )
        //~ mess ( j = fcgi.type )
        switch ( fcgi.type )
            case FCGI_BEGIN_REQUEST
                break
            case FCGI_STDIN
                //~ mess ( "start" )
/*
0000   02 00 00 00 45 00 00 72 1d b1 40 00 80 06 00 00   ....E..r..@.....
0010   7f 00 00 01 7f 00 00 01 23 28 d0 17 3e 73 7c 83   ........#(..>s|.
0020   f0 4e 04 45 50 18 27 f9 87 a3 00 00 

01 06 00 01   .N.EP.'.........

0030   00 2a 00 00 43 6f 6e 74 65 6e 74 2d 74 79 70 65   .*..Content-type
0040   3a 20 74 65 78 74 2f 68 74 6d 6c 0d 0a 0d 0a 3c   : text/html....<
0050   68 74 6d 6c 3e 0a 48 65 6a 20 68 6f 70 70 01 06   html>.Hej hopp..
0060   00 01 00 00 00 00 01 03 00 01 00 08 00 00 01 00   ................
0070   00 00 00 00 00 00                                 ......


               */



                fcgi.type = FCGI_STDOUT
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 1
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 42
            

//~ mess ( dump (fcgi ) ) 

xx = ""
//~ #op_debug
            xx += fcgi
//~ mess ( dump (xx ) ) 

            xx += "Content-type: text/html\r\n\r\n<html>\nHej hopp"


                fcgi.type = FCGI_STDOUT
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 1
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 0



            xx += fcgi


                fcgi.type = FCGI_END_REQUEST
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 1
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 0
                fcgi.paddingLength = 0

            xx += fcgi + " "

/*
                fcgi.version = 0 
                fcgi.type = 0  
                fcgi.requestIdB1 = 0
                fcgi.requestIdB0 = 0  //FCGI_REQUEST_COMPLETE
                fcgi.contentLengthB1 = 0
                fcgi.contentLengthB0 = 0
            xx += fcgi
*/
                a.send ( xx, 1     ) 
                //~ a.close ( )
           return 1
                break
            case FCGI_PARAMS
                y = right ( x, i + sizeof ( fcgi ) )
                j = y [0] >> 7
                j |= y [1] & 0x80 >> 6
                //~ mess ( "cmd [j]" )
                


                j = 0
int k
                while ( 1 ) 

                  if ( y [j] == 0 && y [j + 1] == 0 )
                        j += 4
                        break
                    end

                    xx = mid ( y, j + 2, 0x7f & y [j] )
                    x2 = ( mid ( y, j + 2 + (y [j] & 0x7f), y [j + 1] & 0x7f ) )
//~ mess ( xx + x2 )
                    .additem ( L1, "[#xx]|[#x2]" )

                    j += 2 + (y [j] & 0x7f) + (y [j + 1] & 0x7f )

                wend

                //~ i += j
                //~ mess ( dump ( y ) )
                break
            default
                j = fcgi.type
                //~ mess ( "miss [j]" ) 
                return 0
        end
//~ return 0
//~ mess ( j )
//~ mess ( j = y [j] )

                i += sizeof ( fcgi ) + fcgi.paddingLength + 256 * fcgi.contentLengthB1 + fcgi.contentLengthB0
                    //mess ( mid ( y, j + 2 + (y [j] & 0x7f), y [j + 1] & 0x7f ) )
//~ mess ( "i = [i]" )
    wend
    i = fcgi.type


    //~ message ( dump ( x ) )
    //~ a.send ( taa, 0 )
end

a: L1 LC
b: bt
    select 
    end
end



func x1 ( tcp a)
/*
    if ( a.ip == "127.0.0.1" )
        return 0
    end
*/
end

func x ()



//    a.connect ( "192.168.5.51", 80 )

    a.send ( "\\x80w\\x01\\x03\\x01\n", 0 )

    message ( a.read ( 0 ) )
    //    a.accept ( x1 )

    //a.rec ( x1 )
    message ( a.read ( 0 ) )
    message ( a.read ( 0 ) )
end

/*

form start ()
    layout "A" sysmenu
 a       a
 
    end
field
a: E1 EDIT

end

*/


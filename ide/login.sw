
extern char Usr

query sql
int i
char regv 5

form login (int z)
    layout "Login" sysmenu

 a     ab                        b  c       c
 a     ab   b
 a     ab                        b
 a     ab                        b
 a     ab                        b

        d           d 
    end
    pre
        if ( z )
            regv = "2"
        end
            .display ()        

        if ( reg_str ( "server" + regv ) != "" )
            .display ()        
        else
            .value ( E1, "localhost" )
            .value ( E2, "5432" )
            .value ( E3, "postgres" )
            .value ( E5, "postgres" )
        end
    end
field
a: "Server"
b: E1 EDIT, display ( reg_str ( "server"  + regv ) )
a: "Port"
b: E2 EDIT num, display ( reg_str ( "server_port" + regv ) )
a: "Database"
b: E5 EDIT, display ( reg_str ( "database" + regv ) )
a: "Login"
b: E3 EDIT, display ( reg_str ( "login" + regv ) )
a: "Password"
b: E4 EDIT pwd
d: TCON TB "Auto connect", display ( reg_str ( "auto" + regv ) )
c: AL BT "Login"
    select
        if ( z ) 
            i = db2.connect ( "host=[#.E1] port=[#.E2] dbname=[#.E5] user=[#.E3] password=[#.E4]" ) 
        else
            i = db.connect ( "host=[#.E1] port=[#.E2] dbname=[#.E5] user=[#.E3] password=[#.E4]" ) 
        end
        if ( i )
            WARNING ( sql.error () )        
        else
            Usr = .E3
            if ( .checked ( TCON ) )
                reg_str ( "server"  + regv, .E1 )
                reg_str ( "database"  + regv, .E5 )
                reg_str ( "server_port" + regv, .E2 )
                reg_str ( "pwd" + regv, crypt ( .E4, 56 ) )
                reg_str ( "login" + regv, .E3 )
                reg_str ( "auto" + regv, "1" )
            else
                reg_str ( "auto" + regv, "0" )
            end
            .close ( 1 )
        end
    end
end

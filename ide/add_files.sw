query sql

char str 3000

str1 st

int i

dll_str get_def ( ) 
dll_str get_src ( 0 ) 
dll_str main ( para char ) 


form add_files ( /* int type*/ )
    layout "Add files" sysmenu ystep + 2

 a                                     b        b
                                       b        b



                                    a
 c          c


end
pre
   load_dll ( "../konv_c.dll" )

end
field
a: L1 LB
c: CHB "Separate func"
b: BT "Open"
    select
   		str = load_dlg ( "", "*.*", "C-files (*.c.*.cpp)|*.c;*.cpp;*.h|All-files (*.*)|*.*|" )
        if ( str != "" )
            .additem ( L1, str )
        end
    end

b: BT "Save"
    select

message ( str )

        main ( str )
        str = get_def ()
        while ( str != "" )
            st = get_src ()
            sql.insert ( "func (func_id,name,src) values (0,[str],[st])" )            
            str = get_def ()
        wend

/*
        fopen ( 1, str )
        while ( ! eof ( 1 ) )
            st = st + read ( 3000 , 1 )            
        wend
        close ( 1 )
        sql.insert ( "func (func_id,name,src) values (0,'',[st])" )
*/
    end

end




query sql

form x_sql ( int z )
    layout "Execute SQL" sysmenu resize
 a                                                                           
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                            a
 b                                                                  c        
                                                                            c
                                                                             
                                                                             
                                                                             
                                                                             
                                                                b            
end
    pre
        if ( z )
            .title ( .title () + "(db2)" )
        end
    end
field
a: L1 LC, A_RIGHT A_BOTTOM  
b: E1 EDIT, A_YMOVE A_RIGHT
c: B1 BT  "Run", A_YMOVE A_XMOVE
	select
        if ( z )
            sql.exec ( db2, x_sql.E1 )
        else 
            sql.exec ( x_sql.E1 )
        end
		.label (L1, sql )
		.additem ( L1, sql )
	end
end


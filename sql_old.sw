
query ssql

form x_sql () 
    layout "Execute SQL" sysmenu resize
 a                                                                           
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                             
                                                                            a
 b                                                                  c        
                                                                            c
                                                                             
                                                                             
                                                                             
                                                                             
                                                                b            
end
    pre
    end
field
a: L1 LC, A_RIGHT A_BOTTOM  
b: E1 EDIT, A_YMOVE A_RIGHT
c: B1 BT  "Execute", A_YMOVE A_XMOVE
	select
        ssql.exec ( x_sql.E1 )
		.label (L1, ssql )
		.additem ( L1, ssql )
	end
end


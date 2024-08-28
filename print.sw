
int z
query sql
printer pr


func main ()
    if ( ! db.connected () )
        //~ if ( ! login ( 0 ) )
            return ( 0 )
        //~ end
    end 
    start ()
end


list head
<12>Our_Customers                                                                               #t                                   Page    #a
===================================================================================================================================

          Id             Name                              Street                                 City
          -----------------------------------------------------------------------------------------------------------------------------
field
   paint ( cre x )
      lprint ( #t, _date )
      lprint ( #a, _Page )
   end
end

list rows
          #a             #b                                 #c                                    #d 
field
paint ( cre x )
   lprint ( #a, sql.cust_no )
   lprint ( #b, sql.name )
   lprint ( #c, sql.street )
   lprint ( #d, sql.city )
end
end


func page ()	
    lsection ( head)
    z = 0
    pr.page_pos ( _page, sql )
	while ( z < pr.max_row () && sql.more () )
        if ( lsection ( rows ) == 0 )
            return ( ! sql.more () )
        end
        ++ z
        ++ sql
	wend
    return ( ! sql.more () )
end



form start ()
   layout "Print test" sysmenu

 b            b
 b            b
 b            b
 b            b

   end
field

57607
   select
      pr.run ( 0 )
   end
b: BT "Preview"
   select

      sql.select ( "* from customer" )
      pr.title ( "Cust list " )
      pr.func ( page )
      pr.run ( 1 )
   end
b: BT "Print"
   select
      sql.select ( "* from customer" )
      pr.title ( "Cust list " )
      pr.func ( page )
      pr.run ( 0 )
   end
b: BT "Select printer"
   select
        if ( pr.SELECT_PRINTER () )
            pr.save_printer ( "std_printer" )
        end
   end
b: BT "Print on selected printer"
   select
      pr.load_PRINTER ( "std_printer" )
      pr.title ( "Cust list " )

      sql.select ( "* from customer" )
      pr.func ( page )
      pr.run ( 0 )

   end
end



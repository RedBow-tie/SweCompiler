
query sql
int i
char Usr 20

extern func login ( int ) load ( "ide/login.l" )

#if 0
func start ()
    if ( ! db.connected () )
        if ( login ( 0 ) == 1 )
            i = sql.exec_noerr ( "select * from customer limit 1" )
            if ( i )
                if ( ask ( "Create Customer table ?" ) )
                    cre_cust ()
                    sql.exec_noerr ( "select * from customer limit 1" )
                else
                    info ( "Can't continue with out table" )
                    return ( 0 )
                end
            end
            cust ()
        end
    end
end

#endif

form cust ()
    layout "Customers" ystep + 2 sysmenu

 a     ab               b         d       d
 a     ab               b         d       d
 a     ab               b         d       d 
 a     ab               b         d       d 

 c










                                            c
    end
	pre
        sql.select ( "* from customer" )
		.label (IDC_LIST1, sql )
		.columnwidth ( IDC_LIST1, "80;80;100;100" )
        .ADDITEM_clr ( IDC_LIST1, sql )
        disp_cust ()
        i = -1
	end 
field
a: "Cust no"
a: "Name" 
a: "Street" 
a: "City" 
b: IDC_EDIT EDIT, display ( sql.cust_no ) 
b: IDC_EDIT1 EDIT, display ( sql.name )
b: IDC_EDIT2 EDIT, display ( sql.street )  
b: IDC_EDIT3 EDIT, display ( sql.city )


d: IDC_NEW BUTTON "New"
    select
        .CLEARSELECTED ( IDC_LIST1 )

        .disable ( IDC_DEL )
        .enable ( IDC_EDIT )
        .clear ( IDC_EDIT )
        .clear ( IDC_EDIT1 )
        .clear ( IDC_EDIT2 )
        .clear ( IDC_EDIT3 )
    end

d: IDC_SAVE BUTTON "Save"	
	select
        if ( ! .isenabled ( IDC_EDIT ) ) 
            if ( i == -1 )
                info ( "No marked row in the list" )
                return ( 0 )
            end
            sql.update ( "customer SET " +
            "name=[.IDC_EDIT1]," +
            "street=[.IDC_EDIT2]," +
            "city=[.IDC_EDIT3] " +
            "where cust_no=[.IDC_EDIT]" )  
        else 
            sql.insert ( "customer values ( " +
            "[.IDC_EDIT]," +
            "[.IDC_EDIT1]," +
            "[.IDC_EDIT2]," +
            "[.IDC_EDIT3] ) " )  
            .clear ( IDC_EDIT )
            .clear ( IDC_EDIT1 )
            .clear ( IDC_EDIT2 )
            .clear ( IDC_EDIT3 )
        end
        disp_cust ()
    end

d: IDC_DEL BUTTON "Delete"
    select
        if ( i == -1 )
            info ( "No marked row in the list" )
            return ( 0 )
        end
    
        if ( ask ( "Delete " + sql.name ) ) 
            sql.delete ( "customer where cust_no=[sql.cust_no]" )                 
            .disable ( IDC_DEL )
            .clear ( IDC_EDIT )
            .clear ( IDC_EDIT1 )
            .clear ( IDC_EDIT2 )
            .clear ( IDC_EDIT3 )
            disp_cust ()
        end
    end

c: IDC_LIST1 LISTCONTROL
	click ( int pos )  //change_row
        i = pos
        if ( pos != -1 )
            sql.varindex ( i )  //sql = i doesn't work
            .display ()
           .enable ( IDC_DEL )
           .disable ( IDC_EDIT )
        else       
            .enable ( IDC_EDIT )
            .disable ( IDC_DEL )
            .clear ( IDC_EDIT )
            .clear ( IDC_EDIT1 )
            .clear ( IDC_EDIT2 )
            .clear ( IDC_EDIT3 )
        end
    end 
end

func disp_cust ()
    sql.select ( "* from customer" )
    cust.additem_clr ( IDC_LIST1, sql )
end

func cre_cust ()
    //~ sql.begin ()
    sql.exec ( "CREATE TABLE customer (" + 
        " cust_no character varying NOT NULL," +
        " name character varying," +
        " street character varying," +
        " city character varying," +
        " CONSTRAINT customer_pkey PRIMARY KEY (cust_no) )" )
    
    if ( db.dbtype () == POSTGRESQL_DB )
        sql.exec ( "copy customer from stdin delimiter ';'" )
        db.COPYIN ( "1;John Doe;10 Ave;NY\n" )
        db.COPYIN ( "2;Peggy Smith;20 Ave;NY\n" )
        db.COPYIN ( "3;Freddy Bee;50 Ave;LA\n" )
        db.COPYIN ( "4;Ronny P;50 Computer Ave;Stockholm, SWEDEN\n" )
        db.fincopy ( )
    else
        sql.insert ( "customer values ( '1', 'John Doe', '10 Ave', 'NY' )" )
        sql.insert ( "customer values ( '2', 'Peggy Smith', '20 Ave', 'NY'" )
        sql.insert ( "customer values ( '3' ,'Freddy Bee','50 Ave','LA' )" )
        sql.insert ( "customer values ( '4', 'Ronny P', '50 Computer Ave', 'Stockholm, SWEDEN' )" )
    end
    //~ sql.commit ()
end



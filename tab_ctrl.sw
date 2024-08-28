

form page1 (), nowait
    layout "" child NOCAPTION exstyle=1  //WS_EX_DLGMODALFRAME
 b          b 
 a         a


end
field
a: "Page 1"
b: W_BT BT "Test1"
    select 
         main.close ( 0 )
    end

end

form page2 (), nowait
    layout "" child NOCAPTION exstyle=1

 b       b 
 a         a


end
field
a: "Page 2"
b: W_BT BT "Test2"
    select 
        info ( page1.W_BT )
    end
end


form main ()
    layout "Tab control" sysmenu
 b       b
 a













                                         a

end
pre
    .addpage ( W_TAB, 0, "Page 1", page1 )
    .addpage ( W_TAB, 1, "page 2", page2 )
    .selectpage ( W_TAB, 0 )

end

field
a: W_TAB tc
b: W_BT BT "Test"
    select 
        info ( main.W_BT )
    end
end







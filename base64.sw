

func start ()
 text  a 
    a = base64_enc ( "this is just a simple test" ) 
    info ( a )

    info ( base64_dec ( a ) )

end

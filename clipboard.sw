



char fmt [18] 20 =
""
"CF_TEXT"
"CF_BITMAP"
"CF_METAFILEPICT"
"CF_SYLK"
"CF_DIF"
"CF_TIFF"
"CF_OEMTEXT" 
"CF_DIB" 
"CF_PALETTE"
"CF_PENDATA"
"CF_RIFF" 
"CF_WAVE" 
"CF_UNICODETEXT" 
"CF_ENHMETAFILE"
"CF_HDROP"
"CF_LOCALE" 
"CF_DIBV5"
"CF_MAX"
end

mtext Init_rich
{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1053{\fonttbl{\f0\fnil\fcharset0 Lucida Console;}{\f1\fnil\fcharset2 Symbol;}}
{\colortbl ;\red255\green0\blue0;}
{\*\generator Riched20 10.0.19041}\viewkind4\uc1 
\pard\sl240\slmult1\cf1\f0\fs19\lang29\par
}
end

form main ()
    int Pos [2]
    int Text_mode
    
    layout "Peek clipboard" sysmenu 
a                                            b      b
                                             d       d







                                    a
c








                                                     c
end
pre
    .COLUMNLABEL ( LIST_C, "Commando|Format|Hex" )
    .columnwidth ( LIST_C, "250|70|80" )
    .richtext ( V_TXT, Init_rich )
    .sendmessage (V_TEXT, 0x400 + 204 /* EM_SETEDITSTYLE */ , /* SES_CTFALLOWEMBED */ 0x00200000, 0x00200000 )

    .click ( .V_PEEK )
end

field
a: LIST_C LC allways
    SELECT_ITEM ( int i )
        text t

        if ( i != -1 )
            .waitcursor ( 1 )
            .richtext ( V_TXT, Init_rich )
            Pos [0] = 0
            Pos [1] = -1
            i = atoi ( .getitem ( LIST_C, i, 1 ) )
            .sendmessage ( V_TXT, EM_EXSETSEL, 0, & Pos ) 
            if ( Text_mode )
                .SendMessage ( V_TXT, EM_REPLACESEL, 1, str_ptr ( clipboard ( i ) ) )
            else
                .SendMessage ( V_TXT, EM_REPLACESEL, 1, str_ptr ( dump ( clipboard ( i ) ) ) )
            end
            .waitcursor ( 0 )
            return
        else
            .SendMessage ( V_TXT, EM_REPLACESEL, 1, str_ptr ( Init_rich ) )
        end
    end

b: V_PEEK BT "Check"
    select
        text t
        char tt 100
        int i, j

        .DELALLITEM ( LIST_C )
        t = enum_clipboard ()
        while ( (tt = substring ( t, i )) != "" )
            j = atoi ( substring ( tt, 1, ";" ) )
            if ( j < 19 )
                tt = subst ( tt, ";", fmt [j] + "|" )
            end
            tt += "|" + hex ( j )
            .additem ( LIST_C, subst_all ( tt, ";", "|" ) )
            ++ i
        wend
    end

d: V_TEXT TB "Show as text"
    select
        Text_mode = .CHECKED ( V_TEXT ) 
    end

c: V_TXT RE
end



bitmap24 dn size(11, 11)  bcolor = white
...........
...........
a.........c
...........
.....z.....
...........
...........
.....b.....
...........
...........
...........
end
abca: line red
z: fill red
end

int Palette [64]

int Colors [16], i


int Effect

form ed_font (), no_auto_next
    layout "Edit style" sysmenu

 a           aa         ac           
 a           aa         a 
 a           aa         a z    zz       z
 a           aa         a z    zz       z
 a           aa         a
 a           aa         a
 a           aa         a
 a           aa         a
 a           aa         a

   z    zz       z

 a           a                           c  
end
pre
    text a
//~ mess ( len ( init_color ) )
//~ mess ( hex ( V_COLOR ) )
//~ break_point
//~ #yy_debug
    //.sendmessage ( V_COLOR, 0x037C, 0xd7 /* len ( init_color ) */, STR_PTR (init_color) )
/*
  .bcolor ( V_COLOR, color.red )
    .value ( V_COLOR, "   " )
    a = .ENUMFONTS ()
*/

    .image ( V_FGCOLOR, dn )

 //~ trace_sig ( 1 )
    //~ mess ( _INSTRUCTIONS [form_inst] [0] )
    //~ mess ( _INSTRUCTIONS [form_inst] [1] )

    .display ()
    //.additem ( V_FONT, a )
    Colors [0] = rgb ( 255,224,130 )

    .color ( V_FGCOLOR, rgb ( 255,0,0 ))

    //~ load_palette ( & Palette )
    //~ mess ( .title ( V_FONT ) )
    //~ mess ( .value ( V_FONT ) )


  //~ mess ( strlen ( a ) )
    //~ mess ( a )
end

field
c: V_FONT FONT
    value_change  
        mess ( .value ( V_FONT ) )
    end
z: "Fg.color"
z: V_FGCOLOR color
    select
        mess ( hex ( .get_color ( V_FGCOLOR ) ) )
    end
z: "Bg.color"
z: V_BGCOLOR color

/*
z: V_COLOR ltext
z: BT_COLOR bt size ( 10, 12 )  x1 - 3  
    select
        i = colordlg ( .get_bcolor ( V_COLOR ), & Colors  )
        .bcolor ( V_COLOR, i )
    end
*/
a: V_BOLD CHECK "Bold", display ( Effect & CFE_BOLD )
    select
        Effect &= ~CFE_BOLD
        Effect |= CFE_BOLD * .checked ( V_BOLD )
    end
a: V_ITALIC CHECK "Italic", display ( Effect &CFE_ITALIC )
    select
        Effect &= ~CFE_ITALIC
        Effect |= CFE_ITALIC * .checked ( V_ITALIC )
    end
a: V_UNDERLINE CHECK "Underline", display ( Effect & CFE_UNDERLINE )
    select
        Effect &= ~CFE_UNDERLINE
        Effect |= CFE_UNDERLINE * .checked ( V_UNDERLINE )
    end
a: V_STRIKEO CHECK "Strikeout", display ( Effect & CFE_STRIKEOUT )
    select
        Effect &= ~CFE_STRIKEOUT
        Effect |= CFE_STRIKEOUT * .checked ( V_STRIKEO )
    end
a: V_PROT CHECK "Protected", display ( Effect & CFE_PROTECTED )
    select
        Effect &= ~CFE_PROTECTED
        Effect |= CFE_PROTECTED * .checked ( V_PROT )
    end
a: V_LINK CHECK "Link", display ( Effect & CFE_LINK )
    select
        Effect &= ~CFE_LINK
        Effect |= CFE_LINK * .checked ( V_LINK )
    end
a: V_SMALL CHECK "Smallcaps", display ( Effect & CFM_SMALLCAPS )
    select
        Effect &= ~CFM_SMALLCAPS
        Effect |= CFM_SMALLCAPS * .checked ( V_SMALL )
    end
a: V_ALL CHECK "Allcaps", display ( Effect & CFM_ALLCAPS )
    select
        Effect &= ~CFM_ALLCAPS
        Effect |= CFM_ALLCAPS * .checked ( V_ALL )
    end
a: V_HIDDEN CHECK "Hidden", display ( Effect & CFM_HIDDEN )
    select
        Effect &= ~CFM_HIDDEN
        Effect |= CFM_HIDDEN * .checked ( V_HIDDEN )
    end
a: V_OUTLINE CHECK "Outline", display ( Effect & CFM_OUTLINE )
    select
        Effect &= ~CFM_OUTLINE
        Effect |= CFM_OUTLINE * .checked ( V_BOLD )
    end
a: V_SHADDOW CHECK "Shaddow", display ( Effect & V_OUTLINE )
    select
        Effect &= ~CFM_SHADOW
        Effect |= CFM_SHADOW * .checked ( V_BOLD )
    end
a: V_EMBOSS CHECK "Emboss", display ( Effect & CFM_EMBOSS )
    select
        Effect &= ~CFM_EMBOSS
        Effect |= CFM_EMBOSS * .checked ( V_BOLD )
    end
a: V_IMPRINT CHECK "Imprint", display ( Effect & CFM_IMPRINT )
    select
        Effect &= ~CFM_IMPRINT
        Effect |= CFM_IMPRINT * .checked ( V_EMBOSS )
    end
a: V_DIS CHECK "Disabled", display ( Effect & CFM_DISABLED )
    select
        Effect &= ~CFM_DISABLED
        Effect |= CFM_DISABLED * .checked ( V_BOLD )
    end
a: V_SUBSC CHECK "Subscript", display ( Effect & CFE_SUBSCRIPT )
    select
        Effect &= ~CFE_SUBSCRIPT
        Effect |= CFE_SUBSCRIPT * .checked ( V_DIS )
    end
a: V_SUPER CHECK "Superscript", display ( Effect & CFE_SUPERSCRIPT )
    select
        Effect &= ~CFE_SUPERSCRIPT
        Effect |= CFE_SUPERSCRIPT * .checked ( V_SUPER )
    end
end



/*
CFE_BOLD			0x00000001
CFE_ITALIC			0x00000002
CFE_UNDERLINE		0x00000004
CFE_STRIKEOUT		0x00000008
CFE_PROTECTED		0x00000010
CFE_LINK			0x00000020
CFE_AUTOCOLOR		0x40000000		

CFM_SMALLCAPS		0x00000040	
CFM_ALLCAPS 		0x00000080	
CFM_HIDDEN			0x00000100	
CFM_OUTLINE 		0x00000200	
CFM_SHADOW			0x00000400	
CFM_EMBOSS			0x00000800	
CFM_IMPRINT 		0x00001000	
CFM_DISABLED		0x00002000
CFM_REVISED 		0x00004000

CFM_REVAUTHOR		0x00008000
CFE_SUBSCRIPT		0x00010000	
CFE_SUPERSCRIPT 	0x00020000	
//~ CFM_ANIMATION		0x00040000	
//~ CFM_STYLE			0x00080000		// (*)	
//~ CFM_KERNING 		0x00100000
//~ CFM_SPACING 		0x00200000		// Displayed by 3.0 
//~ CFM_WEIGHT			0x00400000
//~ CFM_UNDERLINETYPE	0x00800000		// Many displayed by 3.0 

*/

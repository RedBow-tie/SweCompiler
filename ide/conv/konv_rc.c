#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <windows.h>

// #define DLL

int Step_x = 3, Step_y = 7;
char * Data;
int DPos;
int Max_data, w;

struct str {
    int len;
    char c;
} * Gdata ;


int Size [4];
int Line;

struct widg {
    char text [100];
    char type [25];
    char id [25];
    int pos [4];
    long style;
    long exstyle;
    char tstyle [300];
} Widg [200];

#define MAX_X 400
#define MAX_Y 400

char Pos [MAX_Y][MAX_X];

struct fn {
    char * txt;
    long unsigned v;
} Style [] = {
    { "DS_ABSALIGN",      0x01 },
    { "DS_SYSMODAL",      0x02},
    { "DS_LOCALEDIT",     0x20},   
    { "DS_SETFONT",       0x40},   
    { "DS_MODALFRAME",    0x80},   
    { "DS_NOIDLEMSG",     0x100},  
    { "DS_SETFOREGROUND", 0x200},  
    { "DS_3DLOOK",        0x0004},
    { "DS_FIXEDSYS",      0x0008},
    { "DS_NOFAILCREATE",  0x0010},
    { "DS_CONTROL",       0x0400},
    { "DS_CENTER",        0x0800},
    { "DS_CENTERMOUSE",   0x1000},
    { "DS_CONTEXTHELP",   0x2000},

    { "BS_PUSHBUTTON",    0x0000 },
    { "BS_DEFPUSHBUTTON", 0x0001 },
    { "BS_CHECKBOX",      0x0002 },
    { "BS_AUTOCHECKBOX",  0x0003 },
    { "BS_RADIOBUTTON",   0x0004 },
    { "BS_3STATE",        0x0005 },
    { "BS_AUTO3STATE",    0x0006 },
    { "BS_GROUPBOX",      0x0007 },
    { "BS_USERBUTTON",    0x0008 },
    { "BS_AUTORADIOBUTTON", 0x009 },
    { "BS_PUSHBOX",       0x000A },
    { "BS_OWNERDRAW",     0x000B },
    { "BS_LEFTTEXT",      0x0020 },

    { "BS_TEXT",          0x0000 },
    { "BS_ICON",          0x0040 },
    { "BS_BITMAP",        0x0080 },
    { "BS_LEFT",          0x0100 },
    { "BS_RIGHT",         0x0200 },
    { "BS_CENTER",        0x0300 },
    { "BS_TOP",           0x0400 },
    { "BS_BOTTOM",        0x0800 },
    { "BS_VCENTER",       0x0C00 },
    { "BS_PUSHLIKE",      0x1000 },
    { "BS_MULTILINE",     0x2000 },
    { "BS_NOTIFY",        0x4000 },
    { "BS_FLAT",          0x8000 },
    { "BS_RIGHTBUTTON",   0x0020 },

    { "ES_LEFT",          0x0000 },
    { "ES_CENTER",        0x0001 },
    { "ES_RIGHT",         0x0002 },
    { "ES_MULTILINE",     0x0004 },
    { "ES_UPPERCASE",     0x0008 },
    { "ES_LOWERCASE",     0x0010 },
    { "ES_PASSWORD",      0x0020 },
    { "ES_AUTOVSCROLL",   0x0040 },
    { "ES_AUTOHSCROLL",   0x0080 },
    { "ES_NOHIDESEL",     0x0100 },
    { "ES_OEMCONVERT",    0x0400 },
    { "ES_READONLY",      0x0800 },
    { "ES_WANTRETURN",    0x1000 },
    { "ES_NUMBER",        0x2000 },

    { "WS_OVERLAPPED",    0x0 },
    { "WS_POPUP",         0x80000000 },   
    { "WS_CHILD",         0x40000000 },
    { "WS_MINIMIZE",      0x20000000 },
    { "WS_VISIBLE",       0x10000000 },
    { "WS_DISABLED",      0x08000000 },
    { "WS_CLIPSIBLINGS",  0x04000000 },
    { "WS_CLIPCHILDREN",  0x02000000 },
    { "WS_MAXIMIZE",      0x01000000 },
    { "WS_CAPTION",       0x00C00000 },     
    { "WS_BORDER",        0x00800000 },
    { "WS_DLGFRAME",      0x00400000 },
    { "WS_VSCROLL",       0x00200000 },
    { "WS_HSCROLL",       0x00100000 },
    { "WS_SYSMENU",       0x00080000 },
    { "WS_THICKFRAME",    0x00040000 },
    { "WS_GROUP",         0x00020000 },
    { "WS_TABSTOP",       0x00010000 },
    { "WS_MINIMIZEBOX",   0x00020000 },
    { "WS_MAXIMIZEBOX",   0x00010000 },

    { "SS_LEFT",           0x0000 },
    { "SS_CENTER",         0x0001 },
    { "SS_RIGHT",          0x0002 },
    { "SS_ICON",           0x0003 },
    { "SS_BLACKRECT",      0x0004 },
    { "SS_GRAYRECT",       0x0005 },
    { "SS_WHITERECT",      0x0006 },
    { "SS_BLACKFRAME",     0x0007 },
    { "SS_GRAYFRAME",      0x0008 },
    { "SS_WHITEFRAME",     0x0009 },
    { "SS_USERITEM",       0x000A },
    { "SS_SIMPLE",         0x000B },
    { "SS_LEFTNOWORDWRAP", 0x000C },
    { "SS_OWNERDRAW",      0x000D },
    { "SS_BITMAP",         0x000E },
    { "SS_ENHMETAFILE",    0x000F },
    { "SS_ETCHEDHORZ",     0x010 },
    { "SS_ETCHEDVERT",     0x0011 },
    { "SS_ETCHEDFRAME",    0x012 },
    { "SS_REALSIZECONTROL",0x040 },
    { "SS_NOPREFIX",       0x0080  },
    { "SS_NOTIFY",         0x0100 },
    { "SS_CENTERIMAGE",    0x0200 },
    { "SS_RIGHTJUST",      0x0400 },
    { "SS_REALSIZEIMAGE",  0x0800 },
    { "SS_SUNKEN",         0x1000 },
    { "SS_EDITCONTROL",    0x2000 },
    { "SS_ENDELLIPSIS",    0x4000 },
    { "SS_PATHELLIPSIS",   0x8000 },
    { "SS_WORDELLIPSIS",   0xC000 },

    { "WS_EX_DLGMODALFRAME",  0x00001 },
    { "WS_EX_NOPARENTNOTIFY", 0x00004 },
    { "WS_EX_TOPMOST",        0x00008 },
    { "WS_EX_ACCEPTFILES",    0x00010 },
    { "WS_EX_TRANSPARENT",    0x00020 },
    { "WS_EX_MDICHILD",       0x00040 },
    { "WS_EX_TOOLWINDOW",     0x00080 },
    { "WS_EX_WINDOWEDGE",     0x00100 },
    { "WS_EX_CLIENTEDGE",     0x00200 },
    { "WS_EX_CONTEXTHELP",    0x00400 },
    { "WS_EX_RIGHT",          0x01000 },
    { "WS_EX_LEFT",           0x00000 },
    { "WS_EX_RTLREADING",     0x02000 },
    { "WS_EX_LTRREADING",     0x00000 },
    { "WS_EX_LEFTSCROLLBAR",  0x04000 },
    { "WS_EX_RIGHTSCROLLBAR", 0x00000 },
    { "WS_EX_CONTROLPARENT",  0x10000 },
    { "WS_EX_STATICEDGE",     0x20000 },
    { "WS_EX_APPWINDOW",      0x40000 },

    { "LVS_ICON",             0x0000 },
    { "LVS_REPORT",           0x0001 },
    { "LVS_SMALLICON",        0x0002 },
    { "LVS_LIST",             0x0003 },
    { "LVS_SINGLESEL",        0x0004 },
    { "LVS_SHOWSELALWAYS",    0x0008 },
    { "LVS_SORTASCENDING",    0x0010 },
    { "LVS_SORTDESCENDING",   0x0020 },
    { "LVS_SHAREIMAGELISTS",  0x0040 },
    { "LVS_NOLABELWRAP",      0x0080 },
    { "LVS_AUTOARRANGE",      0x0100 },
    { "LVS_EDITLABELS",       0x0200 },
    { "LVS_OWNERDATA",        0x1000 },
    { "LVS_NOSCROLL",         0x2000 },
    { "LVS_ALIGNTOP",         0x0000 },
    { "LVS_ALIGNLEFT",        0x0800 },
    { "LVS_OWNERDRAWFIXED",   0x0400 },
    { "LVS_NOCOLUMNHEADER",   0x4000 },
    { "LVS_NOSORTHEADER",     0x8000 },

    { "TVS_HASBUTTONS",       0x0001 },
    { "TVS_HASLINES",         0x0002 },
    { "TVS_LINESATROOT",      0x0004 },
    { "TVS_EDITLABELS",       0x0008 },
    { "TVS_DISABLEDRAGDROP",  0x0010 },
    { "TVS_SHOWSELALWAYS",    0x0020 },
    { "TVS_RTLREADING",       0x0040 },
    { "TVS_NOTOOLTIPS",       0x0080 },
    { "TVS_CHECKBOXES",       0x0100 },
    { "TVS_TRACKSELECT",      0x0200 },
    { "TVS_SINGLEEXPAND",     0x0400 },
    { "TVS_INFOTIP",          0x0800 },
    { "TVS_FULLROWSELECT",    0x1000 },
    { "TVS_NOSCROLL",         0x2000 },
    { "TVS_NONEVENHEIGHT",    0x4000 },

    { "UDS_WRAP",             0x0001 },
    { "UDS_SETBUDDYINT",      0x0002 },
    { "UDS_ALIGNRIGHT",       0x0004 },
    { "UDS_ALIGNLEFT",        0x0008 },
    { "UDS_AUTOBUDDY",        0x0010 },
    { "UDS_ARROWKEYS",        0x0020 },
    { "UDS_HORZ",             0x0040 },
    { "UDS_NOTHOUSANDS",      0x0080 },

    { "CBS_SIMPLE",            0x0001 },
    { "CBS_DROPDOWN",          0x0002 },
    { "CBS_DROPDOWNLIST",      0x0003 },
    { "CBS_OWNERDRAWFIXED",    0x0010 },
    { "CBS_OWNERDRAWVARIABLE", 0x0020 },
    { "CBS_AUTOHSCROLL",       0x0040 },
    { "CBS_OEMCONVERT",        0x0080 },
    { "CBS_SORT",              0x0100 },
    { "CBS_HASSTRINGS",        0x0200 },
    { "CBS_NOINTEGRALHEIGHT",  0x0400 },
    { "CBS_DISABLENOSCROLL",   0x0800 },
    { "CBS_UPPERCASE",         0x2000 },
    { "CBS_LOWERCASE",         0x4000 },
    
    { "NOT",                   0xff },

    { 0, 0 }
};

struct fn Cmd [] = {
    { "STYLE",  1 }, 
    { "CAPTION",2 },
    { "FONT",   3 },
    { "BEGIN",  4 },
    { "ICON",   5 },
    { "LTEXT",  6 },
    { "DEFPUSHBUTTON", 7 },
    { "END",      8 },
    { "DIALOGEX", 9 },
    { "DIALOG",   9 },
    { "EDITTEXT", 10 },
    { "PUSHBUTTON", 11 },
    { "EXSTYLE", 12 },
    { "CONTROL", 13 },
    { "GROUPBOX", 14 },
    { "CTEXT",  15 },
    { "COMBOBOX", 16 },
    { "RTEXT",  17 },
    { "LISTBOX",  18 },

    { "\"SysListView32\"", 20 },
    { "\"Button\"", 21 },
    { "\"SysTabControl32\"", 22 },
    { "\"RichEdit20A\"", 23 },
    { "\"Static\"", 24 },
    { "\"ListBox\"", 25 },
    { "\"msctls_updown32\"", 26 },

    { 0, 0 }
};

/*
IDD_CITO_DIALOG DIALOGEX 0, 0, 320, 200
STYLE DS_SETFONT | DS_MODALFRAME | WS_POPUP | WS_CAPTION | WS_SYSMENU
EXSTYLE WS_EX_APPWINDOW
CAPTION "cito"
FONT 8, "MS Sans Serif", 0, 0, 0x1
BEGIN
    DEFPUSHBUTTON   "OK",IDOK,260,7,50,14
    PUSHBUTTON      "Cancel",IDCANCEL,260,23,50,14
    DEFPUSHBUTTON   "Run",IDC_BUTTON1,7,62,50,14
    EDITTEXT        IDC_EDIT1,7,26,156,14,ES_AUTOHSCROLL
    PUSHBUTTON      "Button2",IDC_BUTTON2,186,68,50,14
END
*/

__declspec( dllexport ) char * get_res ()
{

    return ( (char *) Gdata );
}


long find ( char * p, struct fn * s )
{
    int i = 0;

    do {
         if ( strcmp ( p, s [i].txt ) == 0 )
             return ( s [i].v );
     } while ( s [++i].txt != 0 );
     return ( -1 );
}

char pos_code ( int i )
{
    if ( i > ('z' - 'a') )
        return 'A' + ( i - ('z' - 'a') );
    return i + 'a';
}

void save_pos ( int * ip )
{
    int i;
    char * p;
    
    for ( i= 0; i < 4; ++ i ) {
        p = strtok ( NULL, "," );
        if ( p == 0 )
            printf ( "Number missing line %i\n", Line ); 
        else
            ip [i] = atoi ( p );
//DPos += sprintf ( Data + DPos, " #%s# ! %i !  ", p, ip [i] );
//~ printf ( "%s ", p );
    }
}

long flag ( long j )
{
    char * p;
    long i;
    int f = 0;
    
    
    while ( p = strtok ( NULL, " |\n\r" ) ) {
        i = find ( p, Style ); 
        if ( i == -1 ) {
            if ( strchr ( p, ',' ) ) {  
                p = strtok ( p, " ,\n\r" );
                if ( p ) {
                    i = find ( p, Style ); 
                    if ( i != -1 ) {
                        j |= i;                           
                    }
                }
                if ( i != -1 )
                    if ( Widg [w].tstyle[0] == 0 )
                        strcpy ( Widg [w].tstyle, p );
                    else {
                        strcat ( Widg [w].tstyle, " | " );
                        strcat ( Widg [w].tstyle, p );
                    }
                return j;
            }
            printf ( "Unknown style %s\n", p );
        } else {
            if ( i == 0xff ) //NOT
                f = 1;
            else
                if ( f ) {
                    f = 0;
                    j &= ~i;
                } else 
                    j |= i;    
                if ( Widg [w].tstyle[0] == 0 )
                    strcpy ( Widg [w].tstyle, p );
                else {
                    strcat ( Widg [w].tstyle, " | " );
                    strcat ( Widg [w].tstyle, p );
                }
        }
        if ( strchr ( p, ',' ) != 0 )
            return j;
    }
    return j;
}


#ifdef DLL
__declspec( dllexport ) int conv_res ( char * fil )
#else
main ( int c, char * par [] )
#endif
{
    FILE * in;
    char s [300];
    char * p1, * p;
    int state = 0;
    int z, x, y, x1, y1, max_y, max_x, i;
    int style = WS_VISIBLE, exstyle;
    //~ int w = 0;

#ifndef DLL
    if ( c < 2 )
        return 0;

    if ( ( in = fopen ( par [1], "rt" ) ) == 0 ) {
        printf ( "Can't open input file\n" );
        return 0;
    }
#else
    if ( ( in = fopen ( fil + 4, "rt" ) ) == 0 ) {
        return 0;
    }
#endif

    Max_data = 30000;
    Data = malloc (  Max_data + 5000 );

    fgets ( s, sizeof ( s ), in );
    
    while ( ! feof ( in ) ) {
        ++ Line;
        p = strtok ( s, " \t\n\r" );
        if ( p ) {
            if ( (p [0] != '/') && (p [0] != '#') && p [0] ) {

                //~ if ( p1 ) {
    //~ printf ( "q!%s!\n", p );
                    //~ z = find ( p1, Cmd );
                //~ }
                switch ( state ) {
                    case 0:
                        p1 = strtok ( NULL, " \t" );
                        if ( p1 == 0 )
                            break;

    //printf ( "find !%s!%s!\n", p, p1 );
                        z = find ( p1, Cmd );
                        if ( z == 9 ) {
                            DPos += sprintf ( Data + DPos, "form %s ()\n", p );
                            strcpy ( Widg [w].text, "\"\"" );
                            save_pos ( Size );
                            state = 1;
                        } //else
                            //state = 99;
                        break;
                    case 1:
                        z = find ( p, Cmd );
    //printf ( "find-1 !%s!%i!\n", p, z );
                        switch ( z ) {
                            case 1:     //Style
                                style = flag (WS_VISIBLE);
                                exstyle = 0;
                                break;
                            case 12:    //exstyle
                                exstyle = flag (0);
                                break;
                            case 2:     //Caption
                                strcpy ( Widg [w].text, strtok ( NULL, ",\n\r" ) ); 
                                break;
                            case 14:    //Group
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, "," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE | BS_GROUPBOX);
                                Widg [w].exstyle = flag (0);
                                strcpy ( Widg [w].type, "GB" );
                                ++ w;
                                break;
                            case 13:    //Control
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p ); 
                                strcpy ( Widg [w].id, strtok ( NULL, "," ) );
                                Widg [w].style = 0;
                                switch ( find ( p1 = strtok ( NULL, " ," ), Cmd ) ) {
                                    case 20:    //"SysListView32"
                                        strcpy ( Widg [w].type, "LC" );
                                        break;
                                    case 21:    
                                        strcpy ( Widg [w].type, "BT" );
                                        Widg [w].style = flag ( WS_VISIBLE );
                                        break;
                                    case 22:    
                                        strcpy ( Widg [w].type, "TC" );
                                        break;
                                    case 23:    
                                        strcpy ( Widg [w].type, " class \"RichEdit20A\"" );
                                        break;
                                    case 24:        //static
                                        strcpy ( Widg [w].type, "TEXT" );
                                        break;
                                        break;
                                    case 25:        //List box
                                        strcpy ( Widg [w].type, "LB" );
                                        break;
                                    case 26:
                                        strcpy ( Widg [w].type, "UPDOWN" );
                                        break;

                                    default:
                                        DPos += sprintf ( Data + DPos, "Unknown CONTROL %s\n", p1 );
                                }
    //CONTROL         "List1",1000,"SysListView32",LVS_REPORT | LVS_NOSORTHEADER | WS_TABSTOP,0,0,425,220,WS_EX_CLIENTEDGE
                                if ( Widg [w].style == 0 )
                                    Widg [w].style = flag ( WS_BORDER | WS_VISIBLE);

                                save_pos ( Widg [w].pos );
                                Widg [w].exstyle = flag ( 0 );
                                ++ w;
                                break;
                            case 5:     //ICON
                            case 3:     //Font
                                break;
                            case 4:     //Begin
                                if ( exstyle )
                                    DPos += sprintf ( Data + DPos, "    layout %s  x2=%i y2=%i style=0x%x exstyle=0x%x ystep=%i xstep=%i\n", Widg [w].text, 
                                        Size [2], Size[3], style | DS_SETFONT, exstyle, Step_y, Step_x );
                                else
                                    DPos += sprintf ( Data + DPos, "    layout %s  x2=%i y2=%i style=0x%x ystep=%i xstep=%i\n", Widg [w].text, 
                                        Size [2], Size[3], style | DS_SETFONT, Step_y, Step_x );
                                break;
                            case 6:     //text
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, " ," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE);
                                //~ if ( Widg [w].style & 0x1000 )  // WS_EX_RIGHT
                                    //~ strcpy ( Widg [w].type, "TEXT" );
                                //~ else 
                                    strcpy ( Widg [w].type, "LT" );
                                ++ w;
                                break;
                            case 15:     //ctext
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, " ," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE | SS_CENTER);
                                strcpy ( Widg [w].type, "CT" );
                                ++ w;
                                break;
                            case 17:     //rtext
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, " ," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE | SS_RIGHT );
                                strcpy ( Widg [w].type, "TEXT" );
                                ++ w;
                                break;
                            case 7:     //Def butt
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, " ," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE | WS_TABSTOP);
                                Widg [w].exstyle = flag (0);
                                strcpy ( Widg [w].type, "BT" );
                                ++ w;
                                break;
                            case 11:     //butt
                                p = strtok ( NULL, "," );
                                while ( * p == ' ' )
                                    ++ p;
                                strcpy ( Widg [w].text, p );
                                strcpy ( Widg [w].id, strtok ( NULL, " ," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag (WS_VISIBLE | WS_TABSTOP);
                                Widg [w].exstyle = flag (0);                        
                                strcpy ( Widg [w].type, "BT" );
                                ++ w;
                                break;
                            case 10:     //Edit
                                strcpy ( Widg [w].text, "" );
                                strcpy ( Widg [w].id, strtok ( NULL, "," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag ( WS_VISIBLE | WS_BORDER | WS_TABSTOP);
                                Widg [w].exstyle = flag (0);
                                strcpy ( Widg [w].type, "EDIT" );
                                ++ w;
                                break;
                            case 16:
                                strcpy ( Widg [w].text, "" );
                                strcpy ( Widg [w].id, strtok ( NULL, "," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag ( WS_VISIBLE | WS_BORDER | WS_TABSTOP | WS_TABSTOP);
                                Widg [w].exstyle = flag (0);
                                strcpy ( Widg [w].type, "CB" );
                                ++ w;
                                break;
                            case 18:
                                strcpy ( Widg [w].text, "" );
                                strcpy ( Widg [w].id, strtok ( NULL, "," ) );
                                save_pos ( Widg [w].pos );
                                Widg [w].style = flag ( WS_VISIBLE | WS_BORDER | WS_TABSTOP);
                                Widg [w].exstyle = flag (0);
                                strcpy ( Widg [w].type, "LB" );
                                ++ w;
                                break;


                            case 8:     //End
                                for ( i = 0; i < sizeof ( Pos [0] ); ++ i )
                                    memset ( Pos [i], ' ', sizeof ( Pos [0] ) - 1 );
                                max_x = max_y = 0;
                                for ( i = 0; i < w; ++ i ) {
                                    y = Widg [i].pos [1] / Step_y;
                                    x = Widg [i].pos [0] / Step_x;
                                    y1 = (Widg [i].pos [1] + Widg [i].pos [3]) / Step_y;
                                    x1 = (Widg [i].pos [0] + Widg [i].pos [2]) / Step_x;        
                                    if ( y1 > max_y )
                                        max_y = y1;
                                    if ( x1 > max_x )
                                        max_x = x1;

                                    if ( (x < MAX_X) && (y1 < MAX_Y) ) {
                                        if ( Pos [y][x] != ' ' )
                                            -- x;
                                        if ( Pos [y1][x1] != ' ' )
                                            -- x1;
                                        Pos [y] [x] = pos_code ( i ); 
                                        Pos [y1] [x1] = pos_code ( i ); 
                                    } else
                                        DPos += sprintf ( Data + DPos, "max_x %i\n", x );
                                }
                                for ( i = 0; i <= max_y; ++ i ) {
                                    Pos [i][max_x + 1] = 0;
                                    DPos += sprintf ( Data + DPos, "%s\n", Pos [i] );
                                }
                                DPos += sprintf ( Data + DPos, "end\nfield\n" );
                                for ( i = 1; i < w; ++ i ) {
                                    if ( strcmp ( Widg [i].type, "BT" ) == 0 ) {
                                         if ( ((Widg [i].style & 0xf) == BS_AUTORADIOBUTTON) || ((Widg [i].style & 0xf) == BS_RADIOBUTTON) )
                                             strcpy ( Widg [i].type, "RB" );
                                        if ( ((Widg [i].style & 0xf) == BS_AUTOCHECKBOX) || ((Widg [i].style & 0xf) == BS_CHECKBOX) )
                                             strcpy ( Widg [i].type, "CHECK" );
                                    }
                                    if ( strcmp ( Widg [i].text , "\"\"" ) == 0 )
                                        Widg [i].text [0] = 0;
                                    if ( strcmp ( Widg [i].id, "IDC_STATIC" ) == 0 )
                                        Widg [i].id [0] = 0;
                                    DPos += sprintf ( Data + DPos, "%c: %s %s %s ", pos_code ( i ), Widg [i].id, Widg [i].type, Widg [i].text );
                                    if ( Widg [i].tstyle [0] )
                                        DPos += sprintf ( Data + DPos, "style = %s ", Widg [i].tstyle );
                                    if ( Widg [i].exstyle )
                                        DPos += sprintf ( Data + DPos, " exstyle = 0x%x ", Widg [i].exstyle );

                                    DPos += sprintf ( Data + DPos, " x1=%i y1=%i x2=%i y2=%i \n",
                                        Widg [i].pos [0],
                                        Widg [i].pos [1], 
                                        Widg [i].pos [2] + Widg [i].pos [0], 
                                        Widg [i].pos [3] + Widg [i].pos [1] ); 
                                }
                                DPos += sprintf ( Data + DPos, "end\n\n" );
                                w = state = 0;
                                break;
                            default:
                                DPos += sprintf ( Data + DPos, "cmd ??? %s\n", p );
                                
                        }
                        break;
                    case 99:
                        //skipp this block
                        z = find ( p, Cmd );
                        if ( strcmp ( p, "END" ) )
                            state = 0;
                        break;
 
                    default:
                        DPos += sprintf ( Data + DPos, "??\n" );
                }

            }
        }
        if ( DPos > (Max_data - 10000) ) {
            Max_data += 40000;
            Data = realloc ( Data, Max_data );
        }
        fgets ( s, sizeof ( s ), in );
    }
#if DLL
    Gdata = GlobalAlloc ( 0, DPos + sizeof ( struct str ));
    Gdata -> len = DPos;
    Data [DPos] = 0;
    strcpy ( & Gdata -> c, Data );
    free ( Data );
#else
    printf ( "%s\n", Data );
#endif
    return 1;
}

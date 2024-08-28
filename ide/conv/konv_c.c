#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <memory.h>


/*
    { "ifndef" )

    { "ifdef" )
    { "if" )

    { "endif" )

*/

// main ( int c, char * par [] )


//-----------  NOT SAFE ---------------


int Sort_data [1000];

struct data {
    char * h;
    char * src;
    char * sh;
} Data [1000];

int D_p;


struct str {
    int len;
    char c;
};

int sort_cmp ( const int * a1, const int * a2 )
{
    return ( _stricmp ( Data [*a1].sh + 4, Data [*a2].sh + 4 ) );
}  


void savestr ( int x, char * s )
{
    struct str ** p;
    int l;

    switch ( x ) {
        case 0:
            p = & (struct str ** ) Data[D_p].h;
            if ( ( l = strlen ( s ) ) != 0 )
                if ( s [l - 1] < 15 )
                    * ( s + l - 1 ) = 0;
            break;
        case 1:
            p = (struct str **) & Data[D_p].src;
            break;
        case 2:
            p = (struct str **) & Data[D_p].sh;
            break;
    }
    l = strlen ( s ) ;
    * p = GlobalAlloc ( 0, l + sizeof ( struct str ));
    (* p) -> len = l;
    strcpy ( & (* p) -> c, s );
    if ( x == 1 )
        D_p ++;
}

__declspec( dllexport ) int get_sort ()
{
    return Sort_data [D_p];
}

__declspec( dllexport ) char * get_def ()
{

    if ( Data [Sort_data [D_p]].h == 0 )
        return (char *) -1;

    return ( Data [Sort_data [D_p]].h );
}

__declspec( dllexport ) char * get_src ()
{

    if ( Data [Sort_data [D_p]].h == 0 )
        return (char *) -1;
    ++ D_p;

    return ( Data [Sort_data [D_p - 1]].src );
}

__declspec( dllexport ) char * get_short ()
{

    if ( Data [Sort_data [D_p]].sh == 0 )
        return (char *) -1;

    return ( Data [Sort_data [D_p]].sh );
}

__declspec( dllexport ) int main ( char * fil )
{
    FILE * in;
    char x [3][1000];
    char r [1000];
    char Sh_name [200];
    char * p1, * p, * s, * s1, * data;
    int len, max;
    int state = 0;
    int w = 0, f = 0;
    int ant_p = 0;
    int ant_x = 0, last_pos, l, i, j, old_state;
    D_p = 0;

    if ( ( in = fopen ( fil + 4, "rt" ) ) == 0 ) {
        return 0;
    }
    data = malloc ( 20000 );
    max = 20000 - 1000;
    len = 0;
    Sh_name [0] = 0;
    strcpy ( r, "Definition" );
    savestr ( 2, r );

    fgets ( s = & x [0][0], 1000, in );
    fgets ( & x [1][0], 1000, in );
    fgets ( & x [2][0], 1000, in );

    //~ while ( * s == ' ' || * s  == '\t' )
        //~ ++ s;
    l = strlen ( s );    
    
    while ( ! feof ( in ) ) {
        for ( i = 0; i < l; ++ i ) {
            switch ( state ) {
                case 11:
                    switch ( s [i] ) {
                        case '*':
                            if ( s [i + 1] == '/' )
                                state = old_state;
                            break;
                    }
                    break;

                case 10:
                    switch ( s [i] ) {
                        case '"':
                            state = old_state;
                            break;
                        case '\\':
                            ++ i;
                            break;
                    }
                    break;
                default:

                switch ( s [i] ) {
                    case '#':
                        //~ while ( * s == ' ' || * s  == '\t' )
                            //~ ++ s;

                        //~ if ( strncmp ( "ifndef" )

                        //~ if ( strncmp ( "ifdef" )
                        //~ if ( strncmp ( "if" )

                        //~ if ( strncmp ( "endif" )
                        break;
                    case '(':
                        if ( (ant_x == 0) && (ant_p == 0) ) {
                            s1 = & s [i]; 
                            -- s1;
                            while ( s1 != s && i ) {
                                if ( (* s1 != ' ') && (* s1 != '\t') )
                                    break;
                                -- s1;
                            }
                            p = s1 + 1;
                            while ( s1 != s ) {
                                if ( (* s1 == ' ') || (* s1 == '\t') ) {
                                    ++ s1;
                                    break;
                                }
                                -- s1;
                            }
                            j = p - s1;
                            strncpy ( Sh_name, s1, j ); 
                            Sh_name [j] = 0;
                    //~ printf ( "fn %s \n", s1 );
                        }
                        ++ ant_p;
                        break;

                    case '"':
                        old_state = state;
                        state = 10;
                        break;
                    case '/':
                        if ( s [i + 1] == '/' )
                            i = l;
                        else
                            if ( s [i + 1] == '*' ) {
                                old_state = state;
                                state = 11;
                            }
                        break;

                    case '\\':
                        ++ i;
                        break;
                    case ';':
                        state = 0;
                        break;
                    case ')':
                        if ( -- ant_p == 0 )
                            state = 1;
                        break;

                    case '{':
                        if ( (ant_x == 0) && (ant_p == 0) && (state == 1) ) {
                            if ( i < 6 )
                                data [last_pos] = 0;
        //~ printf ("-------------- start\n" );
                            savestr ( 0, r );
                            data [len] =0;  
                            savestr ( 1, data );

                            savestr ( 2, Sh_name ); //Next
 
                            //printf ( "%s ---\n%s\n", r, data );
                            len = 0;
        //~ printf ("-------------- end\n" );
      
                            if ( i < 6 ) {
                                strcpy ( data, x [0] );
                                len += strlen ( x [0] );
                                strcpy ( r, x [0] );
                            } else
                                strcpy ( r, x [1] );

                            state = 0;
                        }
                        ++ ant_x;
                        break;

                    case '}':
                        if ( -- ant_x == 0 ) {
                            state = 0;
                            ; //printf ("-------------- end\n" );
                        }
                        break;
                }
            }
        }
        if ( (len + l) > max ) {
            max += 20000;
            data = realloc ( data, max );
        }
        strncpy ( data + len, s, l );
        last_pos = len;
        len += l;

        if ( f == 0 ) {
            s = x [1];
            f = 1;
        } else {
            strcpy ( x [0], x [1] );
            strcpy ( x [1], x [2] );
            fgets ( x [2], sizeof ( x ), in );
            l = strlen ( s );    
        }
    }
    if ( len ) {
        savestr ( 0, r );
        savestr ( 2, Sh_name );
        strncpy ( data + len, s, l );
        len += l;
        data [len] = 0;
        savestr ( 1, data );
    }
    Data[D_p].h = 0;
    free ( data );
    
    for (i = 0; i <= D_p; ++ i )
        Sort_data [i] = i;

    qsort ( (void *) Sort_data, (size_t) D_p, sizeof (int), sort_cmp );
    D_p = 0;
    return 1;
}

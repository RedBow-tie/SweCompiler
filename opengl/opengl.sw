
#if ! _WIN64
#error "This compiler doesn't support OpenGL. Use 64 bits version."
#endif

int Error_mode, Wiremode

#define GL_BYTE                           0x1400
#define GL_UNSIGNED_BYTE                  0x1401
#define GL_SHORT                          0x1402
#define GL_UNSIGNED_SHORT                 0x1403
#define GL_INT                            0x1404
#define GL_UNSIGNED_INT                   0x1405
#define GL_FLOAT                          0x1406
#define GL_2_BYTES                        0x1407
#define GL_3_BYTES                        0x1408
#define GL_4_BYTES                        0x1409
#define GL_DOUBLE                         0x140A

/* BeginMode */
#define GL_POINTS                         0x0000
#define GL_LINES                          0x0001
#define GL_LINE_LOOP                      0x0002
#define GL_LINE_STRIP                     0x0003
#define GL_TRIANGLES                      0x0004
#define GL_TRIANGLE_STRIP                 0x0005
#define GL_TRIANGLE_FAN                   0x0006
#define GL_QUADS                          0x0007
#define GL_QUAD_STRIP                     0x0008
#define GL_POLYGON                        0x0009
                    
/* AttribMask */
#define GL_CURRENT_BIT                    0x00000001
#define GL_POINT_BIT                      0x00000002
#define GL_LINE_BIT                       0x00000004
#define GL_POLYGON_BIT                    0x00000008
#define GL_POLYGON_STIPPLE_BIT            0x00000010
#define GL_PIXEL_MODE_BIT                 0x00000020
#define GL_LIGHTING_BIT                   0x00000040
#define GL_FOG_BIT                        0x00000080
#define GL_DEPTH_BUFFER_BIT               0x00000100
#define GL_ACCUM_BUFFER_BIT               0x00000200
#define GL_STENCIL_BUFFER_BIT             0x00000400
#define GL_VIEWPORT_BIT                   0x00000800
#define GL_TRANSFORM_BIT                  0x00001000
#define GL_ENABLE_BIT                     0x00002000
#define GL_COLOR_BUFFER_BIT               0x00004000
#define GL_HINT_BIT                       0x00008000
#define GL_EVAL_BIT                       0x00010000
#define GL_LIST_BIT                       0x00020000
#define GL_TEXTURE_BIT                    0x00040000
#define GL_SCISSOR_BIT                    0x00080000
#define GL_ALL_ATTRIB_BITS                0x000fffff

/* MatrixMode */
#define GL_MODELVIEW                      0x1700
#define GL_PROJECTION                     0x1701
#define GL_TEXTURE                        0x1702

/* RenderingMode */
#define GL_RENDER                         0x1C00
#define GL_FEEDBACK                       0x1C01
#define GL_SELECT                         0x1C02

/* ShadingModel */
#define GL_FLAT                           0x1D00
#define GL_SMOOTH                         0x1D01

/* DrawBufferMode */
#define GL_NONE                           0
#define GL_FRONT_LEFT                     0x0400
#define GL_FRONT_RIGHT                    0x0401
#define GL_BACK_LEFT                      0x0402
#define GL_BACK_RIGHT                     0x0403
#define GL_FRONT                          0x0404
#define GL_BACK                           0x0405
#define GL_LEFT                           0x0406
#define GL_RIGHT                          0x0407
#define GL_FRONT_AND_BACK                 0x0408
#define GL_AUX0                           0x0409
#define GL_AUX1                           0x040A
#define GL_AUX2                           0x040B
#define GL_AUX3                           0x040C

/* MaterialParameter */
#define GL_EMISSION                       0x1600
#define GL_SHININESS                      0x1601
#define GL_AMBIENT_AND_DIFFUSE            0x1602
#define GL_COLOR_INDEXES                  0x1603
/*      GL_AMBIENT */
/*      GL_DIFFUSE */
/*      GL_SPECULAR */

/* MatrixMode */
#define GL_MODELVIEW                      0x1700
#define GL_PROJECTION                     0x1701
#define GL_TEXTURE                        0x1702


/* LightName */
#define GL_LIGHT0                         0x4000
#define GL_LIGHT1                         0x4001
#define GL_LIGHT2                         0x4002
#define GL_LIGHT3                         0x4003
#define GL_LIGHT4                         0x4004
#define GL_LIGHT5                         0x4005
#define GL_LIGHT6                         0x4006
#define GL_LIGHT7                         0x4007

/* LightParameter */
#define GL_AMBIENT                        0x1200
#define GL_DIFFUSE                        0x1201
#define GL_SPECULAR                       0x1202
#define GL_POSITION                       0x1203
#define GL_SPOT_DIRECTION                 0x1204
#define GL_SPOT_EXPONENT                  0x1205
#define GL_SPOT_CUTOFF                    0x1206
#define GL_CONSTANT_ATTENUATION           0x1207
#define GL_LINEAR_ATTENUATION             0x1208
#define GL_QUADRATIC_ATTENUATION          0x1209


/* GetTarget */
#define GL_CURRENT_COLOR                  0x0B00
#define GL_CURRENT_INDEX                  0x0B01
#define GL_CURRENT_NORMAL                 0x0B02
#define GL_CURRENT_TEXTURE_COORDS         0x0B03
#define GL_CURRENT_RASTER_COLOR           0x0B04
#define GL_CURRENT_RASTER_INDEX           0x0B05
#define GL_CURRENT_RASTER_TEXTURE_COORDS  0x0B06
#define GL_CURRENT_RASTER_POSITION        0x0B07
#define GL_CURRENT_RASTER_POSITION_VALID  0x0B08
#define GL_CURRENT_RASTER_DISTANCE        0x0B09
#define GL_POINT_SMOOTH                   0x0B10
#define GL_POINT_SIZE                     0x0B11
#define GL_POINT_SIZE_RANGE               0x0B12
#define GL_POINT_SIZE_GRANULARITY         0x0B13
#define GL_LINE_SMOOTH                    0x0B20
#define GL_LINE_WIDTH                     0x0B21
#define GL_LINE_WIDTH_RANGE               0x0B22
#define GL_LINE_WIDTH_GRANULARITY         0x0B23
#define GL_LINE_STIPPLE                   0x0B24
#define GL_LINE_STIPPLE_PATTERN           0x0B25
#define GL_LINE_STIPPLE_REPEAT            0x0B26
#define GL_LIST_MODE                      0x0B30
#define GL_MAX_LIST_NESTING               0x0B31
#define GL_LIST_BASE                      0x0B32
#define GL_LIST_INDEX                     0x0B33
#define GL_POLYGON_MODE                   0x0B40
#define GL_POLYGON_SMOOTH                 0x0B41
#define GL_POLYGON_STIPPLE                0x0B42
#define GL_EDGE_FLAG                      0x0B43
#define GL_CULL_FACE                      0x0B44
#define GL_CULL_FACE_MODE                 0x0B45
#define GL_FRONT_FACE                     0x0B46
#define GL_LIGHTING                       0x0B50
#define GL_LIGHT_MODEL_LOCAL_VIEWER       0x0B51
#define GL_LIGHT_MODEL_TWO_SIDE           0x0B52
#define GL_LIGHT_MODEL_AMBIENT            0x0B53
#define GL_SHADE_MODEL                    0x0B54
#define GL_COLOR_MATERIAL_FACE            0x0B55
#define GL_COLOR_MATERIAL_PARAMETER       0x0B56
#define GL_COLOR_MATERIAL                 0x0B57
#define GL_FOG                            0x0B60
#define GL_FOG_INDEX                      0x0B61
#define GL_FOG_DENSITY                    0x0B62
#define GL_FOG_START                      0x0B63
#define GL_FOG_END                        0x0B64
#define GL_FOG_MODE                       0x0B65
#define GL_FOG_COLOR                      0x0B66
#define GL_DEPTH_RANGE                    0x0B70
#define GL_DEPTH_TEST                     0x0B71
#define GL_DEPTH_WRITEMASK                0x0B72
#define GL_DEPTH_CLEAR_VALUE              0x0B73
#define GL_DEPTH_FUNC                     0x0B74
#define GL_ACCUM_CLEAR_VALUE              0x0B80
#define GL_STENCIL_TEST                   0x0B90
#define GL_STENCIL_CLEAR_VALUE            0x0B91
#define GL_STENCIL_FUNC                   0x0B92
#define GL_STENCIL_VALUE_MASK             0x0B93
#define GL_STENCIL_FAIL                   0x0B94
#define GL_STENCIL_PASS_DEPTH_FAIL        0x0B95
#define GL_STENCIL_PASS_DEPTH_PASS        0x0B96
#define GL_STENCIL_REF                    0x0B97
#define GL_STENCIL_WRITEMASK              0x0B98
#define GL_MATRIX_MODE                    0x0BA0
#define GL_NORMALIZE                      0x0BA1
#define GL_VIEWPORT                       0x0BA2
#define GL_MODELVIEW_STACK_DEPTH          0x0BA3
#define GL_PROJECTION_STACK_DEPTH         0x0BA4
#define GL_TEXTURE_STACK_DEPTH            0x0BA5
#define GL_MODELVIEW_MATRIX               0x0BA6
#define GL_PROJECTION_MATRIX              0x0BA7
#define GL_TEXTURE_MATRIX                 0x0BA8
#define GL_ATTRIB_STACK_DEPTH             0x0BB0
#define GL_CLIENT_ATTRIB_STACK_DEPTH      0x0BB1
#define GL_ALPHA_TEST                     0x0BC0
#define GL_ALPHA_TEST_FUNC                0x0BC1
#define GL_ALPHA_TEST_REF                 0x0BC2
#define GL_DITHER                         0x0BD0
#define GL_BLEND_DST                      0x0BE0
#define GL_BLEND_SRC                      0x0BE1
#define GL_BLEND                          0x0BE2
#define GL_LOGIC_OP_MODE                  0x0BF0
#define GL_INDEX_LOGIC_OP                 0x0BF1
#define GL_COLOR_LOGIC_OP                 0x0BF2
#define GL_AUX_BUFFERS                    0x0C00
#define GL_DRAW_BUFFER                    0x0C01
#define GL_READ_BUFFER                    0x0C02
#define GL_SCISSOR_BOX                    0x0C10
#define GL_SCISSOR_TEST                   0x0C11
#define GL_INDEX_CLEAR_VALUE              0x0C20
#define GL_INDEX_WRITEMASK                0x0C21
#define GL_COLOR_CLEAR_VALUE              0x0C22
#define GL_COLOR_WRITEMASK                0x0C23
#define GL_INDEX_MODE                     0x0C30
#define GL_RGBA_MODE                      0x0C31
#define GL_DOUBLEBUFFER                   0x0C32
#define GL_STEREO                         0x0C33
#define GL_RENDER_MODE                    0x0C40
#define GL_PERSPECTIVE_CORRECTION_HINT    0x0C50
#define GL_POINT_SMOOTH_HINT              0x0C51
#define GL_LINE_SMOOTH_HINT               0x0C52
#define GL_POLYGON_SMOOTH_HINT            0x0C53
#define GL_FOG_HINT                       0x0C54
#define GL_TEXTURE_GEN_S                  0x0C60
#define GL_TEXTURE_GEN_T                  0x0C61
#define GL_TEXTURE_GEN_R                  0x0C62
#define GL_TEXTURE_GEN_Q                  0x0C63
#define GL_PIXEL_MAP_I_TO_I               0x0C70
#define GL_PIXEL_MAP_S_TO_S               0x0C71
#define GL_PIXEL_MAP_I_TO_R               0x0C72
#define GL_PIXEL_MAP_I_TO_G               0x0C73
#define GL_PIXEL_MAP_I_TO_B               0x0C74
#define GL_PIXEL_MAP_I_TO_A               0x0C75
#define GL_PIXEL_MAP_R_TO_R               0x0C76
#define GL_PIXEL_MAP_G_TO_G               0x0C77
#define GL_PIXEL_MAP_B_TO_B               0x0C78
#define GL_PIXEL_MAP_A_TO_A               0x0C79
#define GL_PIXEL_MAP_I_TO_I_SIZE          0x0CB0
#define GL_PIXEL_MAP_S_TO_S_SIZE          0x0CB1
#define GL_PIXEL_MAP_I_TO_R_SIZE          0x0CB2
#define GL_PIXEL_MAP_I_TO_G_SIZE          0x0CB3
#define GL_PIXEL_MAP_I_TO_B_SIZE          0x0CB4
#define GL_PIXEL_MAP_I_TO_A_SIZE          0x0CB5
#define GL_PIXEL_MAP_R_TO_R_SIZE          0x0CB6
#define GL_PIXEL_MAP_G_TO_G_SIZE          0x0CB7
#define GL_PIXEL_MAP_B_TO_B_SIZE          0x0CB8
#define GL_PIXEL_MAP_A_TO_A_SIZE          0x0CB9
#define GL_UNPACK_SWAP_BYTES              0x0CF0
#define GL_UNPACK_LSB_FIRST               0x0CF1
#define GL_UNPACK_ROW_LENGTH              0x0CF2
#define GL_UNPACK_SKIP_ROWS               0x0CF3
#define GL_UNPACK_SKIP_PIXELS             0x0CF4
#define GL_UNPACK_ALIGNMENT               0x0CF5
#define GL_PACK_SWAP_BYTES                0x0D00
#define GL_PACK_LSB_FIRST                 0x0D01
#define GL_PACK_ROW_LENGTH                0x0D02
#define GL_PACK_SKIP_ROWS                 0x0D03
#define GL_PACK_SKIP_PIXELS               0x0D04
#define GL_PACK_ALIGNMENT                 0x0D05
#define GL_MAP_COLOR                      0x0D10
#define GL_MAP_STENCIL                    0x0D11
#define GL_INDEX_SHIFT                    0x0D12
#define GL_INDEX_OFFSET                   0x0D13
#define GL_RED_SCALE                      0x0D14
#define GL_RED_BIAS                       0x0D15
#define GL_ZOOM_X                         0x0D16
#define GL_ZOOM_Y                         0x0D17
#define GL_GREEN_SCALE                    0x0D18
#define GL_GREEN_BIAS                     0x0D19
#define GL_BLUE_SCALE                     0x0D1A
#define GL_BLUE_BIAS                      0x0D1B
#define GL_ALPHA_SCALE                    0x0D1C
#define GL_ALPHA_BIAS                     0x0D1D
#define GL_DEPTH_SCALE                    0x0D1E
#define GL_DEPTH_BIAS                     0x0D1F
#define GL_MAX_EVAL_ORDER                 0x0D30
#define GL_MAX_LIGHTS                     0x0D31
#define GL_MAX_CLIP_PLANES                0x0D32
#define GL_MAX_TEXTURE_SIZE               0x0D33
#define GL_MAX_PIXEL_MAP_TABLE            0x0D34
#define GL_MAX_ATTRIB_STACK_DEPTH         0x0D35
#define GL_MAX_MODELVIEW_STACK_DEPTH      0x0D36
#define GL_MAX_NAME_STACK_DEPTH           0x0D37
#define GL_MAX_PROJECTION_STACK_DEPTH     0x0D38
#define GL_MAX_TEXTURE_STACK_DEPTH        0x0D39
#define GL_MAX_VIEWPORT_DIMS              0x0D3A
#define GL_MAX_CLIENT_ATTRIB_STACK_DEPTH  0x0D3B
#define GL_SUBPIXEL_BITS                  0x0D50
#define GL_INDEX_BITS                     0x0D51
#define GL_RED_BITS                       0x0D52
#define GL_GREEN_BITS                     0x0D53
#define GL_BLUE_BITS                      0x0D54
#define GL_ALPHA_BITS                     0x0D55
#define GL_DEPTH_BITS                     0x0D56
#define GL_STENCIL_BITS                   0x0D57
#define GL_ACCUM_RED_BITS                 0x0D58
#define GL_ACCUM_GREEN_BITS               0x0D59
#define GL_ACCUM_BLUE_BITS                0x0D5A
#define GL_ACCUM_ALPHA_BITS               0x0D5B
#define GL_NAME_STACK_DEPTH               0x0D70
#define GL_AUTO_NORMAL                    0x0D80
#define GL_MAP1_COLOR_4                   0x0D90
#define GL_MAP1_INDEX                     0x0D91
#define GL_MAP1_NORMAL                    0x0D92
#define GL_MAP1_TEXTURE_COORD_1           0x0D93
#define GL_MAP1_TEXTURE_COORD_2           0x0D94
#define GL_MAP1_TEXTURE_COORD_3           0x0D95
#define GL_MAP1_TEXTURE_COORD_4           0x0D96
#define GL_MAP1_VERTEX_3                  0x0D97
#define GL_MAP1_VERTEX_4                  0x0D98
#define GL_MAP2_COLOR_4                   0x0DB0
#define GL_MAP2_INDEX                     0x0DB1
#define GL_MAP2_NORMAL                    0x0DB2
#define GL_MAP2_TEXTURE_COORD_1           0x0DB3
#define GL_MAP2_TEXTURE_COORD_2           0x0DB4
#define GL_MAP2_TEXTURE_COORD_3           0x0DB5
#define GL_MAP2_TEXTURE_COORD_4           0x0DB6
#define GL_MAP2_VERTEX_3                  0x0DB7
#define GL_MAP2_VERTEX_4                  0x0DB8
#define GL_MAP1_GRID_DOMAIN               0x0DD0
#define GL_MAP1_GRID_SEGMENTS             0x0DD1
#define GL_MAP2_GRID_DOMAIN               0x0DD2
#define GL_MAP2_GRID_SEGMENTS             0x0DD3
#define GL_TEXTURE_1D                     0x0DE0
#define GL_TEXTURE_2D                     0x0DE1
#define GL_FEEDBACK_BUFFER_POINTER        0x0DF0
#define GL_FEEDBACK_BUFFER_SIZE           0x0DF1
#define GL_FEEDBACK_BUFFER_TYPE           0x0DF2
#define GL_SELECTION_BUFFER_POINTER       0x0DF3
#define GL_SELECTION_BUFFER_SIZE          0x0DF4

#define GL_BUFFER_SIZE                    0x8764
#define GL_BUFFER_USAGE                   0x8765
#define GL_QUERY_COUNTER_BITS             0x8864
#define GL_CURRENT_QUERY                  0x8865
#define GL_QUERY_RESULT                   0x8866
#define GL_QUERY_RESULT_AVAILABLE         0x8867
#define GL_ARRAY_BUFFER                   0x8892
#define GL_ELEMENT_ARRAY_BUFFER           0x8893
#define GL_ARRAY_BUFFER_BINDING           0x8894
#define GL_ELEMENT_ARRAY_BUFFER_BINDING   0x8895
#define GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING 0x889F
#define GL_READ_ONLY                      0x88B8
#define GL_WRITE_ONLY                     0x88B9
#define GL_READ_WRITE                     0x88BA
#define GL_BUFFER_ACCESS                  0x88BB
#define GL_BUFFER_MAPPED                  0x88BC
#define GL_BUFFER_MAP_POINTER             0x88BD
#define GL_STREAM_DRAW                    0x88E0
#define GL_STREAM_READ                    0x88E1
#define GL_STREAM_COPY                    0x88E2
#define GL_STATIC_DRAW                    0x88E4
#define GL_STATIC_READ                    0x88E5
#define GL_STATIC_COPY                    0x88E6
#define GL_DYNAMIC_DRAW                   0x88E8
#define GL_DYNAMIC_READ                   0x88E9
#define GL_DYNAMIC_COPY                   0x88EA
#define GL_SAMPLES_PASSED                 0x8914
#define GL_SRC1_ALPHA                     0x8589
#define GL_VERTEX_ARRAY_BUFFER_BINDING    0x8896
#define GL_NORMAL_ARRAY_BUFFER_BINDING    0x8897
#define GL_COLOR_ARRAY_BUFFER_BINDING     0x8898
#define GL_INDEX_ARRAY_BUFFER_BINDING     0x8899
#define GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING 0x889A
#define GL_EDGE_FLAG_ARRAY_BUFFER_BINDING 0x889B
#define GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING 0x889C
#define GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING 0x889D
#define GL_WEIGHT_ARRAY_BUFFER_BINDING    0x889E
#define GL_FOG_COORD_SRC                  0x8450
#define GL_FOG_COORD                      0x8451
#define GL_CURRENT_FOG_COORD              0x8453
#define GL_FOG_COORD_ARRAY_TYPE           0x8454
#define GL_FOG_COORD_ARRAY_STRIDE         0x8455
#define GL_FOG_COORD_ARRAY_POINTER        0x8456
#define GL_FOG_COORD_ARRAY                0x8457
#define GL_FOG_COORD_ARRAY_BUFFER_BINDING 0x889D
#define GL_SRC0_RGB                       0x8580
#define GL_SRC1_RGB                       0x8581
#define GL_SRC2_RGB                       0x8582
#define GL_SRC0_ALPHA                     0x8588
#define GL_SRC2_ALPHA                     0x858A

/* vertex_array */
#define GL_VERTEX_ARRAY                   0x8074
#define GL_NORMAL_ARRAY                   0x8075
#define GL_COLOR_ARRAY                    0x8076
#define GL_INDEX_ARRAY                    0x8077
#define GL_TEXTURE_COORD_ARRAY            0x8078
#define GL_EDGE_FLAG_ARRAY                0x8079
#define GL_VERTEX_ARRAY_SIZE              0x807A
#define GL_VERTEX_ARRAY_TYPE              0x807B
#define GL_VERTEX_ARRAY_STRIDE            0x807C
#define GL_NORMAL_ARRAY_TYPE              0x807E
#define GL_NORMAL_ARRAY_STRIDE            0x807F
#define GL_COLOR_ARRAY_SIZE               0x8081
#define GL_COLOR_ARRAY_TYPE               0x8082
#define GL_COLOR_ARRAY_STRIDE             0x8083
#define GL_INDEX_ARRAY_TYPE               0x8085
#define GL_INDEX_ARRAY_STRIDE             0x8086
#define GL_TEXTURE_COORD_ARRAY_SIZE       0x8088
#define GL_TEXTURE_COORD_ARRAY_TYPE       0x8089
#define GL_TEXTURE_COORD_ARRAY_STRIDE     0x808A
#define GL_EDGE_FLAG_ARRAY_STRIDE         0x808C
#define GL_VERTEX_ARRAY_POINTER           0x808E
#define GL_NORMAL_ARRAY_POINTER           0x808F
#define GL_COLOR_ARRAY_POINTER            0x8090
#define GL_INDEX_ARRAY_POINTER            0x8091
#define GL_TEXTURE_COORD_ARRAY_POINTER    0x8092
#define GL_EDGE_FLAG_ARRAY_POINTER        0x8093
#define GL_V2F                            0x2A20
#define GL_V3F                            0x2A21
#define GL_C4UB_V2F                       0x2A22
#define GL_C4UB_V3F                       0x2A23
#define GL_C3F_V3F                        0x2A24
#define GL_N3F_V3F                        0x2A25
#define GL_C4F_N3F_V3F                    0x2A26
#define GL_T2F_V3F                        0x2A27
#define GL_T4F_V4F                        0x2A28
#define GL_T2F_C4UB_V3F                   0x2A29
#define GL_T2F_C3F_V3F                    0x2A2A
#define GL_T2F_N3F_V3F                    0x2A2B
#define GL_T2F_C4F_N3F_V3F                0x2A2C
#define GL_T4F_C4F_N3F_V4F                0x2A2D


gldll glGenBuffers ( int, long ); 
gldll glBindBuffer ( int, int )
gldll glBufferData ( int, int, int, int )
gldll glDeleteBuffers ( int, ptr )
gldll glEnableVertexAttribArray ( int )
gldll glVertexAttribPointer ( int, int, int, int, int, int )
gldll glDrawArrays ( int, int, int )
gldll glDrawElements ( int, int, int, ptr )
gldll glDisableVertexAttribArray ( int )

gldll gluOrtho2D ( double, double, double, double )
gldll glBegin ( int )
gldll glEnd ()
gldll glClear ( int )
gldll glColor3f ( float, float, float )
gldll glVertex3f ( float, float, float )
gldll glViewport (int,int,int,int);
gldll glRotatef ( float,float,float,float)
gldll glVertex2f ( float, float )
gldll glLoadIdentity ()

gldll glMatrixMode ( int )
gldll glShadeModel ( int );
gldll glClearColor ( float, float, float, float )
gldll glLightfv ( int, int, ptr )
gldll glEnable ( int )
gldll glRotated ( double, double, double, double )

gldll glMaterialfv ( int, int, ptr )
gldll glTranslated ( double, double, double )
gldll glPushMatrix ()
gldll glPopMatrix ()

gldll glOrtho ( double,double,double,double,double,double )
gldll glFlush ()

gldll glVertexPointer ( int, int, int, ptr)
gldll glEnableClientState ( int )
gldll glDisableClientState ( int )
gldll glNormalPointer ( int, int, ptr )
gldll glTexCoordPointer ( int, int, int, ptr ) 

gldll init1 ()
gldll display ()
gldll glScalef ( float,float, float)
gldll glTranslatef ( float,float, float)



#include "glut.swh"
//~ #include "car.l"

float ang

func renderBox()

   glLoadIdentity();
   ang = ang + 0.2
   glRotatef (ang, 0.0f, 0.0f, 1.0f);

   glBegin (GL_POLYGON);
      glColor3f (1.0f, 0.0f, 0.0f );
      glVertex2f ( -150.0f, -150.0f );
      glColor3f ( 1.0f, 1.0f, 0.0f );
      glVertex2f ( 150.0f, -150.0f );
      glColor3f ( 0.0f, 0.0f, 1.0f );
      glVertex2f ( 150.0f, 150.0f );
      glColor3f ( 0.0f, 1.0f, 1.0f );
      glVertex2f ( -150.0f, 150.0f );
   glEnd();
end


int f, Start


form main ()
    layout "OpenGL Demo"  sysmenu 
a                                                                                        














                                            a
end
pre 
   if ( load_dll ( "opengl32.dll" ) == 0 ) 
      stop ( "can't load opengl32.dll" )
      return 0
   end

   if ( load_dll ( "glu32.dll" ) == 0 ) 
      stop ( "can't load opengl32.dll" )
   end

	light ()
	viewport ()
	//~ car ()

   .timer ( 1, 20 )   //50Hz
end
field
	on_close ()
		light.close ( 0 )
		viewport.close ( 0 )
		.timer ( 1, 0 )
		sleep ( 200 )
	end

	on_timer ( int t )
		if ( Error_mode )
			.timer ( 1, 0 )
			return
		end
		light.repaint ( I_OPENGL )
		viewport.repaint ( I_OPENGL )
		//~ car.repaint ( I_OPENGL )
	end

a: I_OPENGL opengl 
	paint ( cre x ) 

		if ( f == 0 ) 
			glMatrixMode (GL_MODELVIEW /* GL_TEXTURE GL_PROJECTION*/);
			glShadeModel(GL_SMOOTH);
			f = 1;
		end

        glBegin(GL_TRIANGLES);
            glColor3f(1.f, 0.f, 0.f);
            glVertex3f(-0.6f, -0.4f, 0.f);
            glColor3f(0.f, 1.f, 0.f);
            glVertex3f(0.6f, -0.4f, 0.f);
            glColor3f(0.f, 0.f, 1.f);
            glVertex3f(0.f, 0.6f, 0.f);
        glEnd();
	end
end

form viewport (), nowait
  int f
    layout "Viewport" sysmenu 
a                                                                   














                                               a
end
field
a: I_OPENGL OpenGL 

	paint ( cre x ) 
		if ( f == 0 ) 
			glMatrixMode (GL_MODELVIEW /* GL_TEXTURE GL_PROJECTION*/);
			glShadeModel(GL_SMOOTH);
			f = 1;
		end

		glClear ( GL_COLOR_BUFFER_BIT );

		glViewport (200, 200, 200, 200);
		renderBox();

		glViewport (0,200, 200, 200);
		renderBox();

		glViewport (0, 0, 400, 200);
		renderBox();

		glViewport (100, 100, 200, 200);
		renderBox();

		glMatrixMode (GL_PROJECTION);
		glLoadIdentity ();
		gluOrtho2D (-200, 200, -200, 200);
		glMatrixMode (GL_MODELVIEW);
    
	end
end

form light (), nowait
    int f
    float angObj   = 1.30;
    float angLight = 3.4f;

    float mat_specular [] =  1, 1, 1, 1 
    float mat_shininess [] =  10 ;

    float light_0_position [] =  1, 1, 1, 0
    float light_0_difuse[]   =  1, 0, 0   //RED
    float light_0_specular[] =  0, 0, 1   //WHITE
    float light_0_ambient[]  =  0.2, 0.2, 0.2 ;

    float light_1_position[] = 1, 1, 1, 0
    float light_1_difuse[]   = 0, 1, 0   //GREEN
    float light_1_specular[] = 1, 1, 1   //WHITE
    float light_1_ambient[]  =  0.2, 0.2, 0.2 

layout "Light" sysmenu 
d          d
a                                                                    






















                                                                a
end

field
d: T_WIRE TB "Wiremode"
	select
		Wiremode = .checked ( T_WIRE )
	end

a: I_OPENGL OpenGL 
	paint ( cre x ) 
		if ( Error_mode )
			return
		end
		onerror 
			Error_mode = true
			.timer ( 1, 0 )
		end

#if 0
		This is copied from Microsofts OpenGL-Demo
/**
 * Programa para ilustrar:
 *  - Uso da Material
 *  - Gouraud Shading
 *  - Projecao ortografica
 *
 * Author: Cesar Tadeu Pozzer <pozzer@inf.ufsm.br, pozzer3@gmail.com>, UFSM - 15/06/2007
 * Contributions: Fernando Bevilacqua <fernando.bevilacqua@uffs.edu.br>
 */
#endif

		if ( f == 0 ) 
			f = 1
			glClearColor (0.0f, 0.0f, 0.0f, 0.0f);
			gluOrtho2D (-400, 400, -400, 400);

			glShadeModel (GL_SMOOTH)

			glMaterialfv(GL_FRONT, GL_SPECULAR, & mat_specular)
			glMaterialfv(GL_FRONT, GL_SHININESS, & mat_shininess);

			glLightfv(GL_LIGHT0, GL_POSITION, & light_0_position);
			glLightfv(GL_LIGHT0, GL_DIFFUSE,  & light_0_difuse);
			glLightfv(GL_LIGHT0, GL_SPECULAR, & light_0_specular);
			glLightfv(GL_LIGHT0, GL_AMBIENT,  & light_0_ambient);

			glLightfv(GL_LIGHT1, GL_POSITION, & light_1_position);
			glLightfv(GL_LIGHT1, GL_DIFFUSE,  & light_1_difuse);
			glLightfv(GL_LIGHT1, GL_SPECULAR, & light_1_specular);
			glLightfv(GL_LIGHT1, GL_AMBIENT,  & light_1_ambient);

			glEnable(GL_LIGHTING);
			glEnable(GL_LIGHT0);
			glEnable(GL_LIGHT1);

			glEnable(GL_DEPTH_TEST);
			glViewport(0, 0, 600, 600);
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();
			glOrtho (-10, 10, -10,10, -10.0, 10.0);

			glMatrixMode(GL_MODELVIEW);
			glLoadIdentity();
		end

		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glLoadIdentity();

		glPushMatrix();
		glTranslated(4,0,0);
		glRotated(angObj+=0.8, 1, 1, 1);
		fghCube (5.0, Wiremode);
		glPopMatrix();

		glPushMatrix();
		glTranslated(-4,0,0);
		glRotated(angObj+=0.4, 1, 1, Wiremode);
		fghSphere (3.0, 40, 16, Wiremode);
		glPopMatrix();

		light_0_position[0] = cos(angLight)*9; //x
		light_0_position[1] = sin(angLight)*9; //y
		light_0_position[2] = 0; //z
		light_0_position[3] = 0; //w
		angLight += 0.004;

		light_1_position[0] = cos(angLight/2.2)*9; //x
		light_1_position[1] = sin(angLight/2.2)*9; //y
		light_1_position[2] = 0; //z
		light_1_position[3] = 0; //w


		glPushMatrix();
		glTranslated(100,0,1000);
		glLightfv(GL_LIGHT0, GL_POSITION, & light_0_position);
		glLightfv(GL_LIGHT1, GL_POSITION, & light_1_position);
		glPopMatrix();

		glTranslated(light_0_position[0], light_0_position[1], light_0_position[2]);
		fghSphere(1.0, 40, 16, Wiremode);

		glLoadIdentity();
		glTranslated(light_1_position[0], light_1_position[1], light_1_position[2]);
		fghSphere(1.0f, 20, 16, Wiremode);

		glFlush( )
	end
end


//-----------------------------------------------

#if 0

func draw2DHeadlights() 
   glPushMatrix();
   glBegin(GL_LINE_STRIP) //CAR HEADLIGHT
   double angle  // TO MODIFY THE ANGLE OF THE LINE JUST CHANGE THE "90" BELLOW
   double rad
   for (angle = 0.0f; angle <= 90; angle += 0.01f)  // BASICLY MAKES AN 90 DEGREE LINE 
		rad = M_PI * angle / 180	//SPECIAL THANKS TO -> Clickmit Wg
		glVertex3f(0.75f + 0.125f * cos(rad), 0.225f + 0.125f * sin(rad), 0.0f) // stackoverflow.com/questions/10570359/how-do-i-draw-an-half-circle-in-opengl/13206574
   }//CAR HEADLIGHT
   glEnd();
   glPopMatrix();
}


func car2D()  //CREATES A 2D CAR
   double i

	glPushMatrix();
	glColor3f(1, 0, 0);

	glPushMatrix();
	glTranslated(0.5, 0, 0)	//FRONT WHEEL
	glScalef(0.25f, 0.25f, 0);
	glBegin(GL_LINE_STRIP)	//NUMBER OF VORTEXS BELLOW (16) BY DEFAULT				
	for (i = 0; i < 2 * M_PI; i += M_PI / 16) //DRAWS A POLYGON WITH 16 VORTEXS
		glVertex3f(cos(i) * .5f, sin(i) * .5f, 0.0) // THE RADIUS OF THE CIRCLE IS 0.5f
     end
	glEnd()						// REALIZE THAT I SCALE IT ABOVE
	glPopMatrix();

	glPushMatrix();
	glTranslatef(-.5f, 0, 0)	// BACK WHEEL
	glScalef(0.25f, 0.25f, 0);
	glBegin(GL_LINE_STRIP);
	for ( i = 0; i < 2 * M_PI; i += M_PI / 16) // SPECIAL THANKS TO DSB FROM
		glVertex3f(cos(i) * 0.5f, sin(i) * 0.5f, 0.0) // community.khronos.org/t/drawing-circles-in-opengl/50790/2
   end
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)		// CAR LOWER PART			
	glVertex3f(0.375f, 0, 0);
	glVertex3f(-0.375f, 0, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR LOWER-BACK PART
	glVertex3f(-0.625, 0, 0);
	glVertex3f(-0.65f, 0, 0);
	glVertex3f(-0.65f, 0, 0);
	glVertex3f(-0.75f, 0.125f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR BACK PART
	glVertex3f(-0.75, 0.125f, 0);
	glVertex3f(-0.75f, 0.35f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR BACK-UPPER PART
	glVertex3f(-.75f, .35f, 0);
	glVertex3f(-.375, .6f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR UPPER PART
	glVertex3f(-0.375, 0.6f, 0);
	glVertex3f(0.175f, 0.6f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR FRONT-UPPER PART
	glVertex3f(0.175f, 0.6f, 0)	// WINDSHIELD
	glVertex3f(0.475, 0.4f, 0)	// WINDSHIELD
	glVertex3f(0.475, 0.4f, 0)	// HOOD
	glVertex3f(0.75, 0.35f, 0)	// HOOD
	glEnd();
	glPopMatrix();

	glPushMatrix() // HEADLIGHTS CREATION AND POSITIONING
	glTranslatef(0.38f, 0.175f, 0);
	glScalef(0.5f, 0.5f, 0);
	draw2DHeadlights() // FUNCTION CREATED ABOVE
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES)	// CAR LOWER-FRONT PART
	glVertex3f(0.625f, 0, 0);
	glVertex3f(0.75f, 0, 0);
	glVertex3f(0.75f, 0, 0);
	glVertex3f(0.82f, 0.025f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix() //CAR FRONT PART
	glBegin(GL_LINES);
	glVertex3f(0.82f, 0.025f, 0);
	glVertex3f(0.82f, 0.285f, 0);
	glEnd();
	glPopMatrix();

	glPushMatrix();
	glBegin(GL_LINES);
	//	ADD SOME LINES - JUST FOR DECORATION
	glVertex3f(0.475f, .4f, 0)	// A DECAY TO FIT WITH
	glVertex3f(0.475f, .35f, 0)	// THE TRUNK DETAIL
	glVertex3f(0.475f, .35f, 0)	// DIVISION BETWEEN WINDOWS AND DOOR
	glVertex3f(-.375, .35f, 0)	// 
	glVertex3f(-.375f, 0, 0)	// BACK DOOR
	glVertex3f(-.375f, .35, 0)	// BACK DOOR
	glVertex3f(.475f, .125, 0)	// FRONT DOOR TO FIT WITH THE WHEEL AND THE 
	glVertex3f(.475f, .35, 0)	// HOOD
	glVertex3f(0, 0, 0)	// THE MIDDLE BETWEEN BOTH DOORS (ABOVE -.375 + .375 = 0)
	glVertex3f(0, .35f, 0)	// THE MIDDLE BETWEEN BOTH DOORS (ABOVE -.375 + .375 = 0)
	glVertex3f(-.75f, .35f, 0) // TRUNK
	glVertex3f(-.375f, .35f, 0) // TRUNK
	glVertex3f(-.375f, .6f, 0)	// TRUNK
	glVertex3f(-.375f, .35f, 0) // TRUNK
	glEnd();
	glPopMatrix();

	glEnd();
	glPopMatrix();
}




#endif



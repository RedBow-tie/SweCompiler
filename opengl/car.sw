func transladeZ() 	// CREATES 2 COPYS OF THE CAR AND PUSH FOWARD AND BACKWARD
	glPushMatrix();
		glTranslatef(0,0, -.3f);	
		car2D();
	glPopMatrix();
	glPushMatrix();
		glTranslatef(0, 0, .3f);
		car2D();
	glPopMatrix();
}



func draw3DHeadlights() 
   glPushMatrix();
   glBegin(GL_LINE_STRIP);
   glPushMatrix();
   double angle = 0.0f; //CAR HEADLIGHT
   double rad 
   for (angle = 0.0f; angle <= 90; angle += 0.01f)  // BASICLY SAME AS ABOVE
		rad = M_PI * angle / 180	//BUT NOW WITH THE Z AXIS
		glVertex3f (0.75f + 0.125f * cos(rad), 0.225f + 0.125f * sin(rad), 0.3f);
		glVertex3f (0.75f + 0.125f * cos(rad), 0.225f + 0.125f * sin(rad), -0.3f);
   }//CAR HEADLIGHT
   glPopMatrix();
   glEnd();
   glPopMatrix();
}




form car (), nowait
    int f

layout "Car 3D" sysmenu 
a                                                                    























                                                                                        a
end
field

a: I_OPENGL OpenGL 
	paint ( cre x ) 
		onerror 
			Error_mode = true
		end

		if ( f == 0 ) 
			f = 1
			glEnable(GL_DEPTH_TEST);
		end

	glClearColor(0.4f, 0.4f, 0.4f, 1.0f);
	// Clear screen
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// Reset transformations
	glLoadIdentity();
	glTranslatef(-.125f, 0, 0)	//MOVE THE CAR A LITTLE BACKWARDS TO MAKE THE FRONT 
								//AND TO BE ABLE TO SEE ALL THE VEICHLE
	glRotatef(45, 1, 1, 0)		//ROTATE THE CAR TO BE ABLE TO SEE IN 3D
	transladeZ() // CREATED ABOVE
	// NOW FOR EACH EDGE VORTEX I HAVE TO CREATE A LINK WITH THE TRANSLATED FACES
	// SO FOR IT I HAVE TO GET THE MAIN EDGES INTO Z AXIS
	glColor3f(1, 0, 0);
	glPushMatrix();
		glBegin(GL_LINES);
		glVertex3f(-.65f, 0, .3) // LOWER-LEFT FACE
		glVertex3f(-.65f, 0, -.3); 
		glVertex3f(-.75f, .125f, .3f) // UPPER-LOWER-LEFT FACE **LOL**
		glVertex3f(-.75f, .125f, -.3f); 
		glVertex3f(-.75f, .35f, -.3) // BACK PART
		glVertex3f(-.75f, .35f, .3) // BACK PART
		glVertex3f(-.375, .6f, -.3f) //BACK UPPER
		glVertex3f(-.375, .6f, .3) //BACK UPPER
		glVertex3f(.175f, .6f, -.3f) //UPPER 
		glVertex3f(.175f, .6f, .3) //UPPER 
		glVertex3f(.475, .4f, -.3f)	// WINDSHIELD
		glVertex3f(.475, .4f, .3f)	// WINDSHIELD
		glVertex3f(.75, .35f, -.3f)	// HOOD
		glVertex3f(.75, .35f, .3f)	// HOOD
		glVertex3f(.625f, 0, -.3f) //LOWER RIGHT
		glVertex3f(.625f, 0, .3f);
		glVertex3f(.75f, 0, -.3f)	// LOWER FRONT 1
		glVertex3f(.75f, 0, .3f);	
		glVertex3f(.82f, .025f, -.3f) // LOWER FRONT 2
		glVertex3f(.82f, .025f, .3f);
		glPushMatrix();
			glTranslatef(.38f, .175f, 0);
			glScalef(.5f, .5f, 0)			//FIX DE HEADLIGHTS
			draw3DHeadlights();
		glPopMatrix();
		glEnd();
	glPopMatrix();

	glFlush();   
   end
end




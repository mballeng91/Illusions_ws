
//First illusion variables
int current = 1, illusions = 7;
int depthStop;
int isometryCount;
float globalAngle;

//Second illusion variables
int secondQuadrantPosition = 100;
int forthQuadrantPosition = 400;
boolean separateEllipses = false;


void setup() {
  size(500, 500, P2D);
  smooth();
  noStroke();
  
  globalAngle = 0.0;
  isometryCount = 6;
  depthStop = 2;
}

void draw() {
  
  
  pushStyle();  
  fill(128, 255, 128, 32);

  switch(current) {
  case 1:
    background(0);
    recurse(width/2, height/2, height/4, 0.0, 0);
    globalAngle += .01;
    
    text("Recursion Depth: " + depthStop, 10, 20);
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    illusory();
    break;
  case 3:
    //disjointed_arch();
    break;
  case 4:
    //sigma_motion();
    break;
  case 5:
    //reverse_spoke();
    break;
  case 6: 
    //white_xmas();
    break;
  case 7:
    //pigeon_neck();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
}


//First illusion -> Hidden patterns
void recurse(float posX, float posY, float rad, float ang, int depth) {
  if (depth < depthStop) {
    float angleSegment = TWO_PI/isometryCount;   // Separation angle between figures
    for (int i=0; i < isometryCount; i++) {      //render [isimetryCount] number of figures
      float newRad = rad/2;                      
      float newAng = ang + i*angleSegment - globalAngle;
      float newX = cos(newAng)*rad + posX;
      float newY = sin(newAng)*rad + posY;
      recurse(newX, newY, newRad, newAng, depth + 1);
    }
  }
  else
    if(rad < 2) ellipse(posX, posY, 4.0, 4.0);
    else  ellipse(posX, posY, rad*2.0, rad*2.0);
}


void mouseReleased() {
  depthStop++;
  if (depthStop >= 7) depthStop = 1;
}

//Second illusion illusory square
void illusory(){
  background(0);
  rectMode(CENTER);
  stroke(255);
  noFill();
  rect(250, 250, 150, 150);
  
  if (secondQuadrantPosition>=165) {
    separateEllipses = true;
  }
  if (secondQuadrantPosition==100) {
    separateEllipses = false;
  }
  if (separateEllipses == false) {
    secondQuadrantPosition++;
    forthQuadrantPosition--;
  }
  else {
    secondQuadrantPosition--;
    forthQuadrantPosition++;
  }
  noStroke();
  //Large ellipses
  
  fill(100);
  ellipse(secondQuadrantPosition, 250, 100, 100);//left
  ellipse(250, secondQuadrantPosition, 100, 100);//up
  ellipse(forthQuadrantPosition, 250, 100, 100);//right
  ellipse(250, forthQuadrantPosition, 100, 100);//down
  
  //small ellipses
  fill(210);
  ellipse(secondQuadrantPosition+190, 250, 20, 20);//R
  ellipse(250, secondQuadrantPosition+190, 20, 20);//D
  ellipse(forthQuadrantPosition-190, 250, 20, 20);//l
  ellipse(250, forthQuadrantPosition-190, 20, 20);//U
}
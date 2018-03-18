int current = 1, illusions = 7;
int depthStop;
int isometryCount;
float globalAngle;


void setup() {
  size(800, 800, P2D);
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
    //goi();
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
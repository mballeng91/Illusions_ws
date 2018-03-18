int current = 0;

void setup() {
  size(800, 800);
  frameRate(20);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    goi();
    break;
  case 3:
    disjointed_arch();
    break;
  case 4:
    sigma_motion();
    break;
  case 5:
    reverse_spoke();
    break;
  case 6: 
    white_xmas();
    break;
  case 7:
    pigeon_neck();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}
// euler sprials inspired by numberPhile
// the turtles name is greg he is a pvector that is updated in
// a forward function using polar coordinates and  a right turn function
// he has an heading angle intheta
// he can be sent a plot theta in the right();  angles are in degress
// converted to radians in the forward() and right() functions

float intheta =0;//turtle's theta
float theta =0; // plot's theta
PVector greg;
float dt = 1.0186;
void setup() {
  //size(800,800);
  fullScreen();
  background(0);
  colorMode(HSB, 60);
  stroke(0, 360, 360);
  greg = new PVector(width/2, height/2);
  //mysquare();
}


void mysquare() {
  for (int i= 0; i <4; i++) {
    forward(50);
    right(90);
  }
}


void forward(float amt) {

  float x2 = greg.x +amt *cos(radians(intheta));
  float y2 = greg.y +amt *sin(radians(intheta));
  stroke(intheta%60, 60, 60);
  line(greg.x, greg.y, x2, y2);
  // set the x and y to new position
  greg.x = x2;
  greg.y = y2;
}

void right(float deg) {
  intheta += deg;
  intheta = intheta%360;
}


void draw() {
  for (int i =0; i<200; i++) {
    theta += dt;
    theta = theta%360;
    println(theta, intheta, frameCount);
    right(theta);
    forward(7);
  }
  if (frameCount%300 == 0) {
    background(0);
    greg.x= width/2;
    greg.y= height/2;
    dt+= 0.002; // the angle increment is slightly increased
  }
}

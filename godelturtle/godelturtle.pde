// godel tutle 
// the turtles name is greg he is a pvector that is updated in
// he draws a trail of numbers as steps
//

float intheta =0;//turtle's theta
PVector greg;
float sz=20;
int step=0;


void setup() {
  size(800, 800);
  //fullScreen();
  background(200);
  colorMode(HSB, 10);
  stroke(0);
  fill(0);
  //frameRate(1);
  greg = new PVector(width/3+10, height-20);
  //greg = new PVector(width/10, height/2);
  intheta =0;
}

// simple turtle functions forward() right() left()
void forward(float amt) {
  for (int m= 0; m<amt; m++) {
    step++;
    float x2 = greg.x +sz *cos(radians(intheta));
    float y2 = greg.y +sz *sin(radians(intheta));

    text(step, x2, y2);
    // set the x and y to new position
    greg.x = x2;
    greg.y = y2;
  }
}

void right(float deg) {
  intheta += deg;
  intheta = intheta%360;
}

void left(float deg) {
  intheta -= deg;
  intheta = intheta%360;
}


void poly(int s, int len) {
  float ang =360/s;
  for (int i=0; i<s; i++) {
    forward(len);
    left(ang);
  }
}

void draw() {
  background(0, 0, 6);
  //greg.x =mouseX;
  //greg.y = mouseY;
  for (int i =3; i<13; i++) {
    fill((i-3)%13, 255, 255);
    poly(i, 10);
    //intheta = 0;  // reset heading
    step =0;  // reset step count
  }
  noLoop();
} 

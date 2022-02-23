// godel tutle 
// the turtles name is greg he is a pvector that is updated in
// he draws a trail of numbers as steps
//

float intheta =0;//turtle's theta
PVector greg;
float sz=30;
int step=0;


void setup() {
  size(800, 800);
  //fullScreen();
  background(200);
  //colorMode(HSB, 10);
  textSize(sz/3);
  stroke(0);
  fill(0);
  //frameRate(1);
  greg = new PVector(width/2-sz, height/2);
  //greg = new PVector(width/10, height/2);
  intheta =90;
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
  background(255);

  sprial(24);
  noLoop();
} 

void sprial(int level) {

  // place the first three a a seed
  forward(1);
  left(90);
  forward(1);
  left(90);
  forward(1);
  left(90);
  // keep increacing the side length
  int spstep = 2;

  for (int i = 0; i<level; i++) {

    forward(spstep);
    left(90);
    forward(spstep);
    left(90);


    spstep++;
  }
}

float radius;

void setup() {
  size(600, 600);
  stroke(0, 255, 0);
  radius = 250;
}

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(0, 255, 0);
  int nn = floor(map(mouseY, 0, height, 3, 20));
  drawpoly(nn);
}


void drawpoly(int n) {

  for (int i =0; i<n; i++) {  // 1/n gets a number less than zero that when multipled by TWO_PI gets the angel in radians
    float angle = i/float(n) - 0.25; //need to convert to a float
    //println(angle);//  the - 0.25 makes the image straight
    float vx = radius * cos(angle *TWO_PI);
    float vy = radius * sin(angle*TWO_PI);
    float v1x= radius * cos((angle+1/float(n))*TWO_PI);
    float v1y= radius * sin((angle+1/float(n))*TWO_PI);
    line(vx, vy, v1x, v1y);
  }
}

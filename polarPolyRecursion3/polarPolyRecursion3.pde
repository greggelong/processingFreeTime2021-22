int n;

void setup() {
  size(900, 900);
  stroke(0, 255, 0);
}

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(0, 255, 0);
  n = floor(map(mouseY, 0, height, 3, 20));
  //drawpoly(0,0, 100);
  drawRecursivePoly(0, 0, 200, 3);
}


void drawpoly(float x, float y, float radius) {
  // this will work like the ellipse function
  for (int i =0; i<n; i++) {  // 1/n gets a number less than zero that when multipled by TWO_PI gets the angel in radians
    float angle = i/float(n) - 0.25; //need to convert to a float
    //println(angle);//  the - 0.25 makes the image straight
    float vx = radius * cos(angle *TWO_PI);
    float vy = radius * sin(angle*TWO_PI);
    float v1x= radius * cos((angle+1/float(n))*TWO_PI);
    float v1y= radius * sin((angle+1/float(n))*TWO_PI);
    line(vx+x, vy+y, v1x+x, v1y+y);
  }
}


void drawRecursivePoly(float x, float y, float radius, int depth) {
  // this places another poly at each interseting point by recursivly calling the function as it goes n steps around the unit circle
  drawpoly(x, y, radius);

  if (depth>0) {
    for (int i =0; i<n; i++) {  // 1/n gets a number less than zero that when multipled by TWO_PI gets the angel in radians
      float angle = i/float(n) - 0.25; //need to convert to a float
      //println(angle);//  the - 0.25 makes the image straight
      float vx = radius * cos(angle *TWO_PI);
      float vy = radius * sin(angle*TWO_PI);
      //float vx1 = radius * cos(angle *PI);
      //float vy1 = radius * sin(angle*PI);
      drawRecursivePoly(vx, vy, radius*0.7, depth-1);
      drawRecursivePoly(vx,vy,radius*0.3,depth-1);
    }
  }
}

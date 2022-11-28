 int n;

void setup() {
  size(900, 600);
  stroke(0, 255, 0);
}

void draw() {
  translate(width/2, height/2);
  background(0);
  stroke(0, 255, 0);
  n = floor(map(mouseY, 0, height, 3, 20));
  //drawpoly(0,0, 100);
  drawRecursivePoly(0,0,200,5);
}


void drawpoly(float x,float y, float radius) {
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


void drawRecursivePoly(float x, float y, float radius, int depth){
  // this is like the simple recursion example  by dan shiffman 
  drawpoly(x,y,radius);
  
  if (depth>0){
    drawRecursivePoly(x+radius+2,y,radius*0.5,depth-1);
    drawRecursivePoly(x-radius+2,y,radius*0.5,depth-1);
  }
  
}

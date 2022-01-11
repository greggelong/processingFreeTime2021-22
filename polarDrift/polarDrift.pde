float x;
float y;
float x1;
float y1;
float theta=0;
float theta1=0;
float r;
float m =2;//multiplier for second point
float lines =100;
void setup(){
  
  size(800,800); 
  //fullScreen();
  background(255,0,0);
  strokeWeight(3);
  r= width/2-20;
 // frameRate(2);
}

void draw(){
  theta += 360/lines;
  theta1=theta*m;
  //theta = theta%360; // constrains theta
  //theta1 =theta1%360; // if not gets out of phase
  x= cos(radians(theta))*r;
  y= sin(radians(theta))*r;
  x1= cos(radians(theta1))*r;
  y1= sin(radians(theta1))*r;
  textSize(54);
  text("multiple: "+str(floor(m)),100,100);
  text("lines: "+str(floor(lines)),100,170);
  fill(255,0,0);
  rect(100,172,500,70);
  fill(255);
  text(theta,100,240);
  translate(width/2,height/2);
  line(x,y,x1,y1);
  
  
}

void mousePressed(){
  background(255,0,0);
  m= floor(map(mouseX,0,width,2,13));
  lines = floor(map(mouseY,0,height,10,101));
  theta = 0;  // reset theta 
  
}

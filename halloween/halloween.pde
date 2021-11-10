float x,y, off,lo, lo1, off2, px,py, clr;

Ball[] balls;

void setup(){
 //size(600,600); 
 fullScreen();
 balls = new Ball[150];
 for( int i =0; i<150;i++){
 balls[i]=(new Ball(random(width), random(height), random(1000)));
 }
 println(balls[0]);
 strokeWeight(20);
 stroke(0);
 rectMode(CENTER);
 //frameRate(20);
 x =width/2;
 y = height/2;
 px =width/2;
 py = height/2;
}



void draw() {
  
  clr = map(mouseX,0,width,90,170);
  background(255, clr, 0);
  //for (Ball b : balls){
   for (int i =0; i<150;i++){
   balls[i].move();
   balls[i].show();
  }
  pushMatrix();
  off+= 0.001;
  off2+=0.01;
  x = noise(off)*width;
  y = noise(off+550)*height;
  px = noise(off+250)*width;
  py = noise(off+1550)*height;
  translate(x,y);
  rotate(radians(frameCount));
  lo = noise(off2+1000)*150;
  lo1 = noise(off2+100)*150;
  line( -width/8,lo,width/8+lo,-lo);
  line( -width/8-lo1,0,width/8,-lo1 );
  popMatrix();
  // square
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(frameCount*-1));
  fill(255, 204, 0, 200);
  rect(0,0,300-lo,300-lo);
  popMatrix();
  fill(255, 140, 0, 200);
  ellipse(px,py,100,100);
  
  
  
  
}

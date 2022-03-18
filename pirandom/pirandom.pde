float r =400;
int total = 0;
int circ =0;
void setup(){
 size(804,804); 
 rectMode(CENTER);
 
 // draw circle and square
 background(0);
  translate(width/2,height/2);
  stroke(255,0,0);
  strokeWeight(2);
  noFill();
  rect(0,0,r*2,r*2);
  ellipse(0,0,r*2,r*2);
  textSize(20);
}

void draw(){
  translate(width/2,height/2);
  float pi=0;
  // I dont need to figure how many point are in the square
  // as they all are
  // i just need to find how many points are in the circle
  // distance function uses 
  
  for (int i =0; i<1000; i++){
  float x = random(-r,r);
  float y = random(-r,r);
  total++;
  float d = x*x+y*y;
  if (d <= r*r) {
   stroke(random(255),random(255),0);
   circ++;
  }else{
   stroke(0,random(255),random(255)); 
  }
  
  
  pi = 4 * (float(circ) / total);
  point(x,y);
  //text(pi,20,20);
  }
  fill(0);
  stroke(0);
  rect(0,-390,700,20);
  fill(255);
  
  text("total "+total+" Pi "+pi,-150,-385);
  //println(pi);
}

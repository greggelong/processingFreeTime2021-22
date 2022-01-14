float y;
float angx;
float frq=8;
float off = 0;
float inc; // for dynamic incriment value

// maybe whitneys is three times around a circle and decreace by .3333
void setup() {
  //fullScreen();
  size(1080, 720);// its three times around a circle
  //noSmooth();
  inc= 360/float(width); // dynamicly set the decimal percentage that the inc
  // need to recast width as a float and the percision is like this 3333334 
  println(inc);
  background(0);
  colorMode(HSB, 8, 100, 100);
  //frameRate(10);
 
}

void draw() {
  //background(0);
  stroke(frq%8, 100, 100);
  //strokeWeight(10/frq);
  strokeWeight(2);
  noFill();
  translate(0,height/2); // move to the center of the canvas
  beginShape();
  for (int angx=0; angx<width; angx++) {
    
    y= (-1*(sin(frq*radians(angx+off)))*120/frq); // mult my neg 1 to flip it radius keeps getting bigger
    vertex(angx, y);
   
  }
  endShape();
  off+=1;  // control scroll speed
  if (off > width){
   off = 0; 
  }
 
  if (frq <0) { // because of float 0.3333334 need to check to 0
    //noLoop();
    delay(500);
    background(0);
    frq =8;
    
    
  }
  frq-=inc;  // frequence keeps getting smaller
  
 
}

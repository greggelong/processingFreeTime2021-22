float y;
float angx;
float frq=8;

// maybe whitneys is three times around a circle and decreace by .3333
void setup() {
  size(720, 600);// its two times around a circle
  //noSmooth(); // works better on fat lines
  background(0);
  colorMode(HSB, 8, 100, 100);
  frameRate(2);
  
 
}

void draw() {

  stroke(frq%8, 100, 100);
  //strokeWeight(1+(8-frq));
  //strokeWeight(8/frq); // growing line thickness
  strokeWeight(2);
  noFill();
  translate(0,height/2); // move to the center of the canvas
  beginShape();
  for (int angx=0; angx<width; angx++) {
    
    y= (-1*(sin(frq*radians(angx)))*120/frq); // mult my neg 1 to flip it radius keeps getting bigger
    vertex(angx, y);
  }
  endShape();
  if (frq <0.5) {
    noLoop();
    //background(0);
    frq =8;
    
  }
  frq-=0.5;  // frequence keeps getting smaller
 
}

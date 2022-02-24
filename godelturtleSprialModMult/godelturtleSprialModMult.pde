// godel tutle 
// the turtles name is greg he is a pvector that is updated in
// he draws a trail of numbers as steps
//
import processing.pdf.*;
float intheta =0;//turtle's theta
PVector greg;
float sz=30;
int step=0;


void setup() {
  //size(1000, 1000, PDF, "ulamSprial.pdf");
  size(1000,1000);
  //fullScreen();
  background(200);
  //colorMode(HSB, 10);
  textSize(sz/2);
  textAlign(CENTER);
  rectMode(CENTER);
  stroke(0);
  //frameRate(2);
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
    // test
    int mult = floor(map(mouseX,0,width,1,64));
    //println(mult);
    fill(255,0,0);
    textSize(30);
    text(mult,30,30);
    textSize(sz/2);
    if ((step)%mult ==0){
      fill(0);
      //ellipse(x2,y2,sz,sz); // use with textAlign center
      rect(x2,y2,sz,sz);
      fill(255);
     
    }else{
      fill(0);
    }
      
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
  // for animation need to reset position of turtle
  greg.x = width/2-sz;
  greg.y = height/2;
  intheta = 90;
  step =0;

  sprial(29);
  //println("finished");
  //exit();  // for pdf printing
  //noLoop();
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

boolean isprime(int n){
  if (n == 1 || n == 0){
    return false;


  }
  else if(n == 2){
    return true;


  }
  // if evenly divisible by any number from 2 up to squr root +1 f
  for(int i = 2; i < floor(sqrt(n))+1; i++){
      if (n%i == 0){
        return false;
        
      }
  

  }
  // passes above test retun true no need for an if statement
  return true;


}

PVector tv;
PVector [] spoints = new PVector[20];
void setup() {
  size(800, 800, P3D);
  colorMode(HSB,20);
  background(0);
  noCursor();
  stroke(0, 255, 0);
  noSmooth();
  lights();
  // front face
  spoints[0] = new PVector(0, 0, -600);
  spoints[1] = new PVector(300, 0, -600);
  spoints[2]= new PVector(600, 0, -600);
  spoints[3] = new PVector(0, 300, -600);
  spoints[4] = new PVector(600, 300, -600);
  spoints[5] = new PVector(0, 600, -600);
  spoints[6] = new PVector(300, 600, -600);
  spoints[7] = new PVector(600, 600, -600);
  // four points top and bottom middle
  spoints[8] = new PVector(0, 0, -300);
  spoints[9] = new PVector(600, 0, -300);
  spoints[10] = new PVector(0, 600, -300);
  spoints[11] = new PVector(600, 600, -300);
  // back face
  spoints[12] = new PVector(0, 0, 0);
  spoints[13] = new PVector(300, 0, 0);
  spoints[14] = new PVector(600, 0, 0);
  spoints[15] = new PVector(0, 300, 0);
  spoints[16] = new PVector(600, 300, 0);
  spoints[17] = new PVector(0, 600, 0);
  spoints[18] = new PVector(300, 600, 0);
  spoints[19] = new PVector(600, 600, 0);
  tv = new PVector(100, 100, 100);
}
void draw() {
  background(0);
  camera(mouseX*2, mouseY*2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0); 
  //rotateZ(radians(frameCount));
  //rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  
   // play the chaos game 30550 times each frame pick a point and go two thirds of the way
   for (int i=0; i<30500;i++){
     // plot tv the plotting vector
     point(tv.x,tv.y,tv.z);
     // get a random index
     int ind = floor(random(20));
     // tv becomes a vector at the lerp point
     tv = PVector.lerp(tv,spoints[ind],2/3.0);
     stroke(ind,20,20);
   }
}

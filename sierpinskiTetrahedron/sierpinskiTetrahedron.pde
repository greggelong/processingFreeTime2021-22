PVector v1, v2, v3, v4, tv;

void setup() {
  size(800, 800, P3D);
  background(0);
  stroke(0, 255, 0);
  noSmooth();
  lights();
  v1 = new PVector(300, 0, -600);
  v2 = new PVector(0, 600, -600);
  v3 = new PVector(600, 600, -600);
  v4 = new PVector(300, 300, 00);
  tv = new PVector(100, 100, 100);
}

void draw() {
  background(0);
  camera(mouseX*2, mouseY*1.5, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //camera(width/2, mouseX*2, (mouseY) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  rotateZ(radians(frameCount));
  //rotateX(radians(frameCount));
  //rotateY(radians(frameCount));
  
  stroke(0, 255, 0);
  
   for (int i=0; i<10550; i++) {
    
    point(tv.x, tv.y, tv.z);
    
    int r = floor(random(4));
    //println(r);
    if (r==0) {
      stroke(255, 0, 0);
      tv = PVector.lerp(tv, v1, 0.5);
    } else if (r==1) {
      stroke(0, 255, 0);
      tv = PVector.lerp(tv, v2, 0.5);
    } else if (r==2) {
      stroke(0, 0, 255);
      tv = PVector.lerp(tv, v3, 0.5);
    } else if (r==3) {
      stroke(0, 255, 255);
      tv = PVector.lerp(tv, v4, 0.5);
    }
  }
}

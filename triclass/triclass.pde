Sier[] mySiers;

int num =10;

void setup() {

  size(600, 600);
  //fullScreen();
  mySiers = new Sier[num];
  for (int i=0; i<num; i++) {
    mySiers[i] = new Sier(random(width), random(height), random(1000));
  }
  rectMode(CENTER);
  background(255, 150, 0);
}

void draw() {
  background(255, 150, 0);
  
  for (int i=0; i<num; i++) {
    mySiers[i].move();
    mySiers[i].show();
  }

  
}

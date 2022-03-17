// arrays in processing
// declare, create array (how long is it),initalize and use
// declare name and type

// init and create
//int[][] world = new int [80][80];
//int[][] newWorld = new int[80][80];
// changed the rules to Day and night
// https://conwaylife.com/wiki/OCA:Day_%26_Night
int [][] world;
int [][] newWorld;
int cols =200;
int rows =200;
boolean strk= true;
int sz = 5;

void setup() {
  size(1000, 1000);
  world = new int [cols][rows];
  newWorld = new int [cols][rows];
  background(255);
  noStroke();
  //makeRndStart();
  //makeglide();
  makeRpent();
  showWorld();
  //frameRate(10);
  //println(newWorld[3][2]);
}


void draw() {
 
 
  if(strk){
    stroke(0);
  }else{
    noStroke();
  }
  showWorld();
  update();
  if (mousePressed) {
    if (mouseX > width/2) {
      makeRndStart();
    } else {
      makeRpent();
    }
  }
}

void keyPressed(){
 
  if(key == 's'){
    if(strk){
     noStroke();
     strk = false;
    }else{
      stroke(0);
      strk = true;
    }
    
  }
 
}


int getNeighbors(int j, int i) {  // y and x coorodinate of the two dim array
  int sum = 0;
  for (int y = -1; y < 2; y++) {
    for (int x = -1; x < 2; x++) {
      int col = (x + i + cols) % cols;
      int row = (y + j + rows) % rows;
      sum += world[row][col];
    }
  }
  sum -= world[j][i];
  return sum;
}



void update() {

  for (int j=0; j< world.length; j++) {  // row or y    
    for (int i=0; i< world[j].length; i++) { // column or x   
      int neigh = getNeighbors(j, i); // start with more or less random parts
      if (world[j][i] == 1 && neigh == 3 || world[j][i] == 1 && neigh ==4 || world[j][i] == 1 && neigh == 6 || world[j][i] == 1 && neigh ==7 || world[j][i] == 1 && neigh ==8) {     // keeps living
        newWorld[j][i] = 1;
      } else if (world[j][i] == 0 && neigh == 3 || world[j][i] == 0 && neigh == 6 || world[j][i] == 0 && neigh == 7 || world[j][i] == 0 && neigh == 8) {    // comes to life
        newWorld[j][i] = 1;
      } else {
        newWorld[j][i] = 0;  // else zero
      }
    }
  }

  // arrayCopy(newWorld,world); this does not work  need to manually copy the array

  for (int j=0; j< world.length; j++) {  //  
    for (int i=0; i< world[j].length; i++) {
      world[j][i] = newWorld[j][i];
    }
  }
}


void makeRndStart() {
  int perChance = int(random(2, 4));
  //println(perChance);
  for (int j=0; j< world.length; j++) {  // row or y
    for (int i=0; i< world[j].length; i++) { // column or x
      int state = int(random(perChance)); // start with more or less random parts
      //println(state);
      if (state == 1) {
        world[j][i] = 1;
      } else {
        world[j][i] = 0;
      }
    }
  }
}

void makeglide() {

  // glider
  world[38][42] =1;
  world[39][43] =1;
  world[40][41] =1;
  world[40][42]=1;
  world[40][43]=1;
}

void makerocket(int ry,int rx) {

  // glider
  world[38+ry][40+rx] =1;
  world[38+ry][41+rx] =1;
  world[39+ry][39+rx] =1;
  world[39+ry][41+rx]=1;
  world[39+ry][42+rx]=1;
  world[40+ry][39+rx] =1;
  world[40+ry][40+rx] =1;
  world[40+ry][41+rx] =1;
  world[40+ry][42+rx]=1;
  world[40+ry][43+rx]=1;
  world[40+ry][44+rx] =1;
  world[40+ry][45+rx] =1;
  world[40+ry][46+rx] =1;
  //world[40][47]=1;
  world[41+ry][39+rx]=1;
  world[41+ry][41+rx] =1;
  world[41+ry][42+rx] =1;
  world[42+ry][40+rx] =1;
  world[42+ry][41+rx] =1;
 
 
}

void makerocket2(int ry,int rx) {

  // glider
  world[40+ry][38+rx] =1;
  world[41+ry][38+rx] =1;
  world[39+ry][39+rx] =1;
  world[41+ry][39+rx]=1;
  world[42+ry][39+rx]=1;
  world[39+ry][40+rx] =1;
  world[40+ry][40+rx] =1;
  world[41+ry][40+rx] =1;
  world[42+ry][40+rx]=1;
  world[43+ry][40+rx]=1;
  world[44+ry][40+rx] =1;
  world[45+ry][40+rx] =1;
  world[46+ry][40+rx] =1;
  //world[40][47]=1;
  world[39+ry][41+rx]=1;
  world[41+ry][41+rx] =1;
  world[42+ry][41+rx] =1;
  world[40+ry][42+rx] =1;
  world[41+ry][42+rx] =1;
 
 
}
void makeRpent() {
  // clears it
 for (int j=0; j< world.length; j++) {  // row or y
    for (int i=0; i< world[j].length; i++) { // column or x
       world[j][i] = 0;
    }
  }
  //int offset = floor(random(-10,10));
 
  makerocket(1,1);
  makerocket(25,31);
  makerocket(40,-20);
  makerocket2(-30,50);
  makerocket2(7,70);
  /* // rpent
  world[42][38-offset] =1;
  world[43][38-offset] =1;
  world[41][38-offset] =1;
  world[42][37-offset]=1;
  world[41][39-offset]=1;
  */
}



void showWorld() {
  for (int j=0; j< world.length; j++) {  // row or y
    for (int i=0; i< world[j].length; i++) { // column or x
      if (world[j][i] == 1) {
        fill(0, 255, 0);
      } else {
        fill(0);
      }
      rect(i*sz, j*sz, sz, sz); // sz maps to display
    }
  }
}

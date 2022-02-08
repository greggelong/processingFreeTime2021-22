// arrays in processing
// declare, create array (how long is it),initalize and use
// declae name and type

// init and create
//int[][] world = new int [80][80];
//int[][] newWorld = new int[80][80];

int [][] world;
int [][] newWorld;
int cols =160;
int rows =160;
int gen =1;
int sz = 5;

void setup() {
  size(800, 800);
  colorMode(HSB, 70);
  noStroke();
  world = new int [cols][rows];
  newWorld = new int [cols][rows];
  background(255);
  //makeRndStart();
  //makeglide();
  // one in the center
  world[rows/2][cols/2] = gen;
  // four on the sides
  /*
  world[40][40] = gen;
  world[120][40] = gen;
  world[40][120] = gen;
  world[120][120] = gen;
  */
  showWorld();
  //frameRate(10);
  //println(newWorld[3][2]);
}


void draw() {
  showWorld();
  
  update();
  gen++;
}


void update() {

  for (int j=0; j< world.length; j++) {  // row or y    
    for (int i=0; i< world[j].length; i++) { // column or x  
    float tn = world[(j+1+rows)%rows][i] +world[(j-1+rows)%rows][i] +world[j][(i-1+cols)%cols] +world[j][(i+1+cols)%cols];
    tn = (tn/(gen));  // you can use modulo to stop it from growing
    //tn= (tn/(gen%30)); // only grows out 30 generations
   
    if (tn == 1.0){
      
      newWorld[j][i] = gen+1;
       println(gen,tn, gen%4);
      
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


 
 
 

void showWorld() {
  for (int j=0; j< world.length; j++) {  // row or y
    for (int i=0; i< world[j].length; i++) { // column or x
      if (world[j][i] > 0) {
        fill(world[j][i]%70, 70, 70); // color from generation
        //fill(20,140,140); // single color harder to see changes but can still see them
      } else {
        fill(0);
      }
      rect(i*sz, j*sz, sz, sz); // sz maps to display
    }
  }
}

// arrays in processing
// declare, create array (how long is it),initalize and use
// declae name and type

// init and create
//int[][] world = new int [80][80];
//int[][] newWorld = new int[80][80];

int [][] world;
int [][] newWorld;
int cols =80;
int rows =80;
int gen =1;
int sz = 10;

void setup() {
  size(800, 800);
  background(0);
  colorMode(HSB, 35);
  noStroke();
  world = new int [cols][rows];
  newWorld = new int [cols][rows];
  // one in the center
  world[40][40] = gen;
  // four on the sides
  /*
  world[40][40] = gen;
  world[120][40] = gen;
  world[40][120] = gen;
  world[120][120] = gen;
 */
  showWorld();
  frameRate(1);
 
}


void draw() {
  background(0);
  showWorld();
  
  update();
  gen++;
}


void update() {

  for (int j=1; j< world.length-1; j++) {  // row or y    
    for (int i=1; i< world[j].length-1; i++) { // column or x  
    float tn = world[j+1][i] +world[j-1][i] +world[j][i-1] +world[j][i+1];
    //tn = (tn/(gen));  // you can use modulo to stop it from growing
    tn= (tn/(gen%70)); // only grows out to generations mod num
   
    if (tn == 1.0){
      
      newWorld[j][i] = gen+1;
       println(gen,tn, gen);
      
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
        fill(world[j][i]%35, 35, 35); // color from generation
        //fill(20,140,140); // single color harder to see changes but can still see them
      } else {
        fill(0);
      }
     // rect(i*sz, j*sz, sz, sz); // sz maps to display
     textSize(sz);
     text(world[j][i],i*sz,j*sz);
     fill(35,35,35);
     textSize(sz*2);
     text(gen,100,100);
    }
  }
}



void keyPressed(){
 save("ulamNum"+frameCount+".png");
}

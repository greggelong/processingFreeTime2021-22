int[][] sandpiles;
int sz = 20;  //10, 20, 40
int col= 36 ;// 108, 54, 27
int row =36; // 72, 36, 18
void setup() {
  size(720, 720);
  noStroke();
  textSize(sz);
  //frameRate(10);
  textAlign(LEFT,TOP);
  sandpiles = new int[col][row];
  //sandpiles[col/2][row/2] = 3000;
  // two sandpiles
  sandpiles[col/4][row/2] = 3051;
  sandpiles[col-col/4][row/2]=3051;
  
  // around 2000 it settles down into an two period ocilation
  // around 3000 it lools to be 8 or 16 period
 // dropping of full dosent look as cool wehn on a torus
 // but dropping a large number of grains in the center continues
 // for ever
 /*
 // fill the sandpile with 3
  for (int x =0; x<col; x++) {
    for (int y =0; y<row; y++) {
      //sandpiles[x][y] = int(random(2,4)); // 2 or 3 in each
      sandpiles[x][y] = 3;
    }
  }
 */
}

void showIt() {
  String txtnum; // place to hold the text of the number
  for (int x =0; x<col; x++) {
    for (int y =0; y<row; y++) {
      int num = sandpiles[x][y];
      color col = color(0,(20*num),0); // locally define col
      if (num == 0) {
        col = color(#0524E8);
      } else if (num ==1) {
        col = color(#0595FF);
      } else if (num ==2) {
        col = color(#FFF705);
      } else if (num ==3) {
        col = color(#FF4805);
      }
      fill(col);
      if (num>=4){
       txtnum= "#";
      }else{
        txtnum = str(num);
      }
      text(txtnum,x*sz,y*sz);
      //rect(x*sz, y*sz, sz, sz);
    }
  }
}

void topple() {
  int [][] nextpiles = new int[col][row];
   
  for (int x =0; x<col; x++) {
    for (int y =0; y<row; y++) {
      int num = sandpiles[x][y];
      if (num<4) {
        nextpiles[x][y] += sandpiles[x][y];
      }else {  // pile has more than 3
        nextpiles[x][y] += sandpiles[x][y]-4;
        nextpiles[(x+1)%col][y]++;  // right
        nextpiles[(x+col-1)%col][y]++; // left
        nextpiles[x][(y+1)%row]++; // down
        nextpiles[x][(y+row-1)%row]++;// up
      }
    }
  }
  sandpiles=nextpiles;
}

void draw() {
  background(0);
  showIt();
  topple();
}

void keyPressed(){
 //save("sandNum"+frameCount+".png");
  sandpiles[col/2][row/2] += 1;
  println("hello");
}

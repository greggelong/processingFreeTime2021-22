int[][] sandpiles;
int sz = 20;  //10, 20, 40
int col= 54 ;// 108, 54, 27
int row =36; // 72, 36, 18
void setup() {
  size(1080, 720);
  noStroke();
  textSize(sz);
  sandpiles = new int[col][row];
  sandpiles[col/2][row/2] = 10800;
  // two sandpiles
  //sandpiles[col/4][row/2] = 100000;
  //sandpiles[col-col/4][row/2]=100000;
}

void showIt() {
  String txtnum; // place to hold the text of the number
  for (int x =0; x<col; x++) {
    for (int y =0; y<row; y++) {
      int num = sandpiles[x][y];
      color col = color(0,255,0); // locally define col
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
  for (int x =1; x<col-1; x++) {
    for (int y =1; y<row-1; y++) {
      int num = sandpiles[x][y];
      if (num<4) {
        nextpiles[x][y] += sandpiles[x][y];
      }
    }
  }

  for (int x =1; x<col-1; x++) {
    for (int y =1; y<row-1; y++) {
      int num = sandpiles[x][y];
      if (num>=4) {  // pile has more than 3
        nextpiles[x][y] += sandpiles[x][y]-4;
        nextpiles[x+1][y]++;  // right
        nextpiles[x-1][y]++; // left
        nextpiles[x][y+1]++; // down
        nextpiles[x][y-1]++;// up
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

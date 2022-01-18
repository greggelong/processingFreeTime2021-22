int[][] sandpiles;
int sz = 10;
int col= 108;
int row =72;
void setup() {
  size(1080, 720);
  noStroke();
  sandpiles = new int[col][row];
  sandpiles[col/4][row/2] = 100000;
  sandpiles[col-col/4][row/2]=100000;
}

void showIt() {
  for (int x =0; x<col; x++) {
    for (int y =0; y<row; y++) {
      int num = sandpiles[x][y];
      color col = color(0); // locally define col
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
      rect(x*sz, y*sz, sz, sz);
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

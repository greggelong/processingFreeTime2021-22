float ax, ay;
float bx, by;
float cx, cy;
float dx, dy;
float ex, ey;
float fx, fy;
float gx, gy;
float hx, hy;
float tx, ty;
float j = 2.0/3.0;  // so = 1-(2/3) == 1/3 or 0.3333
//3 times bigger in length
//8 copies
// so 3 to what power is 8
// 3**x = 8
// fd = log(8)/log(3)
// The Hausdorff dimension is log(8)/log(3) == 1.892

void setup() {
  size(700, 700);
  background(0);
  println(log(8)/log(3));
  // top
  ax = 0;
  ay = 0;
  bx = width/2;
  by = 0;
  cx = width;
  cy = 0;
  // middle left
  dx = 0;
  dy = height/2;
  // middle right
  ex = width;
  ey = height/2;
  // bottom
  fx = 0;
  fy = height;
  gx = width/2;
  gy = height;
  hx = width;
  hy = height;
  
  
  tx = random(width);
  ty = random(height);
  stroke(0, 255, 0);
  strokeWeight(2);
  point(ax, ay); 
  point(bx, by);
  point(cx, cy);
  point(tx, ty);
}

void draw() {

  for (int i=0; i<50; i++) {

    point(tx, ty);
    int r = floor(random(8));
    if (r==0) {
      stroke(255, 0, 0);
      tx= lerp(tx, ax, j);
      ty= lerp(ty, ay, j);
    } else if (r==1) {
      stroke(0, 255, 0);
      tx= lerp(tx, bx, j);
      ty= lerp(ty, by, j);
    } else if (r==2) {
      stroke(0, 0, 255);
      tx= lerp(tx, cx, j);
      ty= lerp(ty, cy, j);
    }else if (r==3) {
      stroke(0, 255, 255);
      tx= lerp(tx, dx, j);
      ty= lerp(ty, dy, j);
    }else if (r==4) {
      stroke(255, 0, 255);
      tx= lerp(tx, ex, j);
      ty= lerp(ty, ey, j);
    }else if (r==5) {
      stroke(255, 255, 255);
      tx= lerp(tx, fx, j);
      ty= lerp(ty, fy, j);
    }else if (r==6) {
      stroke(255, 255, 0);
      tx= lerp(tx, gx, j);
      ty= lerp(ty, gy, j);
    }else if (r==7) {
      stroke(0, 50, 127);
      tx= lerp(tx, hx, j);
      ty= lerp(ty, hy, j);
    }
  }
}

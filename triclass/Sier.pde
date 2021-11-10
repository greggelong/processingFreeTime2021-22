class Sier{

  float x;
  float y;
  float off;
  int level;

  Sier(float tempx, float tempy, float tempoff) {
    x= tempx;
    y= tempy;
    off = tempoff;
    level = floor(random(2,20));
    println(level);
  }


  void  show() {
    //x = noise(off)*width;
    //y = noise(off+350)*height;
    // need to random walk a little off the canvas
    x = map(noise(off), 0, 1, 0, width);
    y = map(noise(off+350), 0, 1,0, height);
    //ellipse(x,y,20,20);
    drawShape(x, y, 50);
  }

  void move() {
    off+= 0.003;
  }

  void drawShape(float x, float y, float d) {
    //rect(x, y, d, d);
    //fill(random(255),random(255),random(255));
    fill(random(90));
    triangle(x-d, y-d/2, x, y+d,x+d,y-d/2);
    if (d >  level) {
      float newD = d * 0.5;
      drawShape(x + d, y+d/2, newD); // smaller right
      drawShape(x - d, y+d/2, newD); //smaller left
      drawShape(x, y - d, newD); //large center
    }
  }
}

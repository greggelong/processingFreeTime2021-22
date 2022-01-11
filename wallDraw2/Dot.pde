class Dot{
  float x;
  float y;
  color clr;
  float speedx;
  float speedy;

  Dot(float _x, float _y, color _clr, float _speedx, float _speedy) {
    x =_x;
    y = _y;
    clr = _clr;
    speedx = _speedx;
    speedy = _speedy;
  }

  void show() {
    fill(clr);
    ellipse(x, y, 10, 10);
  }
  void move() {
    x=x+speedx;
    y=y+speedy;
  }
  
  void edges() {
    if (x > width || x < 0){
      speedx = speedx * -1;
    }
    if (y > height || y <0){
      speedy =speedy * -1;
    } 
  }
}

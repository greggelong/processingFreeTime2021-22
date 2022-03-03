 // pixel array is so much faster
// a complex iterated function fractal
//  http://www.paulbourke.net/fractals/burnship/
// added photo press s and togel black and white b
int iter;
float maxx, minx;
float maxy, miny;
float zoom = 0.1;
boolean bw = false; // togle black and white with b
int clrMod = 64; // color modulo
int MN =3;  // set pos and neg min max -3 to 3 can change when zooming
void setup() {
  size(1028, 1028);
  //fullScreen();
  colorMode(HSB, clrMod);
  maxx =MN;
  minx=-MN;
  maxy=MN;
  miny=-MN;
}


void draw() {
  loadPixels();
  showmandel();
  updatePixels();
  //noLoop();
}

void mousePressed() {
  float x = map(mouseX, 0, width, minx, maxx);  // set the x on complex plane
  float y = map(mouseY, 0, height, miny, maxy); // s
  // center and zoom those coordinates
  maxx = x+zoom;
  minx = x-zoom;
  maxy = y+zoom;
  miny = y-zoom;

  zoom*=0.5;
  if (zoom<0.00001) {
    zoom=1;
    maxx =MN;
    minx=-MN;
    maxy=MN;
    miny=-MN;
  }
}

void mouseDragged(){
  // changes the number of hues used out of the total number of hues
  clrMod+= 1;
  // use this if you want to limit the absolute  number of hues
  //colorMode(HSB,clrMod);
  if (clrMod > 64) {
    clrMod = 1;
  }
}

void keyPressed() {
  if ( key == 's') {
    //save with the top coordinates as part of the name
    save("burnShip.minx."+minx+"miny."+miny+".png");
  }
  if (key == 'b'){
    if(bw == true){
      // togle off
     colorMode(HSB,64);
     bw = false;
      
    }else{
     // togle on
     colorMode(RGB,100);
     bw = true;
      
    }
    
  }
}

void showmandel() {
  //background(0);
  for (int y = 0; y <height; y++) {
    for (int x =0; x <width; x++) {
      // map the plottng x and y to the calculatin a and b (imag)
      float a = map(x, 0, width, minx, maxx);  // set the x on complex plane
      float b = map(y, 0, height, miny, maxy); //  yset y on  the complex plane
      float ca =a;
      float cb =b;
      // iterate 100 times to see if unbounded
      //println(a,b);
      iter =0;
      while (iter < 100) {
        // http://www.paulbourke.net/fractals/burnship/
        // x^2 -y^2 -c
        // 2 abs(x*y)-c
        float aa = (a*a)-(b*b);
        float bb = -2.0 *abs(a*b);  // negative to flip this

        a = aa -ca;//+map(mouseX,0,width,-2,2);// ca;
        b = bb -cb;// +map(mouseY,0,height,-2,2);// cb;

        if (abs(a+b)>16) {
          // set the break out point at orbit greater than 16
          // mandel brot only need 2 but looks better with higher numbers
          // not sure about this one must at least be greater than 3
          break;
        }
        iter++;
      }
      //println(iter);
      if (iter == 100) {
        pixels[x+y*width] =color(0, 0, 0);
      } else {
        if(bw){
           pixels[x+y*width] = color(100-iter);
        }else{
        pixels[x+y*width] = color(iter%clrMod, 100, 100);
        }
      }
    }
  }
}

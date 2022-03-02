// pixel array is so much faster
// a complex iterated function fractal
//  http://www.paulbourke.net/fractals/burnship/
int iter;
float maxx,minx;
float maxy, miny;
float zoom = 0.1;
int BOC = 64; // hsb color and max count to infinty
int BM = 64; // color modulo
int MN =5;
void setup() {
  size(1028, 1028);  
  //fullScreen();
  colorMode(HSB, BOC);
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

void mousePressed(){
   float x = map(mouseX, 0, width, minx, maxx);  // set the x on complex plane
   float y = map(mouseY, 0, height, miny, maxy); // s
   // center and zoom those coordinates
   maxx = x+zoom;
   minx = x-zoom;
   maxy = y+zoom;
   miny = y-zoom;
   
   zoom*=0.5;
   if (zoom<0.00001){
     zoom=1;
     maxx =MN;
  minx=-MN;
  maxy=MN;
  miny=-MN;
   }
 
}

void mouseDragged()
{
  println(BM);
  BM+= 1;
  if (BM > 64) {
    BM = 1;
  }
}

void keyPressed(){
 if( key == 'c'){
   
  maxx =2;
  minx=-2;
  maxy=2;
  miny=-2;
   
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

        if (abs(a+b)>BOC) {
         // println("I broke out");
          break;
          
        }
        iter++;
      }
      //println(iter);
      if (iter == 100) {
        pixels[x+y*width] =color(0,0,1);
      } else {
        pixels[x+y*width] = color(iter%BM,100,100);
      }
    }
  }
}

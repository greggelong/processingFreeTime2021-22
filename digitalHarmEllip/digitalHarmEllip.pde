float y;
float angx;
float frq=8;
int sz =5;
int lc = 1; //line count

void setup(){
 size(360,360);
 background(0);
 colorMode(HSB,8,100,100);
 translate(0, height/2);
 
  
  
}

void draw(){
 translate(0,height/2);
 fill((lc)%8,100,100,100);
 strokeWeight(2);
 noStroke();
 
 angx+=1;
 y= (-1*(sin(frq*radians(angx))*(120)/frq));
 ellipse(angx,y, sz,sz);
 
 if (angx > width){
  frq-=1;
  angx=0;
  lc++;
  
 }
 
 if (frq<1){
  frq=8; 
  delay(500);
  background(0);
 }
  
}

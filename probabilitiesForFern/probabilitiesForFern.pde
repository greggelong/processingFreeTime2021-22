float x;
float y;
int fc =0;
int red =0;
int yellow = 0;
int white = 0;
int green = 0;

void setup(){
 size(600,600);
 background(0);
 
  
}

void draw(){
 nextPont();
 fc++;
 println("T "+fc,"W "+white,"Y "+yellow,"G "+green,"R "+red);
 
 
 if(mousePressed){
  background(0); 
  fc = 0;
 }
}

void nextPont(){
  //float nextx,nexty;
  float r = random(1);
  // one percent
  if(r<0.01){
   x = random(0,width/2);
   y = random(0,height/2);
   strokeWeight(5);
   stroke(255);
   point(x,y);
   white++;
  }
  // 85 percent
  else if(r <0.86){
   x = random(width/2, width);
   y = random(height/2, width);
   strokeWeight(5);
   stroke(255,0,0);
   point(x,y);
   red++;
  }
  // 7 percent
  else if (r <0.93){
   x = random(width/2, width);
   y = random(0, height/2);
   strokeWeight(5);
   stroke(255,255,0);
   point(x,y);
   yellow++;
    
  }
  // 7 percent
  else{
   x = random(0,width/2);
   y = random(height/2, height);
   strokeWeight(5);
   stroke(0,255,0);
   point(x,y);
   green++;
    
  }
  
  
  
}

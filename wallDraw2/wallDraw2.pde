// will not reconize the class untill you put in a setup function!!!
Dot mydot;
Dot[] dots;
PImage img;
int num = 30;

void setup(){
  size(800,800);
  background(0);
  img = loadImage("sunf.jpg"); // add a picture, from wich to take line color
  img.resize(800,800);
  dots = new Dot[num]; // finish setting up the array
  
  // fill array
  for (int i= 0; i<num; i++) {  // fill with points
    float tmpx = random(width); 
    float tmpy = random(height);
    color tmpclr = color(random(255),random(255),random(255));
    float tmpspeedx = random(1,7);
    float tmpspeedy = random(1,7);
    
    dots[i]= new Dot(tmpx,tmpy,tmpclr,tmpspeedx,tmpspeedy);
    
  }
  
}

void draw(){
  
  background(200);
   
  for (int i =0; i <num; i++) {   // plot the lines with a nested array     
    dots[i].clr = img.get(int(dots[i].x),int(dots[i].y));//  change color based on image
    //dots[i].show();
    dots[i].edges();
    dots[i].move();
    for (int j =0; j < num; j++) { // not the most efficient will make duplicate lines
      float linclrx = lerp(dots[i].x, dots[j].x, .5);   
      float linclry = lerp(dots[i].y, dots[j].y, .5);
      color lnclr = img.get(int(linclrx), int(linclry));  // get color at mid poit of the line
      stroke(lnclr);
      line(dots[i].x, dots[i].y, dots[j].x, dots[j].y);
    }
  }
}
  
  
  
  

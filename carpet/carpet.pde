float level = 5;
void setup(){
  size(600,600);
  rectMode(CENTER);
  background(0,255,255);
  noStroke();
  fill(0);
  drawShape(300,300,200);
  
}

void draw(){
  
};

void mouseClicked() {
   background(0,255,255);
   level = map(mouseX,0, width,2,250);
   drawShape(300,300,200);
   
}

void drawShape(float x, float y, float d) {
  rect(x, y, d, d);
  if (d > level) {
    float newD = d * 1/3;
    drawShape(x + d, y, newD);
    drawShape(x - d, y, newD);
    drawShape(x , y + d, newD);
    drawShape(x , y - d, newD);
    drawShape(x + d, y + d, newD);
    drawShape(x - d, y - d, newD);
    drawShape(x- d , y + d, newD);
    drawShape(x +d , y - d, newD);
     
  }
}
 

float nx=1000;
float nxstart=1000;
float nystart=1000;
float ny=1000;
float off=100;
float sp = 0.003;
float sz;
int column=20;
int rows=20;
float ang;
color [] clrs = {#000000,#000000,#CE7D0B,#CE7D0B,#CE7D0B,#E1FF00};
void setup(){
  size(700,700);
  sz=width/column;
  background(0);
  frameRate(10);
  stroke(255);
  strokeWeight(4);
}

void draw(){
  background(0);
  sp=map(mouseY,0,height,0.3,-0.3);
  ny=nystart;
  for(int j =0;j<rows;j++){
    nx=nxstart; //reset noise x position
    for(int i=0;i<column;i++){
      ang = map(noise(nx,ny),0,1,0,TWO_PI);
     if(i%1==0){  // number per line
     pushMatrix();
     translate(i*sz,j*sz);
     rotate(ang);
     strokeWeight(random(5,20));
     int index = int(random(0,clrs.length));
     color clr = clrs[index];
     stroke(clr);
    
     line(0,0,sz+sz*2,0);
     popMatrix();
     }
     nx+=0.03;
  }
  ny+=0.03;
  }
  nystart+=sp;
  
  }

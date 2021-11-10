class Ball {
  float x;
  float y;
  float off;
  
  Ball(float tempx, float tempy, float tempoff){
    x= tempx;
    y= tempy;
    off = tempoff;
    
    
    
  }
  
  
  void  show(){
    //x = noise(off)*width;
    //y = noise(off+350)*height;
    // need to random walk a little off the canvas
    x = map(noise(off),0,1,-200,width+200);
    y = map(noise(off+350),0,1,-200,height+200);
    //ellipse(x,y,20,20);
    point(x,y);
    
    
  }
  
  void move(){
   off+= 0.003; 
    
    
    
  }
  
}

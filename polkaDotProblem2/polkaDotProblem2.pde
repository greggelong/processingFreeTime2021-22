// tried a few ways this was the simplest
// algorithm 
// if row and column are both even place a dot
// else if row and colum are both odd place a dot

float sz;
float nob= 8; // number of balls

void setup(){
 size(800,800); 
 sz = width/nob;
 background(255,255,0);
 fill(255,0,0);
 noStroke();
 
}

void draw(){
  background(255,255,0);
  nob = map(mouseX,0,width,4,80);
  sz=width/nob;
  
  for (int col =0; col <nob+1;col+=1){
    
  for (int row =0;row <nob+1;row+=1){
    // an ellipse every even row and even column
    if(row%2==0 && col%2==0){  
      ellipse(col*sz,row*sz,sz,sz);
    }
    // an ellipse at odd row and odd column
    else if(row%2==1 && col%2 ==1){
    
     ellipse((col*sz),row*sz,sz,sz);
    }
  }
   
 }
  
  
  
  
  
  
}

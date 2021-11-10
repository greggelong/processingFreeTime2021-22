
float pos;
int depth = 1;

void setup(){
 size(800,600);
 //fullScreen();
 background(255,140,0);
 stroke(0);
 strokeWeight(2);
 ellipse(200,200,20,20); 
 
 
}

void draw(){
   background(255,140,0);
   translate(0,height/2);
   
   //int depth2 = int(map(mouseX,0,width,0,5));
    //println(depth2);
     depth = int(map(mouseX,0,width,1,6));
    //caculate lenth so it fits on the canvas depth 5 is 10 pixles
   float ruleLenght = 10*(pow(3,5-depth));
    //koch(depth,ruleLenght)  //koch(depth of recursion, len of first rule
   koch(depth,ruleLenght);
}

void mouseClicked(){
   depth = int(map(mouseX,0,width,1,6));
  
  
}



void rule(float ln){
    ln /=3;
    // draw rule
    line(0,0,ln,0);
    translate(ln,0);
    rotate(radians(-60));
    line(0,0,ln,0);
    translate(ln,0);
    rotate(radians(120));
    line(0,0,ln,0);
    translate(ln,0);
    rotate(radians(-60));
    line(0,0,ln,0);
}
   
void koch(int order, float ln){
    if (order == 0){
       line(0,0,width,0);
    }
    if (order == 1){
        rule(ln);
     }
    else{
        order --;
        //println(order);
        koch(order,ln);
        pos = ln;
        
        pos =ln *0.3333;
        translate(pos,0);
        rotate(radians(-60));
        koch(order,ln);
        pos =ln *0.3333;
        translate(pos,0);
        rotate(radians(120));
        koch(order,ln);
        pos =ln *0.3333;
        translate(pos,0);
        rotate(radians(-60));
        koch(order,ln);
    }
}

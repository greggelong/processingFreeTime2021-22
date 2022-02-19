// simple turtle
// the turtles name is greg he is a pvector that is updated in
// mutation is in expression. plotted

float intheta =0;//turtle's theta
PVector greg;


String code = "x";
float ln = 6;

int index=0;
void setup() {
  size(800, 800);
  //fullScreen();
  background(0);
  stroke(0, 255, 0);
  strokeWeight(2);
  greg = new PVector(0, height);
 // make the code
  for (int i =0; i<7; i++) {
    ruleSub();
  }
  println(code.length());
  plotCodeMut();
  println(code.length());
  greg.x = 0;
  greg.y = height;
  intheta =0;
  stroke(0,255,255);
}

// simple turtle functions forward() right() left()
void forward(float amt) {

  float x2 = greg.x +amt *cos(radians(intheta));
  float y2 = greg.y +amt *sin(radians(intheta));
 
  line(greg.x, greg.y, x2, y2);
  // set the x and y to new position
  greg.x = x2;
  greg.y = y2;
}

void right(float deg) {
  intheta += deg;
  intheta = intheta%360;
}

void left(float deg) {
  intheta -= deg;
  intheta = intheta%360;
}


void ruleSub() {
  String result = "";
  for (int i =0; i<code.length(); i++) {
    if (code.charAt(i) == 'x') {      // must use char at cant uses code[i]
      result += "y+x+y";
    } else if (code.charAt(i) == 'y') {
      result += "x-y-x";
    } else {
      result += code.charAt(i);
    }
  }
  code = result;
}

void plotCode() {
  for (int i =0; i<code.length(); i++) {
   // println(i);
    char op = code.charAt(i);
    switch(op) {
    case 'x':
      forward(ln);
      break;
    case 'y':
      forward(ln);
      break;
    case '+':
      left(60);
      break;
    case '-':
      right(60);
      break;
    default:
      println("None");   // don't match the switch parameter
      break;
    }
  }
}

void plotCodeMut() {
  char op;
  for (int i =0; i<code.length(); i++) {
    if( floor(random(1000)) == 1){
     println("mutation!!!");
     fill(255,0,0);
     ellipse(greg.x,greg.y,20,20);
     op = '+';
    }else{
    op = code.charAt(i);
    }
    switch(op) {
    case 'x':
      forward(ln);
      break;
    case 'y':
      forward(ln);
      break;
    case '+':
      left(60);
      break;
    case '-':
      right(60);
      break;
    default:
      println("None");   // don't match the switch parameter
      break;
    }
  }
}

void animateCode(int index) {
   
    char op = code.charAt(index);
    switch(op) {
    case 'x':
      forward(ln);
      break;
    case 'y':
      forward(ln);
      break;
    case '+':
      left(60);
      break;
    case '-':
      right(60);
      break;
    default:
      println("None");   // don't match the switch parameter
      break;
    }
  
}
void draw() {
  //stroke(255,0,0);
  animateCode(index);
  index++;
  
  if (index >code.length()-1){
   background(0);
   index=0;
   greg.x =0;
   greg.y =height;
   intheta=0;
   stroke(random(255),random(255),random(255));
    
  }
   
  
}


void mousePressed(){
  
  // clear and draw with mutation
  background(0);
  stroke(0,255,0);
   index=0;
   greg.x =0;
   greg.y =height;
   intheta=0;
   plotCodeMut();
   // reset turtle position
   stroke(0,255,0);
   index=0;
   greg.x =0;
   greg.y =height;
   intheta=0;
   stroke(255,0,0);
  
}

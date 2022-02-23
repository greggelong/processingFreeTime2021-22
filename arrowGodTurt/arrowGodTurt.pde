// godel trutle drawing arrowhead triangle
// the turtles name is greg he is a pvector that is updated in
// left and right are swiched of odd or even levels

import processing.pdf.*;

float intheta =0;//turtle's theta
PVector greg;
float sz= 10;

int step =0;
String code = "x";
float ln = 6;
int level = 4;
int index=0;
void setup() {
  // size(1000, 1000,PDF,"godleArrow.pdf");
  size(1000, 1000);
  //fullScreen();
  background(0);
  textSize(sz);
  fill(0, 255, 0);
  greg = new PVector(0, height-5);
  // make the code
  for (int i =0; i<level; i++) {
    ruleSub();
  }
  println(code.length());
  //plotCode();
  println(code.length());
  greg.x = 0;
  greg.y = height;
  intheta =0;
  //beginRecord(PDF,"godleArrow.pdf");
}

// simple turtle functions forward() right() left()
void forward(float amt) {
  for (int m= 0; m<amt; m++) {
    step++;
    float x2 = greg.x +sz *cos(radians(intheta));
    float y2 = greg.y +sz *sin(radians(intheta));

    text(step, x2, y2);
    // set the x and y to new position
    greg.x = x2;
    greg.y = y2;
  }
}

void right(float deg) {
  intheta += deg;
  intheta = intheta%360;
}

void left(float deg) {
  intheta -= deg;
  intheta = intheta%360;
}


void poly(int s, int len) {
  float ang =360/s;
  for (int i=0; i<s; i++) {
    forward(len);
    left(ang);
  }
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
      if (level%2 ==1) {
        left(60);
      } else {
        right(60);
      }
      break;
    case '-':
      if (level%2 ==1) {
        right(60);
      } else {
        left(60);
      }
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
    if (level%2 ==1) {
      left(60);
    } else {
      right(60);
    }
    break;
  case '-':
    if (level%2 ==1) {
      right(60);
    } else {
      left(60);
    }
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
  //plotCode();
  // println("finished");
  //exit();


  if (index >code.length()-1) {
    //save("arrowGodelTurtle.png");

    // noLoop();
    background(0);
    index=0;
    greg.x =0;
    greg.y =height;
    intheta=0;
    step=0;
    fill(random(100,255), random(100,255), random(100,255));
  }
}

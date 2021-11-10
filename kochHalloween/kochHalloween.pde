
float pos;
int depth = 1;
Sier eye1, eye2, nose;

void setup() {
  size(800, 800);
  //fullScreen();
  background(255, 140, 0);
  rectMode(CENTER);
  stroke(0);
  ellipse(200, 200, 20, 20); 
  nose = new Sier(200, 200, 400, 7);
  eye1 = new Sier(300, 100, 100, 7);
  eye2 = new Sier(100, 100, 700, 7);
}

void draw() {
  background(255, 140, 0);
  // koch curve push
  pushMatrix();
   
  translate(0, height-height/3);

  //int depth2 = int(map(mouseX,0,width,0,5));
  //println(depth2);
  depth = int(map(mouseX, 0, width, 1, 6));
  strokeWeight(8-depth);
  //caculate lenth so it fits on the canvas depth 5 is 10 pixles
  float ruleLenght = 10*(pow(3, 5-depth));
  //koch(depth,ruleLenght)  //koch(depth of recursion, len of first rule
  koch(depth, ruleLenght);
  popMatrix();
  pushMatrix();
  strokeWeight(1);


  if (mousePressed) {
    nose.level = int(map(mouseY, 0, height, 2, 40));
    nose.x = 400;
    nose.y = 400;
    nose.showstat();
    nose.move();

    eye1.level = int(map(mouseY, 0, height, 2, 40));
    eye1.x = 200;
    eye1.y = 100;
    eye1.showstat();


    eye2.level = int(map(mouseY, 0, height, 2, 40));
    eye2.x = 600;
    eye2.y = 100;
    eye2.showstat();
  } else {
    nose.level = int(map(mouseY, 0, height, 2, 40));
    nose.show();
    nose.move();

    eye1.level = int(map(mouseY, 0, height, 2, 40));
    eye1.show();
    eye1.move();

    eye2.level = int(map(mouseY, 0, height, 2, 40));
    eye2.show();
    eye2.move();
  }
  popMatrix();
}

void mouseClicked() {
}



void rule(float ln) {
  ln /=3;
  // draw rule
  line(0, 0, ln, 0);
  translate(ln, 0);
  rotate(radians(60));
  line(0, 0, ln, 0);
  translate(ln, 0);
  rotate(radians(-120));
  line(0, 0, ln, 0);
  translate(ln, 0);
  rotate(radians(60));
  line(0, 0, ln, 0);
}

void koch(int order, float ln) {
  if (order == 0) {
    line(0, 0, width, 0);
  }
  if (order == 1) {
    rule(ln);
  } else {
    order --;
    //println(order);
    koch(order, ln);
    pos = ln;

    pos =ln *0.3333;
    translate(pos, 0);
    rotate(radians(60));
    koch(order, ln);
    pos =ln *0.3333;
    translate(pos, 0);
    rotate(radians(-120));
    koch(order, ln);
    pos =ln *0.3333;
    translate(pos, 0);
    rotate(radians(60));
    koch(order, ln);
  }
}

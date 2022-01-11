/*“On a wall surface, any
 continuous stretch of wall,
 using a hard pencil, place
 fifty points at random.
 The points should be evenly
 distributed over the area
 of the wall. All of the
 points should be connected
 by straight lines. “ -Wall drawing 118
 
 A complete graph also called a Full Graph
 it is a graph that has n vertices where
 the degree of each vertex is n-1.
 In other words, each vertex is connected with
 every other vertex.
 
 https://mathworld.wolfram.com/CompleteGraph.html
 
 Now, you have n vertices in total,
 so you might be tempted to say that there are
 n(n−1) edges in total, n−1 for every vertex in
 your graph. But this method counts every edge twice,
 because every edge going out from one
 vertex is an edge going into another vertex.
 Hence, you have to divide your result by 2.
 This leaves you with n(n−1)/2.
 */
PImage img;
float[] pointsx;  // arrays to hold x and y coords
float[] pointsy;
int num = 50; // change to add more or less points
void setup() {
  size(800, 800);
  //img= loadImage("gregNB.png");
  //img= loadImage("gregNoBack.jpg");
  img = loadImage("sunf.jpg"); // add a picture, from wich to take line color
  img.resize(800, 800);
  stroke(0, 30);
  background(255);
  pointsx = new float[num];  // finish declaring array
  pointsy = new float[num];
  for (int i= 0; i<num; i++) {  // fill with points
    pointsx[i] = random(width); 
    pointsy[i] = random(height);
  }

  for (int i =0; i<num; i++) {              // plot the points
    fill(img.get(int(pointsx[i]), int(pointsy[i])));
    ellipse(pointsx[i], pointsy[i], 10, 10);
  }
  for (int i =0; i <num; i++) {   // plot the lines with a nested array     
    for (int j =0; j < num; j++) { // not the most efficient will make duplicate lines
      float linclrx = lerp(pointsx[i], pointsx[j], .5);
      float linclry = lerp(pointsy[i], pointsy[j], .5);
      color lnclr = img.get(int(linclrx), int(linclry));
      stroke(lnclr, 127);
      line(pointsx[i], pointsy[i], pointsx[j], pointsy[j]);
    }
  }
}

void draw(){
  
}
void keyPressed(){
  save("solewitt"+frameCount+".jpg");
  
}

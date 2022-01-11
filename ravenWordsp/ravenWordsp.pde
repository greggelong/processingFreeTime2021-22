import guru.ttslib.*;
TTS tts;
String[] story;
int line =0;
int off;
float x;
PFont f;
void setup() {
  size(600, 600);
  background(0);
  tts = new TTS();
  f = createFont("Times New Roman Bold", 16, true); // Arial, 16 point, anti-aliasing on
  textFont(f, 36);
  off = 10;
  x = width/2;
  story = loadStrings("raven.txt");
  println(story.length);
   colorMode(HSB, story.length, 100, 100);
 
}

void draw() {
  
  background(0);
  textSize(height/15);
  fill(line, 200, 200);
  text(line, width-100, height-50);
  x = width;
  String[] mywords = split(story[line], ' ');
  for (int i =0; i < mywords.length; i++) {  //array length is not a function()

    textSize(height/8);
    if (x-off < 0 &&  i == mywords.length-1) {  // scroll control
      x = width;
      off = 10;
      tts.speak(story[line]); //speak the whole line
    }

    text(mywords[i], (x-off), height/2-(sin(i)*(height/3)));

    x+=textWidth(mywords[i]+50); // dynamically move size of text
  }
  off += 5;
  //println(off);
  //text(story[line],10,height-height/4);
}

void mousePressed() {
  //tts.speak(story[line]); //speak the whole line
  if (mouseY > height/2 && line < story.length-1) { //story is an array so length is not a function but story[i] is a string
    line++;
    x = width;
    off = 10;
  } else if (mouseY < height/2 && line > 0) {
    line--; 
    x = width;
    off = 10;
  }
}

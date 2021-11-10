// you should not use a String type in a switch case
// processing 3 lets you on the computer but not on android
// so I am switching the switch to ifs

String axiom = "BBBBBBBBBBBBBBBBBBBBBBBBABBBBBBBBBBBBBBBBBBBBBBBB";
String rule = "BABAABAB";   
//String rule = "BBBAAAAB";

String gen = axiom;
float x = 0;
float y = 0;
float sz = 0;


void setup() {
  size(400, 800);
  //fullScreen();
  fill(0);
  background(233, 203, 106);
  noStroke();
  sz =width/axiom.length();
  rect((((axiom.length()-1)/2)*sz), 0, sz, sz);
  y=1; //#printed the first square;
  frameRate(30);
}



void draw() {
  gen = replaceIt(gen);

  plotline(gen);

  if (y*sz > height) {
    y=0;
    //background(233, 203, 106);
  }
}


void mousePressed(){
  save("rule90"+str(frameCount)+".png");
  
  
}

void plotline(String gen) {

  for (int ind =0; ind < gen.length(); ind++) {
    if (gen.charAt(ind) == 'A') {
      //fill(128,181,151);
      fill(0);
    } else {
      fill(233, 203, 106);
    }
    rect(ind*sz, y*sz, sz, sz);
  }
  y=y+1;
}       



String replaceIt(String currGen) {
  String nextGen = "";
  for (int i =0; i<currGen.length(); i++) {
    //println(currGen.charAt(((((i-1)%currGen.length())+currGen.length())%currGen.length())));
    //((((i-1)%20)+20)%20)
    String one = str(currGen.charAt(((((i-1)%currGen.length())+currGen.length())%currGen.length())));
    String two = str(currGen.charAt(i));
    String three = str(currGen.charAt((i+1)%currGen.length()));
    String threeText = one+two+three;
   
    if (threeText.equals("AAA")){              //128
      nextGen = nextGen + str(rule.charAt(0));
    }
    else if (threeText.equals("AAB")){   //64
      nextGen = nextGen + str(rule.charAt(1));
    }

    else if (threeText.equals("ABA")){  //32
      nextGen = nextGen + str(rule.charAt(2));
    }

    else if (threeText.equals("ABB")){ //16
      nextGen = nextGen + str(rule.charAt(3));

    }

    else if (threeText.equals("BAA")){  //8
      nextGen = nextGen + str(rule.charAt(4));
    }

    else if (threeText.equals("BAB")){  //4
      nextGen = nextGen + str(rule.charAt(5));
    }
    else if (threeText.equals("BBA")){    //2
      nextGen = nextGen + str(rule.charAt(6));
    }
    else if (threeText.equals("BBB")){    //1
      nextGen = nextGen + str(rule.charAt(7));

    }
    }
   return nextGen;
}
 

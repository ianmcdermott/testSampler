import beads.*;
import java.util.Arrays; 

AudioContext ac;
String audioFile1;
String audioFile2;
String audioFile3;
Gain g;
int focusRad  = 105;
SamplePlayer player1;
SamplePlayer player2;
SamplePlayer player3;
SamplePlayer player;

ArrayList<FocusRange>focusRange;

int minCount = 0;
int maxCount = 100;

void setup() {
  size(300, 300);
  ac = new AudioContext();

  audioFile1 = sketchPath("") +"0.wav";
  audioFile2 = sketchPath("") +"1.wav";
  audioFile3 = sketchPath("") +"2.wav";
  println(audioFile1);

  player1 = new SamplePlayer(ac, SampleManager.sample(audioFile1));
  player2 = new SamplePlayer(ac, SampleManager.sample(audioFile2));
  player3 = new SamplePlayer(ac, SampleManager.sample(audioFile3));

  g = new Gain(ac, 2, 0.2);
  g.addInput(player1);
  ac.out.addInput(g);
  ac.start();
}

void fileSelected(File selection) {
  String audioFileName = selection.getAbsolutePath();
  //println((audioFileName));
  SamplePlayer newPlayer = new SamplePlayer(ac, SampleManager.sample(audioFile1));

  focusRange.add(new FocusRange(focusRange.size(), minCount, maxCount, SamplePlayer));
  minCount = maxCount + 1;
  maxCount += 100;
}

void draw() {
  background(255, 0, 0);
  checkFocus(focusRad);
}

void keyPressed() {
  switch(key) {
  case '1':
    g.clearInputConnections();
    g.addInput(player1);
    break;
  case '2':
    g.clearInputConnections();    
    g.addInput(player2);
    break;
  case '3':
    g.clearInputConnections();    
    g.addInput(player3);
    break;
  case 'p':
    focusRad += 100;
    break;
  case 'o':
    focusRad -= 100;
    break;
  case 'f':
    selectInput("Select an audio file:", "fileSelected");
    break;
  }
}

void checkFocus(int rad) {
  for (FocusRange fr : focusRange) {
    if (rad > fr.min && rad < fr.max) {
      g.clearInputConnections();
      g.addInput(fr.player);
      break;
    }
  }

//  if (rad > 0 && rad < 100) {
//    g.clearInputConnections();
//    g.addInput(player1);
//  } else  if (rad >= 100 && rad < 200) {
//    g.clearInputConnections();    
//    g.addInput(player2);
//  } else  if (rad >= 200 && rad < 300) {
//    g.clearInputConnections();    
//    g.addInput(player3);
//  }
}

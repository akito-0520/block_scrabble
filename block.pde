import ddf.minim.*; //<>//
Minim minim;
import javax.swing.*;
import java.awt.*;
JPanel panel = new JPanel();
BoxLayout layout = new BoxLayout( panel, BoxLayout.Y_AXIS );
AudioPlayer PbackSounds, EbackSounds, SbackSounds, soundEffects, subMusic, subEffect[] = new AudioPlayer [3];
String filename = "data/score.txt";
String NArrays [] = new String [10], Escore [] = new String [10];
int PArrays [] = new int [10], CArrays [] = new int [10];
String names;
int rightLine = 400, leftLine = 0, overLine = -400, underLine = 0;
int backCount = 0;
float block_x, block_y;
boolean blocks, block_down = false;
float bx = 160, by = -400;
float fR = 40, bv = 0.0, bv2;
String game_mode = "initial";
PImage [] PIblocks = new PImage [8];
boolean Smusic = true;
boolean pause = false, pauseLock = false;
boolean Pscore = false, PscoreLock = false;

void setup() {
  size(500, 600);
  colorMode(HSB, 360, 100, 100);
  PFont font = createFont("Meiryo", 30);
  textFont(font);
  blocks = false;
  for (int i=1; i<=7; i++) {
    PIblocks [i] = loadImage(str(i)+".PNG");
  }
  minim = new Minim(this);
  EbackSounds = minim.loadFile("12.mp3");
  SbackSounds = minim.loadFile("13.mp3");
  soundEffects = minim.loadFile("14.mp3");
  soundEffects.setGain(20);
  subMusic = minim.loadFile("15.mp3");
  String Pscore [] = loadStrings(filename);
  for (int i=1; i<3; i++) {
    subEffect[i] = minim.loadFile((i+6)+".mp3");
  }
  for (int i=0; i<Pscore.length; i++) {
    String ten [] = split(Pscore [i], ',');
    name[i] = ten [0];
    point[i] = int(ten [1]);
    count[i] = int(ten [2]);
  }
  Canvas canvas = (Canvas) surface.getNative();
  pane = (JLayeredPane) canvas.getParent().getParent();
  panel.setLayout(layout);
  panel.add( new JLabel( "これでいいですか？" ) );
  field.setBounds(125, 300, 250, 50);
  pane.add(field);
}

void draw() {
  frameRate(fR+bv);
  if (game_mode == "initial") {
    backgrounds();
    Field();
    noLoop();
  }
  if (game_mode == "starting") {
    backgrounds();
  }

  if (game_mode == "playing") {
    translate(50, 500);
    backgrounds();
    if (pause == false) {
      falling();
      disturbance();
      break_down();
      blockCoordinates();
    }
  }

  if (game_mode == "ending") {
    backgrounds();
  }
}

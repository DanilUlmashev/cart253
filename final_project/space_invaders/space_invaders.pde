import processing.sound.*;

GameMenue gameMenue;
Game game;
String gameState;

SoundFile gameMusic = null;
SoundFile menuMusic = null;
SoundFile laserSound = null;
SoundFile laserSound2 = null;
SoundFile buttonSound = null;
SoundFile expSound = null;
SoundFile expSound2 = null;

void setup() {
  background(0);
  size(600, 800, FX2D);
  laserSound = new SoundFile(this, "laser3.wav");
  laserSound2 = new SoundFile(this, "laser1.wav");
  buttonSound = new SoundFile(this, "button.aif");
  expSound = new SoundFile(this, "exp3.wav");
  expSound2 = new SoundFile(this, "exp2.wav");
  gameState = "START";
  gameMenue = new GameMenue();
  game = new Game();
  
  
  String[] fontList = PFont.list();
  printArray(fontList);
}

void draw() { 
  background(0);
  if (gameState != "PLAY") {
    if (gameMusic != null) {
      gameMusic.stop();
      gameMusic = null;
    }
    if (menuMusic == null) {
      menuMusic = new SoundFile(this, "intro.mp3");
      menuMusic.loop();
    }
  }
  else {
    if (menuMusic != null) {
      menuMusic.stop();
      menuMusic = null;
    }
    if (gameMusic == null) {
      gameMusic = new SoundFile(this, "gamePlay.mp3");
      gameMusic.loop();
    }
  }
  if (gameState == "START") {
    gameMenue.startGame();
  } else if (gameState == "LOSE") {
    gameMenue.loseGame();
  } else if (gameState == "CHOOSE") {
    gameMenue.choosePlayer();
  } else if (gameState == "BEGIN") {
    gameMenue.beginGame();
  } else if (gameState == "PLAY") {
    game.draw();
  }
}
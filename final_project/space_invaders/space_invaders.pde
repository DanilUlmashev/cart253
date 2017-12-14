//


// Importing sound library.
import processing.sound.*;


// Declaring game objects. 
GameMenue gameMenue;
Game game;

// Declaring game state.
String gameState;

// Declaring game font.
PFont gameFont;


// Declaring individual sound files. 
SoundFile gameMusic = null;
SoundFile menuMusic = null;
SoundFile laserSound = null;
SoundFile laserSound2 = null;
SoundFile buttonSound = null;
SoundFile expSound = null;
SoundFile expSound2 = null;


// Game setup.
void setup() {
  
  // Creating the font
  gameFont = createFont("Krungthep", 32);
  textFont(gameFont);
  
  // Setting the screen.
  background(0);
  size(600, 800, FX2D);
  
  // Initializing the sounds.
  laserSound = new SoundFile(this, "laser3.wav");
  laserSound2 = new SoundFile(this, "laser1.wav");
  buttonSound = new SoundFile(this, "button.aif");
  expSound = new SoundFile(this, "exp3.wav");
  expSound2 = new SoundFile(this, "exp2.wav");
  
  // Initializing main game objects (game menue and game play).
  gameState = "START";
  gameMenue = new GameMenue();
  game = new Game();
}


// Draw loop.
void draw() { 
  background(0);
  
  // Controlling the music in menue and game play.
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
  
  // Drawing various states of the game and game menue.
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
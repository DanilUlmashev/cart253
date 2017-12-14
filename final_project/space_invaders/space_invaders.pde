GameMenue gameMenue;
Game game;
String gameState;

void setup() {
  background(0);
  size(600, 800, FX2D);
  gameState = "START";
  gameMenue = new GameMenue();
  game = new Game();
}

void draw() { 
  background(0);
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
  if (game.player.lives == 0) {
    gameState = "LOSE";
  }
}
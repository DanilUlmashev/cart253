class GameMenue {

  Button button;
  Button button1;
  Button button2;
  Button button3;
  Button button4;

  int x, y, sizex, sizey;

  GameMenue() {
    x = width/2;
    y = height/2;

    button = new Button(width/2, height/2, "Start");
    button1 = new Button(0 + 150, height - 100, "Ship 1");
    button2 = new Button(width - 150, height - 100, "Ship 2");
    button3 = new Button(width/2, height/2, "Play");
    button4 = new Button(width/2, height/2 + 100, "Return");
  }

  void startGame() {
    button.draw();
    if (button.buttonPressed()) {
      gameState = "CHOOSE"; // for testing, put back to CHOOSE
    }
  }

  void choosePlayer() {
    button1.draw();
    button2.draw();
    if (button1.buttonPressed()) {
      gameState = "BEGIN";
    }
    if (button2.buttonPressed()) {
      gameState = "BEGIN";
    }
  }

  void beginGame() {
    button3.draw();
    button4.draw();
    if (button3.buttonPressed()) {
      gameState = "PLAY";
    }
    if (button4.buttonPressed()) {
      gameState = "START";
    }
  }

  void loseGame() {
    textSize(50);
    text("Game Over", x, y);
    textAlign(CENTER);
  }
} 
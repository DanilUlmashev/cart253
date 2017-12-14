// class GameMenue defines the game menue and cotrolles menue navigation.

class GameMenue {

  
  // Declaring button objects.
  Button buttonStart;
  Button buttonChooseShip1;
  Button buttonChooseShip2;
  Button buttonPlay;
  Button buttonReturn;
  
  // declaring sample player ships for player to chose fomr.
  Player ship1;
  Player ship2;


  // Constructor.
  GameMenue() {
    
    // Initializing the button.
    buttonStart = new Button(width/2, height/2, "Start");
    buttonChooseShip1 = new Button(0 + 150, height - 100, "Ship 1");
    buttonChooseShip2 = new Button(width - 150, height - 100, "Ship 2");
    buttonPlay = new Button(width/2, height/2, "Play");
    buttonReturn = new Button(width/2, height/2 + 100, "Return");
    
    // Initializing the sample ships.
    ship1 = new Player(15);
    ship1.setTypeOne();
    ship1.x = buttonChooseShip1.x - 52;
    ship1.y = buttonChooseShip1.y - 300;
    ship2 = new Player(15);
    ship2.setTypeTwo();
    ship2.x = buttonChooseShip2.x - 52;
    ship2.y = buttonChooseShip2.y - 300;
  }


  // Drawing the menue for the "START" state
  void startGame() {
    textSize(50);
    textAlign(CENTER);
    text("Space Invaders", width/2, height/2 - 200);
    buttonStart.draw();
    if (buttonStart.buttonPressed()) {
      gameState = "CHOOSE"; // for testing, put back to CHOOSE
    }
  }

  
  // Drawing the menue for the "CHOOSE" state
  // Allows the player to choose from two types of sample ships.
  void choosePlayer() {
    buttonChooseShip1.draw();
    buttonChooseShip2.draw();
    stroke(0);
    ship1.draw();
    ship2.draw();
    
    // Allowing to chooe a type of ship that player will play with.
    if (buttonChooseShip1.buttonPressed()) {
      game.player.setTypeOne();
      gameState = "BEGIN";
    }
    if (buttonChooseShip2.buttonPressed()) {
      gameState = "BEGIN";
      game.player.setTypeTwo();
    }
  }

  // Drawing the menue for the "PLAY" state
  void beginGame() {
    buttonPlay.draw();
    buttonReturn.draw();
    if (buttonPlay.buttonPressed()) {
      gameState = "PLAY";
    }
    if (buttonReturn.buttonPressed()) {
      gameState = "START";
    }
  }


  // Drawing the menue for the "LOSE" state
  void loseGame() {
    textSize(50);
    textAlign(CENTER);
    text("Game Over", width/2, height/2 - 200);
    buttonReturn.draw();
    if (buttonReturn.buttonPressed()) {
      game.reset();
      gameState = "START";
    }
  }
} 
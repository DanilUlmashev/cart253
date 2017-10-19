// ********************
// PONG MIDTERM GAME
// Main game class
// The purpose of the game is to remove all the obsticles by hiting them with the ball,
// and at the same time, not to let the ball pass by the player's paddle.
// Player that lost the ball most time when the last obsticle is gone, loses the game.
// CART 253-B
// Due 18 October, 2017
// ********************

// Declearing background objects of the game
Bugs backgroundBugs;
Field backgroundField;

// Declaring the ball object
Ball ball;

// Declaring paddle bjects
Paddle paddleLeft;
Paddle paddleRight;

// Declaring obsticles
Obsticles obsticles;

// Declaring the scores
int scoreLeft;
int scoreRight;
int numberObsticlesActive;

void setup() {
  size(1080, 630);
  background(0);
  resetGame();
}

// Resetting the game to initial state
void resetGame() {
  // Initializing active objects of the game
  backgroundBugs = new Bugs();
  backgroundField = new Field();
  ball = new Ball(width/3, height/4, 25);
  obsticles = new Obsticles();
  scoreLeft = 0;
  scoreRight = 0;
  
  // Initializing left paddle (move up/down with "w"-87 and "x"-88 keys)
  paddleLeft = new Paddle(true, 10, 120, 10, 87, 88);
  
  // Initializing left paddle (move up/down with "UP"-38 and "DOWN"-40 keys)
  paddleRight = new Paddle(false, 10, 120, 10, 38, 40);
}

void draw() {
  background(0);
  
  // If active obsticles are present in the game,
  // continue playing
  if (numberObsticlesActive > 0) {
    // Handling objects states and updating their positions 
    backgroundBugs.moveBugs();
    ball.handleBall();
    paddleLeft.handleBall(ball);
    paddleRight.handleBall(ball);  
    obsticles.handleBall(ball);
  
    // Drawing the objects
    backgroundBugs.displayBugs();
    backgroundField.displayField();
    ball.displayBall();
    paddleLeft.display();
    paddleRight.display();
    obsticles.display();
    
    // Drawing the scores
    fill(255);
    textSize(64);
    text(scoreLeft, 100, 60);
    text(scoreRight, width - 130, 60);
  }
  
  // If no active obsticle is left in the game,
  // stop the game
  else {
    fill(255);
    textSize(64);
    text("Game Finished", 300, 300);
    if (scoreLeft > scoreRight) {
      text("Right Player Won", 270, 400);
    }
    else if (scoreLeft < scoreRight) {
      text("Left Player Won", 290, 400);
    }
    else {
      text("It's a draw", 370, 400);
    }
  }
  
  println(numberObsticlesActive);
}

// Resetting the game if mouse pressed
void mousePressed() {
  resetGame();
}

// Moving the paddles
void keyPressed() {
  paddleLeft.movePaddle(keyCode);
  paddleRight.movePaddle(keyCode);
}

// Stop moving the paddles
void keyReleased() {
  paddleLeft.stopPaddle(keyCode);
  paddleRight.stopPaddle(keyCode);
}
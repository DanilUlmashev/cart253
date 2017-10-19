// ********************
// PONG MIDTERM GAME
// Ball class
// Represents the ball that people play with in the game.
// CART 253-B
// Due 18 October, 2017
// ********************

class Ball {
  
  // Declaring the class variables
  float x;
  float y;
  float vX;
  float vY;
  float speed = 7;
  float size;
  
  Ball(float tempX, float tempY, float tempSize) {
    // Initializing
    x = tempX;
    y = tempY;
    size = tempSize;
    vX = -speed;
    vY = speed;
  }
  
  // Handle ball movements
  void handleBall() {
    moveBall();
    resetBall();
    if (y > height - size/2 || y < 0 + size/2) {
      bounceY();
    }
  }
  
  // Moving ball according to its speed
  void moveBall() {
    x += vX;
    y += vY;
  }
  
  // Resetting ball if it is out of the field
  void resetBall() {
    // Out to the right
    if (x - size > width) {
      x = width/3;
      y = height/4;
      vX = -speed;
      vY = speed;
      // Udating the "global" left score varible
      scoreLeft++;
    }
    // Out to the left
    if (x + size < 0) {
      x = width - width/3;
      y = height/4;
      vX = speed;
      vY = speed;
      // Udating the "global" right score varible
      scoreRight++;
    }
  }
  
  // Bouncing the ball from horizontal surface
  void bounceY() {
    vY = -vY;
  }
  
  // Bouncing the ball from vertical surface
  void bounceX() {
    bounceX(0);
  }
  
  // Bouncing the ball from vertical surface with coefficient
  // to manage the bouncing angle
  void bounceX(float k) {
    vX = -vX + k;
  }
  
  // Drawing the ball
  void displayBall() {
    noStroke();
    fill(255);
    ellipse(x, y, size, size);
  }
}
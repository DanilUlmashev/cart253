// ********************
// PONG MIDTERM GAME
// Obsticle class
// Represents a single obsticle in the game.
// CART 253-B
// Due 18 October, 2017
// ********************

class Obsticle {
  
  // Declaring the class variables
  float x;
  float y;
  float size;
  boolean active;
  
  Obsticle(float tempX, float tempY, float tempSize) {
    // Initializing
    x = tempX;
    y = tempY;
    size = tempSize;
    active = true;
  }
  
  // Handling the interactions with the ball
  void handleBall(Ball ball) {
    if (active) {
      // Checking if obticle is touched by the ball
      // and disabling the obsticle, if touched
      if (isTouchedHorizontal(ball)) {
        ball.bounceX();
        active = false;
      }
      else if(isTouchedVertical(ball)) {
        ball.bounceY();
        active = false;
      }
    }
  }
  
  // Checking if ball crosses into the obsticle from left or right sides
  boolean isTouchedHorizontal(Ball ball) {
    if (ball.x + ball.size/2 > x -  size/2 && ball.x - ball.size/2 < x + size/2 && ball.y < y + size/2 && ball.y > y - size/2) {
      return true;
    }
    return false;
  }
  
  // Checking if ball crosses into the obsticle from top or bottom sides
  boolean isTouchedVertical(Ball ball) {
    if (ball.y + ball.size/2 > y - size/2 && ball.y - ball.size/2 < y + size/2 && ball.x < x + size/2 && ball.x > x - size/2) {
      return true;
    }
    return false;
  }
  
  // Drawing the obsticle
  void displayObstacle() {
    if (active) {
      rectMode(CENTER);
      stroke(200);
      strokeWeight(3);
      fill(200, 30, 30, 200);
      rect(x, y, size, size, 6);
    }
  }
}
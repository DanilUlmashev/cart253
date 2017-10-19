// ********************
// PONG MIDTERM GAME
// Paddle class
// Represents the paddle that moves and bounces the ball.
// Could be for left and right players.
// CART 253-B
// Due 18 October, 2017
// ********************

class Paddle {
  
  // Declaring the class variables
  float x;
  float y;
  float vX;
  float vY;
  float speed;
  float sizeX;
  float sizeY;
  
  // Holds the key codes that move the paddle up and down
  int codeUp;
  int codeDown;

  Paddle(boolean isLeft, float tempSizeX, float tempSizeY, float tempSpeed, int tempCodeUp, int tempCodeDown) {
    // Initializing the paddle
    if (isLeft) {
      // If for the left player
      x = tempSizeX;
      y = height / 2;
    }
    else {
      // If for the right player
      x = width - tempSizeX;
      y = height / 2;
    }
    speed = tempSpeed;
    sizeX = tempSizeX;
    sizeY = tempSizeY;
    codeUp = tempCodeUp;
    codeDown = tempCodeDown;
  }
  
  // Checking if paddle is touched by the ball from left or right sides
  boolean isTouchedHorizontal(Ball ball) {
    if (ball.x + ball.size/2 > x -  sizeX/2 && ball.x - ball.size/2 < x + sizeX/2 && ball.y < y + sizeY/2 && ball.y > y - sizeY/2) {
      return true;
    }
    return false;
  }
  
  // Checking if paddle is touched by the ball from top or bottom sides
  boolean isTouchedVertical(Ball ball) {
    if (ball.y + ball.size/2 > y - sizeY/2 && ball.y - ball.size/2 < y + sizeY/2 && ball.x < x + sizeX/2 && ball.x > x - sizeX/2) {
      return true;
    }
    return false;
  } 
  
  // Handling the ball bouncing from the paddle
  void handleBall(Ball ball) {
    if (isTouchedHorizontal(ball)) {
      float h = sizeY/2;
      float k = random(-0.5, 0.5);
      if (ball.y > y) {
        float dif = ball.y - y;
        if (dif > h - h/3) {
          k = random(0.5, 1);
        }
        else if (dif > h - h/2) {
          k = random(0, 0.5);
        }
      }
      else {
        float dif = y - ball.y;
        if (dif > h - h/3) {
          k = random(-1, -0.5);;
        }
        else if (dif > h - h/2) {
          k = random(-0.5, 0);;
        }
      }
      ball.bounceX(k);
    }
    else if (isTouchedVertical(ball)) {
      ball.bounceY();
    }
  }
  
  // Moving the paddle if the right keys are pressed
  void movePaddle(int kCode) {
    if (kCode == codeUp) {
      vY = -speed;
    } else if (kCode == codeDown) {
      vY = speed;
    }
  }
  
  void stopPaddle(int kCode) {
    if (kCode == codeUp || kCode == codeDown) {
      vY = 0;
    }
  }
  
  // Drawing the paddle
  void display() {
    y += vY;
    y = constrain(y, sizeY/2, height - sizeY/2);
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(x, y, sizeX, sizeY);
  }
}
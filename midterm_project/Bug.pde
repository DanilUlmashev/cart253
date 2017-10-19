// ********************
// PONG MIDTERM GAME
// Background bug class
// Represents a single object in the background noise
// CART 253-B
// Due 18 October, 2017
// ********************

class Bug {
  
  // Declaring the class variables
  float x;
  float y;
  float size = 5;
  float speed = 7;

  Bug(float tempX, float tempY, float tempSize) {
    // Initializing
    x = tempX;
    y = tempY;  
    size = tempSize;
  }
  
  // Handle bug movements
  void moveBug() {
    // Randomly assigning the directin to move to
    int direction = int(random(4));
    if (direction == 0) {
      x += speed;
    }
    else if (direction == 1) {
      x -= speed;
    }
    else if (direction == 2) {
      y += speed;
    }
    else {
      y -= speed;
    }
    x = constrain(x, 0 + size/2, width - size/2);
    y = constrain(y, 0 + size/2, height - size/2);
  }
  
  // Drawing the bug
  void display() {
    stroke(random(255), random(255), random(2585), 100);
    strokeWeight(1);
    fill(random(255), random(150), random(175), random(250));
    ellipse(x, y, size, random(6));
  }
}
// Eater class
// Represents the square creature that eats other creatures.
// This object randomly moves around the screen

class Eater {

  float x;
  float y;
  int size = 20;

  Eater(float tempX, float tempY, int tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
  }

  void move() {
    float directionX = (random(-0.5, 0.5));
    float directionY = (random(-0.5, 0.5));
    x += size * directionX;
    y += size * directionY;

    if  (x > width) {
      x = x - width;
    }
    if (x < 0) {
      x = x + width;
    }
    if (y > height) {
      y = y - height;
    }
    if (y < 0) {
      y = y + height;
    }
  }

  void display() {

    rectMode(CENTER);
    stroke(100, 50, 150);
    strokeWeight(1);
    fill(10, 10, 200);
    rect(x, y, size, size);
  }
}
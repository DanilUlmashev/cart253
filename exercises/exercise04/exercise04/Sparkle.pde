// Sparkle class
// A class defining the behaviour of a single sparkle .
// It moves in random directions, flickers by changing the size and changes the color when meets other creatures.

class Sparkle {

  float x;
  float y;
  float size;

  boolean active;

  Sparkle(float tempX, float tempY, float tempSize) {
    x = tempX;
    y = tempY;
    size = tempSize;
    active = true;
  }

  void move() {
    int directionX = int(random(-2, 2));
    int directionY = int(random(-2, 2));
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

  void changeColor() {
    stroke(100, 50, 150);
    strokeWeight(1);
    fill(#33FF15);
    ellipse(x, y, random(size), random(size));
  }



  void display() {
    if (active) {
      stroke(100, 50, 150);
      strokeWeight(1);
      fill(50, 150, 100);
      ellipse(x, y, random(size), random(size));
    }
  }
}
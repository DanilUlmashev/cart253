
class Ball {

  float x, y, vx, vy, size, speed, fillColor;


  Ball(float tempX, float tempY, float tempSize, float tempSpeed) {
    x = tempX;
    y = tempY;
    size = tempSize;
    speed = tempSpeed;
    vx = random(speed);
    vy = random(speed);
  }

  void update() {
    x += vx;
    y += vy;

    if (x + size/2 > width || x - size/2 < 0) {
      vx = -vx;
    }
    if (y + size/2 > height || y - size/2 < 0) {
      vy = -vy;
    }
  }

  void display() {
    fill(random(20, 200));
    noStroke();
    rectMode(CENTER);
    rect(x, y, size, size, 10);
  }
}
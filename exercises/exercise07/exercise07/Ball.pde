
class Ball {

  float x, y, vx, vy, size, speed, fillColor;
  
  SoundFile pitch = null;

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
      if (pitch != null) {
        pitch.play();
      }
    }
    if (y + size/2 > height || y - size/2 < 0) {
      vy = -vy;
      if (pitch != null) {
        pitch.play();
      }
    }
  }

  void display() {
    fill(random(20, 250), random(0, 0), random(0, 0));
    noStroke();
    rectMode(CENTER);
    ellipse(x, y, size, size);
  }
}
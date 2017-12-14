class Ball {

  // Variables for position and velocity
  float x;
  float y;
  float vx;
  float vy;
  float size, value;

  Ball(int xpos, int ypos) {
    x = xpos;
    y = ypos;

    size =  random(-7, 7);
    value = random(0, 5);

    float theta = random(TWO_PI);
    float speed = random(-6, 6);

    vx = (cos(theta)*speed) + size;
    vy = (sin(theta)*-speed) + value;
  }

  void draw() {
    noStroke();
    fill(255);
    rect(x, y, size, size);
    update();
  }

  void update() {
    x += vx;
    y += vy;
  }

  boolean outside() {
    return (x > width || x < 0 || y > height || y < 0);
  }
}
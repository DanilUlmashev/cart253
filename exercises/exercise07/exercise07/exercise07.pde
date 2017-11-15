import processing.sound.*;

ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
  size(640, 480);
  background(0);
}

void draw() {
  // Drawing and playing while mouse button is pressed
  if (mousePressed) {
    background(0);
    for (Ball ball : balls) {
      float newRate = map(mouseX, 0, width, 0.01, 10);
      ball.pitch.rate(newRate);
      ball.update();
      ball.display();
    }
  }
}

void keyPressed() {
  // 50 - "2" add
  if (keyCode == 50 && balls.size() < 14) {
    Ball ball = new Ball(random(width - 5), random(height - 5), random(10, 30), random(2, 10));
    ball.pitch = new SoundFile(this, "p" + balls.size() + ".aif");
    balls.add(ball);
  }
  
  // 49 - "1" remove
  if (keyCode == 49 && balls.size() > 0) {
    balls.remove(0);
  }
}
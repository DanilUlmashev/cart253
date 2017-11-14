import ddf.minim.*;

Ball[] ball = new Ball[10];

boolean active;

void setup() {
  size(640, 480);
  background(0);

  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Ball(random(width), random(height), random(20), random(2, 10));
  }
}


void draw() {

  if (mousePressed) {
    background(0);
    for (int i = 0; i < ball.length; i++) {
      ball[i].update();
      ball[i].display();
    }
  }
  else {
  background(0);
  }
}

void mousePressed() {
  active = true;
} 
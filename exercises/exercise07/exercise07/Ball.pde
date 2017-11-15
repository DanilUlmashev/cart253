// A class that defines a circle that can bounce around on the screen
// at a specific velocity.
class Ball {

  // Parameteres of the class
  float x, y, vx, vy, size, speed, fillColor;
  
  // SoundFile object for reading sound files
  SoundFile pitch;

  // Constructor 
  Ball(float tempX, float tempY, float tempSize, float tempSpeed) {
    x = tempX;
    y = tempY;
    size = tempSize;
    speed = tempSpeed;
    vx = random(speed);
    vy = random(speed);
    pitch = null;
  }

  // Adds the Ball's current velocity to its position
  // and checks for bouncing off the walls.
  // Adds pitch to the ball
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
  // Draw an ellipse in the Ball's location, with its size
  // and with its fill
  void display() {
    fill(random(20, 250), random(0, 0), random(0, 0));
    noStroke();
    rectMode(CENTER);
    ellipse(x, y, size, size);
  }
}
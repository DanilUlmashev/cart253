// Ball
// A class that defines a ball object that bouces in the screen.

class Ball {
  
  // Variables for position and velocity
  float x;
  float y;
  float vx;
  float vy;


// Constructor Ball() cretates a ball
  Ball() {
    // Initial position of the ball on x and y axis is in a middle if the display screen
    x = width/2;
    y = height/2;
    
    // Setting the size of the angle theta
    float theta = random(TWO_PI);
    
    // speed of the moving ball  
    float speed = random(-4, 4);
    
    // Velocity of x and y accoroding to their sin and cos values of the angle theta
    vx = cos(theta)*speed;
    vy = sin(theta)*speed;
  }


// Draws an ellipse accorind to its x and y positions and a color that it gets
// from the pixels of the camera input 
  void display() {
    noStroke();
    color c = video.get(int(x), int(y));
    fill(c, 25);
    ellipse(x, y, 10, 10);
  }


// Updates the current position of the ball and checks if the ball hits the edges of the  display screen. 
  void move() {
    x += vx;
    y += vy;

    if (y < 0) {
      vy = -vy;
    }
    if (y > height) {
      vy = -vy;
    }
    if (x < 0) {
      vx = -vx;
    }
    if (x > width) {
      vx = -vx;
    }
  }
}
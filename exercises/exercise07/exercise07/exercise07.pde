// Exercise07
//
// Using the mouse button and keys "1" and "2" on the keyboard to play with balls and
// and their musical pitches.
// By keeping the mouse buttom pressed the program will continue to opeare and when 
// released, all actions stop. Keys "1" and "2" add or remove balls form the
// screen with their particular pitchs. A global pitch of all notes changes
// by moving the mouse left and right.  

// Adding library to the program
import processing.sound.*;

// The Array of balls
ArrayList<Ball> balls = new ArrayList<Ball>();


// Creats the initial size and color of the display
void setup() {
  size(640, 480);
  background(0);
}

// Draws and updates the position of the balls and the assigned pitch to each ball
void draw() {
  // Drawing and playing while mouse button is pressed
  if (mousePressed) {
    background(0);
    
    // checking throigh each ball in the ArrayList
    for (Ball ball : balls) {
      float newRate = map(mouseX, 0, width, 0.01, 10);
      ball.pitch.rate(newRate);
      ball.update();
      ball.display();
    }
  }
}

// Checking if specific keys are pressed 
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
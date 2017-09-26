// Setting initial background color to 0 (black)
color backgroundColor = color(0);

// Number of "static" noise objects 
int numStatic = 1000;

// Minimal size of a static rect (1 pix)
int staticSizeMin = 1;

// Max size of static rect (3 pix)
int staticSizeMax = 3;

// Color of the static rect 200 (grey)
color staticColor = color(200);

// Holds position of the peddel along the X axis
int paddleX;

// Holds position of the peddel along the Y axis
int paddleY;

// Holds number of pixels the paddle should be moved for on the next draw cycle
// If negative value - move left, if possitive value - move right
int paddleVX;

// Represents the speed of movement of the paddle along the x-axis
// (i.e. how many pixels the paddle is moved each time LEFT or RIGHT button is pressed)
int paddleSpeed = 10;

// Width of the paddle
int paddleWidth = 128;

// Height of the padde
int paddleHeight = 16;

// Color of the paddle 255 (white)
color paddleColor = color(255);

// Positin of the ball alog the x-axis
int ballX;

// Positin of the ball alog the y-axis
int ballY;

// Holds how many pixels along the x-axis the ball should be moved
// in the next draw cycle
int ballVX;

// Holds how many pixels along the y-axis the ball should be moved
// in the next draw cycle
int ballVY;

// Speed of the ball (number of ixels the ball is moved per draw cycle)
int ballSpeed = 5;

// Size of the ball (i.e size of the sides of the ball rect)
int ballSize = 16;

// The color of the ball 255 (white)
color ballColor = color(255);

// Initial setup of the scene, called once before starting the animations
void setup() {
  
  // Setting size of the screen to 640 px width and 480 px hight
  size(640, 480);
  
  // Calling setupPaddle() function to set up the paddle variables
  setupPaddle();
  
  // Calling setupBall() function to set up the ball variables
  setupBall();
}

// Sets initial values for paddle variables
void setupPaddle() {
  // Setting the paddle to be on center of the bottom edge of the screen, stationary
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

// Sets initial values for ball variables
void setupBall() {
  // Setting the ball to be on center of the screen, moving towrd bottom right,
  // moving with a predefined speed
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

// Called directly after setup() and executes continuously
// All Processing programs update the screen at the end of draw()
void draw() {
  
  // Setting the color for the background of the Processing window
  background(backgroundColor);
  
  // Calling functin that draws the static noise on the screen
  drawStatic();
  
  // Calling functin that updates the values in paddle position variables
  updatePaddle();
  
  // Calling functin that updates the values in the ball position variables
  updateBall();
  
  // Calling functin that draws the paddle on the screen, accordng to the values in paddle position variables
  drawPaddle();
  
  // Calling functin that draws the ball on the screen, accordng to the values in ball position variables
  drawBall();
}

// Draws the static noise background on the screen
void drawStatic() {
  // In the loop, iterating over each static pixel, (from 0 to 1000)
  for (int i = 0; i < numStatic; i++) {
   // Calculating randomly position x, y and size for a noise pixel.
   // and drawing it on the screen
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}

// Updates the values in paddle position variables
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}

// Updates the values in ball position variables
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  
  // Calling functions that handle cases like: ball hist the paddle, ball hits the wall,
  // and ball hits the bottom of the screen
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}

// Draws the paddle on the screen, accordng to the values in paddle position variables
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}

// Draws the ball on the screen, accordng to the values in ball position variables
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}

// Updates position of the ball if it touches the paddle
void handleBallHitPaddle() {
  // Checking if ball overlaps (touches) the paddle and readjusting its position
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}

// Returns true if ball overlaps (touches) the paddle, and false otherwise
boolean ballOverlapsPaddle() {
  // Checking if ball overlaps (touches) the paddle
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}

// Updates position of the ball if it reaches the bottom of the screen 
void handleBallOffBottom() {
  // Checking if ball reached the bottom of the screen
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
  }
}

// Return true if ball reached the bottom of the screen, and false otherwise
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}

// Updates position of the ball if it reaches the side of the screen
void handleBallHitWall() {
  // Checking if ball reached the left side of the screen
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  }
  // Checking if ball reached the right side of the screen
  else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}

// Handling 'key pressed' event
void keyPressed() {
  // Checking if 'left' button was pressed
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  }
  // Checking if 'right' button was pressed
  else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}

// Handling 'key released' event
void keyReleased() {
  // Checking if 'left' button was released and paddle was moving left
  if (keyCode == LEFT && paddleVX < 0) {
    // Stop the move
    paddleVX = 0;
  }
  // Checking if 'right' button was released and paddle was moving right
  else if (keyCode == RIGHT && paddleVX > 0) {
    // Stop the move
    paddleVX = 0;
  }
}